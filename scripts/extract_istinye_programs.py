#!/usr/bin/env python3
"""Extract İstinye University programs from agentportal screenshots (2026-05-17)."""
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path(__file__).resolve().parent / "istinye_programs.json"
SUMMARY = Path(__file__).resolve().parent / "istinye_programs_summary.json"
UNI = "İstinye University"

GLOBS = (
    "Screenshot_2026-05-17_at_15.56*.png",
    "Screenshot_2026-05-17_at_16.24*.png",
)

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


def norm_degree(token: str) -> str | None:
    t = token.strip().lower()
    if "combined" in t and "phd" in t:
        return "CombinedPhD"
    if re.search(r"\bphd\b", t):
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


def normalize_name(name: str) -> str:
    n = re.sub(r"\s+", " ", name).strip()
    n = re.sub(r"\s+W\s*$", "", n, flags=re.IGNORECASE)
    n = re.sub(r"\s+\|\s*$", "", n)
    return n


def extract_image(path: Path) -> list[dict]:
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
    quota_ys: list[float] = []
    for text, conf, box in anns:
        if conf < 0.3:
            continue
        x, y, w, h = box
        if re.search(r"quota\s*full", text, flags=re.IGNORECASE) and x < 200:
            quota_ys.append(y + h / 2)

    toks = []
    for text, conf, box in anns:
        if conf < 0.26:
            continue
        x, y, w, h = box
        if x < 115 or y < 148:
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
            if abs(ln[0][2] - y) <= 13:
                ln.append((t, x, y))
                placed = True
                break
        if not placed:
            lines.append([(t, x, y)])

    out: list[dict] = []
    for vals in lines:
        vals.sort(key=lambda z: z[1])
        line_text = " ".join(t for t, _, _ in vals).lower()
        if "quota full" in line_text and len(vals) < 3:
            continue

        name_en = ""
        name_ar = ""
        degree = ""
        language = ""
        numbers: list[int] = []
        for t, x, _y in vals:
            if x < 400:
                if AR_RE.search(t):
                    if len(t) > len(name_ar):
                        name_ar = t
                elif (
                    "University" not in t
                    and "Turkey" not in t
                    and "Istinye" not in t
                    and "İstinye" not in t
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

        line_y = sum(y for _, _, y in vals) / len(vals)
        quota_full = "quota full" in line_text or any(
            abs(line_y - qy) <= 18 for qy in quota_ys
        )
        before = numbers[0] if numbers else None
        cost = numbers[1] if len(numbers) > 1 else before
        cash = numbers[2] if len(numbers) > 2 and len(numbers) > 2 else None

        if before is None or cost is None:
            if quota_full and numbers:
                before = numbers[0]
                cost = numbers[0]
            else:
                continue

        if before < 500 or cost < 500:
            continue

        years = None
        for t, _x, _y in vals:
            if t.isdigit() and int(t) <= 6:
                years = int(t)

        default_years = 4
        if degree == "CombinedPhD":
            default_years = 5
        elif degree == "Diploma":
            default_years = 2
        elif degree == "Master":
            default_years = 2 if "thesis" in name_en.lower() else 1
        elif degree == "PhD":
            default_years = 4
        elif "medicine" in name_en.lower():
            default_years = 6
        elif "dentistry" in name_en.lower() and degree == "Bachelor":
            default_years = 5

        name_en = normalize_name(name_en)
        out.append(
            {
                "university": UNI,
                "name": name_en,
                "name_ar": name_ar.strip() or None,
                "degree": degree,
                "language": language,
                "before": before,
                "cost": cost,
                "cash": cash,
                "years": years or default_years,
                "available": not quota_full,
            }
        )
    return out


def dedupe_key(r: dict) -> tuple:
    return (
        normalize_name(r["name"]).lower(),
        r["degree"],
        r["language"],
    )


def main() -> None:
    paths: list[Path] = []
    for pattern in GLOBS:
        paths.extend(sorted(IMG_DIR.glob(pattern)))
    paths = sorted(set(paths))

    all_rows: list[dict] = []
    per_image: dict[str, int] = {}
    for p in paths:
        batch = extract_image(p)
        per_image[p.name] = len(batch)
        all_rows.extend(batch)

    uniq: dict[tuple, dict] = {}
    for r in all_rows:
        k = dedupe_key(r)
        prev = uniq.get(k)
        if not prev:
            uniq[k] = r
            continue
        if not r.get("available") and prev.get("available"):
            uniq[k] = r
        elif r.get("available") == prev.get("available") and (r.get("before") or 0) >= (
            prev.get("before") or 0
        ):
            uniq[k] = r

    rows = list(uniq.values())
    rows.sort(key=lambda r: (r["degree"], r["name"], r["language"]))

    OUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")

    avail = {"available": 0, "quota_full": 0}
    deg = Counter(r["degree"] for r in rows)
    for r in rows:
        if r.get("available", True):
            avail["available"] += 1
        else:
            avail["quota_full"] += 1

    summary = {
        "screenshots": len(paths),
        "total_unique_programs": len(rows),
        "expected_from_portal": 165,
        "gap": 165 - len(rows),
        "by_degree": dict(deg),
        "availability": avail,
        "per_image_row_counts": per_image,
    }
    SUMMARY.write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8")

    print("screenshots", len(paths))
    print("unique programs", len(rows))
    print("expected 165, gap", 165 - len(rows))
    print("by degree", dict(deg))
    print("availability", avail)
    print("wrote", OUT)


if __name__ == "__main__":
    main()
