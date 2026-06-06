#!/usr/bin/env python3
"""Extract all programs from May 20 agentportal screenshots (all universities)."""
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path(__file__).resolve().parent / "agentportal_programs_may20_all.json"
SUMMARY = Path(__file__).resolve().parent / "agentportal_programs_may20_all_summary.json"

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

# OCR fragment -> canonical name (must exist in DB or be inserted)
UNI_ALIASES: list[tuple[re.Pattern[str], str]] = [
    (re.compile(r"aydin|aydın", re.I), "Aydın University"),
    (re.compile(r"\barel\b", re.I), "Arel University"),
    (re.compile(r"beykent", re.I), "Beykent University"),
    (re.compile(r"istinye|i̇stinye|istinge", re.I), "İstinye University"),
    (re.compile(r"uskudar|üsküdar", re.I), "Üsküdar University"),
    (re.compile(r"bah[cç]e[sş]ehir|bahcesehir", re.I), "Bahçeşehir University"),
    (re.compile(r"lefke|avrupa.*lefke|eul", re.I), "European University of Lefke"),
    (re.compile(r"turk.*hava|thk", re.I), "Türk Hava Kurumu University"),
    (re.compile(r"altinbas|altınbaş", re.I), "Altınbaş University"),
    (re.compile(r"biruni", re.I), "Biruni University"),
    (re.compile(r"\bciu\b", re.I), "CIU University"),
    (re.compile(r"isik|i[sş]ik|sik\s+university", re.I), "Işık University"),
    (re.compile(r"final\s+international|final\s+university", re.I), "Final International University"),
    (re.compile(r"bezmialem", re.I), "Bezmialem Vakıf University"),
    (re.compile(r"acibadem", re.I), "Acibadem University"),
    (re.compile(r"medipol", re.I), "Medipol University"),
    (re.compile(r"okan", re.I), "Okan University"),
    (re.compile(r"halic|hali[cç]", re.I), "Haliç University"),
    (re.compile(r"kent\s+university", re.I), "Kent University"),
    (re.compile(r"lokman", re.I), "Lokman Hekim University"),
]

PORTAL_EXPECTED = {
    "Aydın University": 357,
    "Arel University": 127,
    "Beykent University": 199,
}


def canonical_uni(raw: str | None) -> str | None:
    if not raw:
        return None
    t = (
        raw.replace("urkey", "")
        .replace("Turkey", "")
        .replace("prus", "")
        .replace("Cyprus", "")
        .strip()
    )
    t = re.sub(r"\s*[xX|]+\s*[xXv]?\s*$", "", t).strip()
    t = re.sub(r"^\d+\s+", "", t)
    if not t or len(t) < 8:
        return None
    if t.upper() in {"UNIVERSITY", "COUNTRY", "PROGRAM"}:
        return None
    for pat, name in UNI_ALIASES:
        if pat.search(t):
            return name
    if "university" in t.lower() and len(t.split()) >= 2:
        return t
    return None


def detect_uni_from_rows(anns) -> str | None:
    """Infer university from the UNIVERSITY column in table rows."""
    counts: Counter[str] = Counter()
    for text, conf, box in anns:
        if conf < 0.35:
            continue
        x, y, w, h = box
        if y < 218 or not (395 <= x <= 520):
            continue
        c = canonical_uni(text.strip())
        if c:
            counts[c] += 1
    if not counts:
        return None
    return counts.most_common(1)[0][0]


def detect_filter_uni(anns) -> str | None:
    """Read active university filter chip below the Programs search bar."""
    candidates: list[tuple[float, str]] = []
    for text, conf, box in anns:
        if conf < 0.35:
            continue
        x, y, w, h = box
        if y < 145 or y > 215 or x < 280 or x > 520:
            continue
        t = text.strip()
        if "university" not in t.lower() and "ünivers" not in t.lower():
            continue
        c = canonical_uni(t)
        if c:
            candidates.append((conf, c))
    if not candidates:
        return None
    candidates.sort(reverse=True)
    return candidates[0][1]


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


def extract_image(path: Path, forced_uni: str) -> list[dict]:
    anns = ocrmac.OCR(str(path), language_preference=["en-US"]).recognize(px=True)
    toks = []
    for text, conf, box in anns:
        if conf < 0.25:
            continue
        x, y, w, h = box
        if x < 115 or y < 218:
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
            if abs(ln[0][2] - y) <= 12:
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
            if x < 400:
                if AR_RE.search(t):
                    if len(t) > len(name_ar):
                        name_ar = t
                elif (
                    "university" not in t.lower()
                    and "turkey" not in t.lower()
                    and "cyprus" not in t.lower()
                    and not t.startswith("$")
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
        if cash is not None and cash < 1000:
            cash = None
        years = None
        for t, _x, _y in vals:
            if t.isdigit() and int(t) <= 6:
                years = int(t)
        if before is None or cost is None:
            continue
        if before < 800 or cost < 800:
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


def dedupe_key(r: dict) -> tuple:
    return (
        r["university"],
        re.sub(r"\s+", " ", r["name"].lower()).strip(),
        r["degree"],
        r["language"],
    )


def main() -> None:
    paths = sorted(IMG_DIR.glob(GLOB))
    all_rows: list[dict] = []
    per_image: dict[str, int] = {}
    image_uni: dict[str, str | None] = {}

    for p in paths:
        anns = ocrmac.OCR(str(p), language_preference=["en-US"]).recognize(px=True)
        uni = detect_filter_uni(anns) or detect_uni_from_rows(anns)
        image_uni[p.name] = uni
        if not uni:
            per_image[p.name] = 0
            continue
        batch = extract_image(p, forced_uni=uni)
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

    gaps = {u: PORTAL_EXPECTED[u] - by_uni.get(u, 0) for u in PORTAL_EXPECTED}

    summary = {
        "screenshots": len(paths),
        "images_with_detected_uni": sum(1 for u in image_uni.values() if u),
        "total_unique_programs": len(rows),
        "by_university": dict(by_uni),
        "availability_by_university": dict(avail),
        "expected_from_portal": PORTAL_EXPECTED,
        "gaps_vs_portal": gaps,
        "per_image_row_counts": per_image,
        "image_university": image_uni,
        "images_with_zero_rows": [k for k, v in per_image.items() if v == 0],
    }
    SUMMARY.write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8")

    print("screenshots", len(paths))
    print("detected uni images", summary["images_with_detected_uni"])
    print("unique programs", len(rows))
    print("by university", dict(by_uni))
    print("gaps", gaps)
    print("wrote", OUT)


if __name__ == "__main__":
    main()
