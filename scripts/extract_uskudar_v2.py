#!/usr/bin/env python3
"""Improved Üsküdar program extraction — row-anchored on degree column."""
from __future__ import annotations

import json
import re
from collections import Counter
from pathlib import Path

from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path(__file__).resolve().parents[1] / "scripts" / "uskudar_programs.json"

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
    "QUOTA FULL",
    "AGENTS",
    "INGAZGATE",
    "RESULTS",
    "SHOWING",
    "OF",
    "PAGE",
    "FILTER",
    "CLEAR",
    "ALL",
    "APPLY",
    "GRID",
    "LIST",
}


def norm_degree(token: str) -> str | None:
    t = token.strip().lower()
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
    return None


def is_skip(t: str) -> bool:
    u = t.strip().upper()
    if u in SKIP:
        return True
    if u.startswith("RESULTS") or u.startswith("SHOWING"):
        return True
    if re.match(r"^\d{1,2}$", u) and len(u) <= 2:
        return False
    if re.match(r"^20\d{2}$", u):
        return True
    return False


def default_years(degree: str, name: str) -> int:
    n = name.lower()
    if degree == "Diploma":
        return 2
    if degree == "PhD":
        return 4
    if degree == "Master":
        return 2 if "thesis" in n or "with thesis" in n else 1
    if "medicine" in n:
        return 6
    if "dentistry" in n:
        return 5
    return 4


def extract_image(path: Path) -> list[dict]:
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
    toks: list[tuple[str, float, float, float, float]] = []
    for text, conf, box in anns:
        if conf < 0.22:
            continue
        x, y, w, h = box
        t = text.strip()
        if not t or is_skip(t):
            continue
        if "University" in t:
            continue
        if x < 130:  # sidebar navigation
            continue
        toks.append((t, x, y, w, h))

    if not toks:
        return []

    # Row anchors: degree labels in the right half of the table.
    anchors: list[tuple[float, str]] = []
    for t, x, y, w, h in toks:
        d = norm_degree(t)
        if d and x >= 580:
            anchors.append((y, d))
    anchors.sort(key=lambda z: z[0])

    clusters: list[tuple[float, str]] = []
    for y, d in anchors:
        if clusters and abs(clusters[-1][0] - y) < 32:
            continue
        clusters.append((y, d))

    out: list[dict] = []
    for cy, degree in clusters:
        band = [(t, x, y) for t, x, y, w, h in toks if abs(y - cy) <= 18]
        if not band:
            continue

        lang = ""
        numbers: list[tuple[int, float]] = []
        name_parts: list[str] = []
        available = True
        junk = re.compile(
            r"\b(students?|applications?|agents?|dashboard|complaints?|news|scholarships?)\b",
            re.I,
        )

        for t, x, y in sorted(band, key=lambda z: (z[2], z[1])):
            tl = t.lower()
            if "quota full" in tl:
                available = False
            l = norm_lang(t)
            if l and 500 <= x < 590:
                lang = l
                continue
            m = MONEY_RE.search(t)
            if m and x >= 640:
                numbers.append((int(m.group(1)), x))
                continue
            if x >= 400:
                continue
            if t in ("---", "–", "-", "•"):
                continue
            if AR_RE.search(t):
                continue
            if re.fullmatch(r"\d{1,2}", t):
                continue
            if norm_degree(t):
                continue
            if junk.search(t):
                continue
            if len(t) <= 1:
                continue
            if 150 <= x < 400:
                name_parts.append(t)

        name_en = " ".join(name_parts).strip()
        name_en = re.sub(r"\s+", " ", name_en)
        if name_en.lower().endswith(" with"):
            for t, x, y in band:
                if 150 <= x < 400 and t.lower() in {"thesis", "without thesis"}:
                    name_en = f"{name_en} {t}"
                    break
        if not name_en or not lang:
            continue
        if name_en.lower() in {"with thesis", "without thesis"}:
            continue
        if len(name_en) > 72 or re.search(r"[§()]", name_en):
            continue
        if junk.search(name_en):
            continue
        if len(name_en.split()) > 10:
            continue

        nums_sorted = [n for n, _x in sorted(numbers, key=lambda z: z[1])]
        before = nums_sorted[0] if nums_sorted else None
        cost = nums_sorted[1] if len(nums_sorted) > 1 else before
        cash = nums_sorted[2] if len(nums_sorted) > 2 else None
        years = None
        for t, x, y in band:
            if re.fullmatch(r"[1-6]", t) and x >= 900:
                years = int(t)

        if before is None or cost is None:
            continue
        if before < 1000 or cost < 1000:
            continue

        out.append(
            {
                "university": "Üsküdar University",
                "name": name_en,
                "name_ar": None,
                "degree": degree,
                "language": lang,
                "before": before,
                "cost": cost,
                "cash": cash,
                "years": years or default_years(degree, name_en),
                "available": available,
            }
        )

    return out


def main() -> None:
    imgs = sorted(IMG_DIR.glob("Screenshot_2026-05-17*.png"))
    # Skip non-table captures (no degree anchors).
    all_rows: list[dict] = []
    per_file: list[tuple[str, int]] = []
    for p in imgs:
        rows = extract_image(p)
        per_file.append((p.name, len(rows)))
        all_rows.extend(rows)

    uniq: dict[tuple, dict] = {}
    for r in all_rows:
        key = (
            re.sub(r"\s+", " ", r["name"].lower()).strip(),
            r["degree"],
            r["language"],
            r["before"],
            r["cost"],
        )
        uniq[key] = r

    rows = sorted(uniq.values(), key=lambda r: (r["degree"], r["name"], r["language"]))
    OUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")

    print("per file:")
    for name, n in per_file:
        print(f"  {n:2d}  {name}")
    print("raw", len(all_rows), "unique", len(rows))
    print("degrees", Counter(r["degree"] for r in rows))
    print("wrote", OUT)


if __name__ == "__main__":
    main()
