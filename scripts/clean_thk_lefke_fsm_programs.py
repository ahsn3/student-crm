#!/usr/bin/env python3
"""Clean OCR output, validate prices, apply availability, and merge manual supplements."""
from __future__ import annotations

import json
import re
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent
SRC = ROOT / "thk_lefke_fsm_programs_clean.json"
SUPPLEMENT = ROOT / "thk_lefke_fsm_supplement.json"
ARABIC = ROOT / "thk_lefke_fsm_arabic.json"
OUT = ROOT / "thk_lefke_fsm_programs_clean.json"

THK = "Türk Hava Kurumu University"
LEFKE = "European University of Lefke"
FSM = "Fatih Sultan Mehmet University"

LEFKE_PRICES = {(2300, 2300), (3100, 3100), (4000, 2400), (9000, 6000)}
THK_PRICES = {
    (8750, 3600),
    (9000, 6750),
    (10000, 4000),
    (10000, 5000),
    (16500, 8250),
    (17500, 12000),
}
FSM_BACHELOR = {(5000, 5000), (6000, 6000), (7000, 7000)}
FSM_MASTER = {(3000, 3000), (3250, 3250), (3500, 3500)}
FSM_PHD = {(9000, 4500), (11000, 6500), (12000, 8000)}


NAME_FIXES = {
    "interior architecture and environmental desigr": "Interior Architecture And Environmental Design",
    "nutntion and dietetics": "Nutrition And Dietetics",
    "altemative energy and sources technology": "Alternative Energy And Sources Technology",
    "alterative energy and sources technology": "Alternative Energy And Sources Technology",
    "conservation and restoration of cultural asse": "Conservation And Restoration Of Cultural Assets",
    "international economics and finance with the": "International Economics And Finance With Thesis",
    "electrical and computer engineering with the": "Electrical And Computer Engineering With Thesis",
    "mechanical and aeronautical engineering with": "Mechanical and Aeronautical Engineering With Thesis",
    "puolle law wit thesis": "Public Law With Thesis",
    "artificial intelligence and data science with tt": "Artificial Intelligence And Data Science With Thesis",
    "preservation and management of cultural her": "Preservation And Management Of Cultural Heritage With Thesis",
    "psychological counselling and guidance with": "Psychological Counselling And Guidance With Thesis",
    "architectural conservation restoration with tr": "Architectural Conservation Restoration With Thesis",
    "quote full aviation management with thesis": "Aviation Management With Thesis",
    "unmanned and autonomous systems enginee": "Unmanned and Autonomous Systems Engineering With Thesis",
}


def clean_name(name: str) -> str:
    n = re.sub(r"(?i)\bquota\s*full\b", "", name)
    n = re.sub(r"(?i)turk\s*hava\s*kurumu.*", "", n)
    n = re.sub(r"(?i)yurkey|urkey", "", n)
    n = re.sub(r"^\(0\)\s*", "", n)
    n = re.sub(r"\s+", " ", n).strip(" -")
    fixed = NAME_FIXES.get(n.lower())
    return fixed if fixed else n


def fix_prices(r: dict) -> dict | None:
    b, c = int(r["before"]), int(r["cost"])
    if c > 15000 and b in (2300, 3100, 4000, 9000):
        c = b
    r["before"], r["cost"] = b, c
    return r


def valid_row(r: dict) -> bool:
    u, d = r["university"], r["degree"]
    pair = (int(r["before"]), int(r["cost"]))
    if pair[0] > 20000 or pair[1] > 20000:
        return False
    if u == LEFKE:
        return pair in LEFKE_PRICES
    if u == THK:
        return pair in THK_PRICES
    if u == FSM:
        if d == "PhD":
            return pair in FSM_PHD
        if d == "Master":
            return pair in FSM_MASTER
        if d == "Bachelor":
            return pair in FSM_BACHELOR
        return pair[0] >= 3000 and pair[1] >= 3000
    return False


def row_key(r: dict) -> tuple:
    return (
        r["university"],
        r["name"].lower(),
        r["degree"],
        r["language"],
        r["before"],
        r["cost"],
    )


def load_arabic() -> dict[str, str]:
    if not ARABIC.exists():
        return {}
    data = json.loads(ARABIC.read_text(encoding="utf-8"))
    out: dict[str, str] = {}
    for item in data:
        key = "|".join(
            [
                item["university"],
                item["name"].lower(),
                item.get("degree", ""),
                item.get("language", ""),
            ]
        )
        out[key] = item["name_ar"]
    return out


def main() -> None:
    rows = json.loads(SRC.read_text(encoding="utf-8"))
    arabic = load_arabic()
    cleaned: list[dict] = []

    for r in rows:
        r = dict(r)
        r["name"] = clean_name(r["name"])
        if not r["name"]:
            continue
        r = fix_prices(r)
        if r is None or not valid_row(r):
            continue
        cash = r.get("cash")
        if cash is not None and int(cash) < 1000:
            r["cash"] = None
        if r["university"] == THK and r["degree"] == "Master":
            r["available"] = False
        key = "|".join([r["university"], r["name"].lower(), r["degree"], r["language"]])
        if key in arabic:
            r["name_ar"] = arabic[key]
        cleaned.append(r)

    if SUPPLEMENT.exists():
        for r in json.loads(SUPPLEMENT.read_text(encoding="utf-8")):
            r = dict(r)
            r["name"] = clean_name(r["name"])
            if r["university"] == THK and r["degree"] == "Master":
                r["available"] = False
            key = "|".join([r["university"], r["name"].lower(), r["degree"], r["language"]])
            if key in arabic:
                r["name_ar"] = arabic[key]
            cleaned.append(r)

    uniq: dict[tuple, dict] = {}
    for r in cleaned:
        uniq[row_key(r)] = r

    out = list(uniq.values())
    out.sort(key=lambda r: (r["university"], r["degree"], r["name"]))
    OUT.write_text(json.dumps(out, ensure_ascii=False, indent=2), encoding="utf-8")
    print("cleaned", len(out))
    print(Counter(r["university"] for r in out))
    print("with Arabic", sum(1 for r in out if r.get("name_ar")))
