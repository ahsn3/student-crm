#!/usr/bin/env python3
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path("/Users/ahmedhassan/Desktop/ingazgate/scripts/extracted_programs.json")
USKUDAR_OUT = Path("/Users/ahmedhassan/Desktop/ingazgate/scripts/uskudar_programs.json")

IMAGES = [
    "Screenshot_2026-05-05_at_17.46.51-45935a09-4a4b-4bb7-abf5-dfdfc3f75568.png",
    "Screenshot_2026-05-05_at_17.47.03-f24754b8-da4d-49c9-9ad6-7452ed86b4a1.png",
    "Screenshot_2026-05-05_at_17.46.14-0feaa3c7-45cd-40e5-a80c-698fec7feeb0.png",
    "Screenshot_2026-05-05_at_17.46.21-21dd97af-c056-42d2-bd36-bae06463e5a3.png",
    "Screenshot_2026-05-05_at_17.46.47-04bdbac5-ec21-4afd-9ff3-bc53078ae199.png",
    "Screenshot_2026-05-05_at_17.46.56-8293a4c8-2307-48c8-90ce-6cae40155b59.png",
    "Screenshot_2026-05-05_at_17.46.08-bb5df2fa-731b-431c-9910-c937de138a79.png",
    "Screenshot_2026-05-05_at_17.47.21-ffc9c61e-237c-47de-bdf1-a5cf386beb50.png",
    "Screenshot_2026-05-05_at_17.46.42-1c1fbd28-f8e2-44bf-a4d1-ce3a56446265.png",
    "Screenshot_2026-05-05_at_17.47.12-43c03a9b-2a84-4ce0-b951-26bae8ec0686.png",
    "Screenshot_2026-05-05_at_17.47.02-7b2c2e12-077b-4512-91a4-7831f1abad0d.png",
    "Screenshot_2026-05-05_at_17.46.23-70a7bf31-862e-43d9-9269-3cd1f432979e.png",
    "Screenshot_2026-05-05_at_17.47.10-8d2b90c5-44e1-4e2e-a1b4-ace9abea73be.png",
    "Screenshot_2026-05-05_at_17.47.17-744884d6-112b-4d80-9036-dd3f5c53bc35.png",
    "Screenshot_2026-05-05_at_17.46.02-a9c8da1c-8833-47a1-a945-4dccc01209b2.png",
    "Screenshot_2026-05-05_at_17.46.10-7f007580-e550-4105-83f6-e75d3aee5cf6.png",
    "Screenshot_2026-05-05_at_17.46.58-64a968b7-b108-4f9e-b0a3-1d17478a857b.png",
    "Screenshot_2026-05-05_at_17.46.04-ffc38b65-d5cc-4f2c-bb45-8d80cb866624.png",
    "Screenshot_2026-05-05_at_17.46.52-a3e03186-041c-4621-b4ec-8bdb4ec5d80d.png",
    "Screenshot_2026-05-05_at_17.46.26-790e6359-21ff-4ea4-b599-0c639b5bc59d.png",
    "Screenshot_2026-05-05_at_17.46.46-eba573aa-a566-4de8-bb33-cf30271596bb.png",
    "Screenshot_2026-05-05_at_17.47.16-f94ed41b-e185-4650-8f1c-6e269bf7b99a.png",
    "Screenshot_2026-05-05_at_17.46.30-5c65884f-d28f-43a8-8fc3-70c9a364edb5.png",
    "Screenshot_2026-05-05_at_17.46.43-777da928-efb9-4ea1-ad97-77d0c62ce0c3.png",
    "Screenshot_2026-05-05_at_17.46.34-dd7e2725-3cba-4078-8998-cf0f3a696c10.png",
    "Screenshot_2026-05-05_at_17.46.38-0925c528-af74-49f7-bf04-2ab44ac434af.png",
]

AR_RE = re.compile(r"[\u0600-\u06FF]")
MONEY_RE = re.compile(r"\$?\s*([0-9]{3,6})")


