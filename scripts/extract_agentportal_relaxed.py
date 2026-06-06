#!/usr/bin/env python3
"""Relaxed OCR extraction: lower price floor, wider columns, more rows per page."""
from __future__ import annotations

import json
import re
from collections import Counter
from pathlib import Path

from extract_agentportal_all_assets import (
    UNI_ALIASES,
    canonical_uni,
    dedupe_key,
    detect_filter_uni,
    detect_uni_from_rows,
    norm_degree,
    norm_lang,
    AR_RE,
    SKIP,
)
from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path(__file__).resolve().parent / "agentportal_programs_relaxed.json"
MONEY_RE = re.compile(r"[$€]?\s*([0-9]{2,6})")
MIN_PRICE = 200


def is_program_page(anns) -> bool:
    blob = " ".join(t.lower() for t, c, _ in anns if c > 0.4)
    return "programs" in blob and ("degree" in blob or "before discount" in blob)


def extract_image(path: Path, forced_uni: str) -> list[dict]:
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
    toks = []
    for text, conf, box in anns:
        if conf < 0.2:
            continue
        x, y, w, h = box
        if x < 100 or y < 200:
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
            if abs(ln[0][2] - y) <= 14:
                ln.append((t, x, y))
                placed = True
                break
        if not placed:
            lines.append([(t, x, y)])

    out: list[dict] = []
    for vals in lines:
        vals.sort(key=lambda z: z[1])
        line_text = " ".join(t for t, _, _ in vals).lower()
        name_en = ""
        name_ar = ""
        degree = ""
        language = ""
        numbers: list[int] = []
        for t, x, _y in vals:
            if x < 420:
                if AR_RE.search(t):
                    if len(t) > len(name_ar):
                        name_ar = t
                elif (
                    "university" not in t.lower()
                    and "turkey" not in t.lower()
                    and "cyprus" not in t.lower()
                    and not re.match(r"^[$€]", t)
                    and len(t) > 2
                    and (not name_en or len(t) > len(name_en))
                ):
                    name_en = t
            d = norm_degree(t)
            if d:
                degree = d
            l = norm_lang(t)
            if l:
                language = l
            for m in MONEY_RE.finditer(t):
                v = int(m.group(1))
                if v >= MIN_PRICE:
                    numbers.append(v)
        if not name_en or not degree or not language:
            continue
        if re.match(r"^quota\s*full", name_en, flags=re.IGNORECASE):
            name_en = re.sub(r"^quota\s*full\s*", "", name_en, flags=re.I).strip()
            if len(name_en) < 3:
                continue
        before = numbers[0] if numbers else None
        cost = numbers[1] if len(numbers) > 1 else before
        cash = numbers[2] if len(numbers) > 2 and numbers[2] >= 1000 else None
        years = None
        for t, _x, _y in vals:
            if t.isdigit() and 1 <= int(t) <= 6:
                years = int(t)
        if before is None or cost is None:
            continue
        if before < MIN_PRICE or cost < MIN_PRICE:
            continue
        default_years = 4
        if degree == "Diploma":
            default_years = 2
        elif degree == "Master":
            default_years = 2 if "thesis" in name_en.lower() else 1
        elif degree == "PhD":
            default_years = 4
        out.append(
            {
                "university": forced_uni,
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


def main() -> None:
    paths = sorted(IMG_DIR.glob("*.png"))
    all_rows: list[dict] = []
    skipped = 0
    for i, p in enumerate(paths):
        if i % 50 == 0:
            print(f"{i}/{len(paths)}...", flush=True)
        anns = ocrmac.OCR(str(p), language_preference=["en-US"]).recognize(px=True)
        if not is_program_page(anns):
            skipped += 1
            continue
        row_uni = detect_uni_from_rows(anns)
        filter_uni = detect_filter_uni(anns)
        uni = row_uni or filter_uni
        if row_uni and filter_uni and row_uni != filter_uni:
            uni = row_uni
        if not uni:
            continue
        mapped = canonical_uni(uni) or uni
        all_rows.extend(extract_image(p, mapped))

    uniq: dict[tuple, dict] = {}
    for r in all_rows:
        r["university"] = canonical_uni(r["university"]) or r["university"]
        uniq[dedupe_key(r)] = r
    rows = list(uniq.values())
    OUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")
    print("skipped non-program pages", skipped)
    print("unique programs", len(rows))
    print("wrote", OUT)


if __name__ == "__main__":
    main()
