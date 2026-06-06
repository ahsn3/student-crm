#!/usr/bin/env python3
"""Extract Aydın, Arel, and Beykent programs from May 20 agentportal screenshots."""
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path(__file__).resolve().parent / "agentportal_programs_may20_targeted.json"
SUMMARY = Path(__file__).resolve().parent / "agentportal_programs_may20_targeted_summary.json"

GLOB = "Screenshot_2026-05-20*.png"

AR_RE = re.compile(r"[\u0600-\u06FF]")
MONEY_RE = re.compile(r"\$?\s*([0-9]{3,6})")
SKIP = {
    "PROGRAM",
    "UNIVERSITY",
    "COUNTRY",
    "LANGUAGE",
    "DEGREE",
    "BEFORE DISCOUNT",
    "COST",
    "CASH PRICE",
    "PREP SCHOOL",
    "DEPOSIT",
    "YEARS",
    "UPDATED AT",
    "FILTERS",
    "PROGRAMS",
    "TURKEY",
    "CYPRUS",
    "QUOTA FULL",
    "FILTER",
    "CLEAR",
    "AGENTS",
    "INGAZGATE",
}

# Canonical names must match V5__seed_agentportal_universities.sql
UNI_CANONICAL = {
    "Aydın University": "Aydın University",
    "Aydin University": "Aydın University",
    "Arel University": "Arel University",
    "Beykent University": "Beykent University",
}

EXPECTED = {
    "Aydın University": 357,
    "Arel University": 127,
    "Beykent University": 199,
}


def norm_uni(token: str) -> str | None:
    t = (
        token.replace("Turkey", "")
        .replace("turkey", "")
        .replace("urkey", "")
        .strip()
    )
    if re.search(r"aydin|aydın|aydn", t, flags=re.IGNORECASE):
        return "Aydın University"
    if re.search(r"\barel\b", t, flags=re.IGNORECASE):
        return "Arel University"
    if re.search(r"beykent", t, flags=re.IGNORECASE):
        return "Beykent University"
    return None


def detect_uni(anns) -> str | None:
    for text, conf, _box in anns:
        if conf < 0.35:
            continue
        u = norm_uni(text.strip())
        if u:
            return u
    return None


def norm_degree(token: str) -> str | None:
    t = token.strip().lower()
    if "combined" in t and "phd" in t:
        return "CombinedPhD"
    if "phd" in t:
        return "PhD"
    if "master" in t:
        return "Master"
    if "diploma" in t:
        return "Diploma"
    if "bachelor" in t:
        return "Bachelor"
    return None


def norm_lang(token: str) -> str | None:
    t = token.strip().lower()
    if "english" in t:
        return "English"
    if "turkish" in t:
        return "Turkish"
    if "arabic" in t:
        return "Arabic"
    return None