def norm_uni(token: str) -> str | None:
    # OCR sometimes misreads "Turkey" as "...urkey", and sometimes drops diacritics.
    t = (
        token.replace("Turkey", "")
        .replace("turkey", "")
        .replace("urkey", "")
        .strip()
    )
    if re.search(r"nisant", t, flags=re.IGNORECASE):
        return "Nişantaşı University"
    if re.search(r"fenerbah", t, flags=re.IGNORECASE):
        return "Fenerbahçe University"
    if re.search(r"atilim", t, flags=re.IGNORECASE):
        return "Atılım University"
    if re.search(r"kyrenia", t, flags=re.IGNORECASE):
        return "Kyrenia University"
    if re.search(r"kadirhas|kadir\s*has", t, flags=re.IGNORECASE):
        return "Kadir Has University"
    if "Kültür University" in t or "Kultur University" in t:
        return "Kültür University"
    if "Hasan Kalyoncu University" in t:
        return "Hasan Kalyoncu University"
    if "Antalya Bilim University" in t:
        return "Antalya Bilim University"
    if re.search(r"uskudar|üsküdar|usküdar", t, flags=re.IGNORECASE):
        return "Üsküdar University"
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
    return None


def extract_image(path: Path) -> list[dict]:
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
    uni = None
    for text, conf, _box in anns:
        if conf < 0.45:
            continue
        u = norm_uni(text.strip())
        if u:
            uni = u
            break
    toks = []
    for text, conf, box in anns:
        if conf < 0.28:
            continue
        x, y, w, h = box
        if x < 120 or y < 165:
            continue
        toks.append((text.strip(), x, y, w, h, conf))
    if not uni:
        return []

    toks.sort(key=lambda z: z[2])
    lines: list[list[tuple[str, float, float]]] = []
    for t, x, y, w, h, conf in toks:
        if t.upper() in {
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
        }:
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
        name_en = ""
        name_ar = ""
        degree = ""
        language = ""
        numbers: list[int] = []
        for t, x, _y in vals:
            if x < 385:
                if AR_RE.search(t):
                    name_ar = t if len(t) > len(name_ar) else name_ar
                elif "University" not in t and len(t) > len(name_en):
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
                "years": years or (2 if degree == "Diploma" else 4),
            }
        )
    return out


def extract_image_forced_uni(path: Path, uni: str) -> list[dict]:
    """Like extract_image but assumes a single university for the whole screenshot."""
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
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
        if t.upper() in {
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
        }:
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
                elif "University" not in t and "Turkey" not in t and len(t) > len(name_en):
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
        elif "medicine" in name_en.lower() or "dentistry" in name_en.lower():
            default_years = 6 if "medicine" in name_en.lower() else 5
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
                "available": "quota full" not in " ".join(t for t, _, _ in vals).lower(),
            }
        )
    return out


def main() -> None:
    all_rows: list[dict] = []
    # Latest batch: Üsküdar University screenshots (2026-05-17).
    img_names = sorted(
        p.name for p in IMG_DIR.glob("Screenshot_2026-05-17*.png") if p.is_file()
    )
    force_uni = "Üsküdar University" if img_names else None
    if not img_names:
        img_names = sorted(
            p.name for p in IMG_DIR.glob("Screenshot_2026-05-06_at_10.*.png") if p.is_file()
        )
    if not img_names:
        img_names = sorted(
            p.name for p in IMG_DIR.glob("Screenshot_2026-05-06*.png") if p.is_file()
        )
    if not img_names:
        img_names = IMAGES
    for fn in img_names:
        p = IMG_DIR / fn
        if not p.exists():
            continue
        batch = extract_image(p)
        if force_uni and not batch:
            # Re-run with forced university when OCR misses the header.
            batch = extract_image_forced_uni(p, force_uni)
        elif force_uni:
            for r in batch:
                r["university"] = force_uni
        all_rows.extend(batch)
    uniq = {}
    for r in all_rows:
        key = (
            r["university"],
            re.sub(r"\s+", " ", r["name"].lower()).strip(),
            r["degree"],
            r["language"],
            r["before"],
            r["cost"],
        )
        uniq[key] = r
    rows = list(uniq.values())
    rows.sort(key=lambda r: (r["university"], r["degree"], r["name"], r["language"]))
    OUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")
    uskudar = [r for r in rows if r["university"] == "Üsküdar University"]
    USKUDAR_OUT.write_text(json.dumps(uskudar, ensure_ascii=False, indent=2), encoding="utf-8")
    counts = Counter(r["university"] for r in rows)
    print("rows", len(rows), counts)
    print("uskudar", len(uskudar))
    print("wrote", OUT)
    print("wrote", USKUDAR_OUT)


if __name__ == "__main__":
    main()