def extract_image(path: Path, forced_uni: str | None = None) -> list[dict]:
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
    uni = forced_uni or detect_uni(anns)
    if not uni:
        return []

    toks = []
    for text, conf, box in anns:
        if conf < 0.28:
            continue
        x, y, w, h = box
        if x < 120 or y < 165:
            continue
        toks.append((text.strip(), x, y, w, h, conf))
    if not toks:
        return []

    toks.sort(key=lambda z: z[2])
    lines: list[list[tuple[str, float, float]]] = []
    for t, x, y, w, h, conf in toks:
        if t.upper() in SKIP:
            continue
        placed = False
        for ln in lines:
            if abs(ln[0][2] - y) <= 11:
                ln.append((t, x, y))
                placed = True
                break
        if not placed:
            lines.append([(t, x, y)])

    out: list[dict] = []
    for vals in lines:
        vals.sort(key=lambda z: z[1])
        line_text = " ".join(t for t, _, _ in vals).lower()
        if "quota full" in line_text and len(vals) < 4:
            continue
        name_en = ""
        name_ar = ""
        degree = ""
        language = ""
        numbers: list[int] = []
        for t, x, _y in vals:
            if x < 385:
                if AR_RE.search(t):
                    if len(t) > len(name_ar):
                        name_ar = t
                elif (
                    "University" not in t
                    and "Turkey" not in t
                    and "Cyprus" not in t
                    and len(t) > len(name_en)
                ):
                    name_en = t
            d = norm_degree(t)
            if d:
                degree = d
            l = norm_lang(t)
            if l:
                language = l
            m = MONEY_RE.search(t)
            if m:
                numbers.append(int(m.group(1)))
        if not name_en or not degree or not language:
            continue
        if re.match(r"^quota\s*full", name_en, flags=re.IGNORECASE):
            continue
        before = numbers[0] if numbers else None
        cost = numbers[1] if len(numbers) > 1 else None
        cash = numbers[2] if len(numbers) > 2 else None
        years = None
        for t, _x, _y in vals:
            if t.isdigit() and int(t) <= 6:
                years = int(t)
        if before is None or cost is None:
            continue
        if before < 1000 or cost < 1000:
            continue
        default_years = 4
        if degree == "Diploma":
            default_years = 2
        elif degree == "Master":
            default_years = 2 if "thesis" in name_en.lower() else 1
        elif degree == "PhD":
            default_years = 4
        elif "medicine" in name_en.lower() and "pharmacology" not in name_en.lower():
            default_years = 6
        elif "dentistry" in name_en.lower() and degree == "Bachelor":
            default_years = 5
        elif "pharmacy" in name_en.lower() and degree == "Bachelor":
            default_years = 5
        out.append(
            {
                "university": uni,
                "name": name_en.strip(),
                "name_ar": name_ar.strip() or None,
                "degree": degree,
                "language": language,
                "before": before,
                "cost": cost,
                "cash": cash,
                "years": years or default_years,
                "available": "quota full" not in line_text,
            }
        )
    return out


def dedupe_key(r: dict) -> tuple:
    return (
        r["university"],
        re.sub(r"\s+", " ", r["name"].lower()).strip(),
        r["degree"],
        r["language"],
        r["before"],
        r["cost"],
    )


def main() -> None:
    paths = sorted(IMG_DIR.glob(GLOB))
    all_rows: list[dict] = []
    per_image: dict[str, int] = {}
    by_image_uni: dict[str, str] = {}

    for p in paths:
        batch = extract_image(p)
        if not batch:
            anns = ocrmac.OCR(str(p), language_preference=["en-US"]).recognize(px=True)
            uni = detect_uni(anns)
            if uni:
                batch = extract_image(p, forced_uni=uni)
        if batch:
            by_image_uni[p.name] = batch[0]["university"]
        per_image[p.name] = len(batch)
        all_rows.extend(batch)

    uniq: dict[tuple, dict] = {}
    for r in all_rows:
        uniq[dedupe_key(r)] = r
    rows = list(uniq.values())
    rows.sort(key=lambda r: (r["university"], r["degree"], r["name"], r["language"]))

    OUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")

    by_uni = Counter(r["university"] for r in rows)
    avail = defaultdict(lambda: {"available": 0, "quota_full": 0})
    for r in rows:
        k = "available" if r.get("available", True) else "quota_full"
        avail[r["university"]][k] += 1

    gaps = {u: EXPECTED[u] - by_uni.get(u, 0) for u in EXPECTED}

    summary = {
        "screenshots": len(paths),
        "total_unique_programs": len(rows),
        "by_university": dict(by_uni),
        "availability_by_university": dict(avail),
        "expected_from_portal": EXPECTED,
        "gaps_vs_portal": gaps,
        "per_image_row_counts": per_image,
        "images_with_zero_rows": [k for k, v in per_image.items() if v == 0],
    }
    SUMMARY.write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8")

    print("screenshots", len(paths))
    print("unique programs", len(rows))
    print("by university", dict(by_uni))
    print("gaps vs portal", gaps)
    print("zero-row images", len(summary["images_with_zero_rows"]))
    print("wrote", OUT)
    print("wrote", SUMMARY)


if __name__ == "__main__":
    main()
