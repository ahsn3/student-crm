#!/usr/bin/env python3
"""Extract THK, European University of Lefke, and Fatih Sultan Mehmet programs from May 17 screenshots."""
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
OUT = Path(__file__).resolve().parent / "thk_lefke_fsm_programs.json"
SUMMARY = Path(__file__).resolve().parent / "thk_lefke_fsm_programs_summary.json"

GLOBS = (
    "Screenshot_2026-05-17_at_17.21*.png",
    "Screenshot_2026-05-17_at_17.22*.png",
    "Screenshot_2026-05-17_at_17.23*.png",
    "Screenshot_2026-05-17_at_17.24*.png",
)

AR_RE = re.compile(r"[\u0600-\u06FF]")
MONEY_RE = re.compile(r"[€$]?\s*([0-9]{3,6})")
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
    "SHOWING",
    "RESULTS",
}


def norm_uni(token: str) -> str | None:
    t = (
        token.replace("Turkey", "")
        .replace("turkey", "")
        .replace("urkey", "")
        .replace("Cyprus", "")
        .replace("cyprus", "")
        .strip()
    )
    if re.search(r"turk\s*hava|thk|kurumu", t, flags=re.IGNORECASE):
        return "Türk Hava Kurumu University"
    if re.search(r"lefke|avrupa\s*university|eul", t, flags=re.IGNORECASE):
        return "European University of Lefke"
    if re.search(r"fatih\s*sultan|fsm", t, flags=re.IGNORECASE):
        return "Fatih Sultan Mehmet University"
    return None


def detect_uni(anns) -> str | None:
    blob = " ".join(t for t, conf, _ in anns if conf >= 0.25).lower()
    if re.search(r"turk\s*hava|thk|kurumu", blob):
        return "Türk Hava Kurumu University"
    if re.search(r"lefke|avrupa\s*university|eul", blob):
        return "European University of Lefke"
    if re.search(r"fatih\s*sultan|\bfsm\b", blob):
        return "Fatih Sultan Mehmet University"
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
    if "phd" in t or t == "ph.d":
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
    if t == "arabic":
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
        if x < 115 or y < 150:
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
        quota_full = "quota full" in line_text
        en_parts: list[str] = []
        for t, x, _y in vals:
            if x < 420:
                if AR_RE.search(t):
                    if len(t) > len(name_ar):
                        name_ar = t
                elif (
                    "University" not in t
                    and "Turkey" not in t
                    and "Cyprus" not in t
                    and "Lefke" not in t
                    and "Avrupa" not in t
                    and "Quota" not in t
                    and t.upper() not in SKIP
                    and not t.isdigit()
                ):
                    en_parts.append(t)
        if en_parts:
            name_en = " ".join(en_parts)
        for t, x, _y in vals:
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
            if t.isdigit() and 1 <= int(t) <= 8:
                years = int(t)
        if before is None or cost is None:
            continue
        if before < 400 or cost < 400:
            continue
        default_years = 4
        if degree == "Diploma":
            default_years = 2
        elif degree == "Master":
            default_years = 2 if "thesis" in name_en.lower() else 1
        elif degree == "PhD":
            default_years = 4
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
                "available": not quota_full,
            }
        )
    return out


UNI_PATTERNS: dict[str, re.Pattern] = {
    "Türk Hava Kurumu University": re.compile(
        r"turk\s*hava|thk|kurumu|hava\s*kurumu", re.IGNORECASE
    ),
    "European University of Lefke": re.compile(
        r"lefke|avrupa\s*university|eul", re.IGNORECASE
    ),
    "Fatih Sultan Mehmet University": re.compile(
        r"fatih\s*sultan|\bfsm\b", re.IGNORECASE
    ),
}


def uni_score(anns, uni: str) -> int:
    blob = " ".join(t for t, conf, _ in anns if conf >= 0.25)
    return len(UNI_PATTERNS[uni].findall(blob))


def pick_uni(anns) -> str | None:
    detected = detect_uni(anns)
    if detected:
        return detected
    scores = {u: uni_score(anns, u) for u in UNI_PATTERNS}
    best = max(scores, key=scores.get)
    return best if scores[best] > 0 else None


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
    paths: list[Path] = []
    for pattern in GLOBS:
        paths.extend(sorted(IMG_DIR.glob(pattern)))
    paths = sorted(set(paths))

    all_rows: list[dict] = []
    per_image: dict[str, int] = {}
    TARGET_UNIS = (
        "Türk Hava Kurumu University",
        "European University of Lefke",
        "Fatih Sultan Mehmet University",
    )

    for p in paths:
        anns = ocrmac.OCR(str(p), language_preference=["en-US"]).recognize(px=True)
        blob = " ".join(t for t, conf, _ in anns if conf >= 0.25).lower()
        chosen = pick_uni(anns)
        batch = extract_image(p, forced_uni=chosen) if chosen else []
        if not batch:
            scores = {u: uni_score(anns, u) for u in TARGET_UNIS}
            ranked = sorted(TARGET_UNIS, key=lambda u: (-scores[u], u))
            for forced in ranked:
                trial = extract_image(p, forced_uni=forced)
                if trial:
                    batch = trial
                    break
        if (
            not batch
            and re.search(r"\baydin\s*university\b", blob)
            and not re.search(
                r"turk\s*hava|lefke|fatih\s*sultan|thk|kurumu|avrupa", blob
            )
        ):
            per_image[p.name] = 0
            continue
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

    summary = {
        "screenshots": len(paths),
        "total_unique_programs": len(rows),
        "by_university": dict(by_uni),
        "availability_by_university": dict(avail),
        "expected_from_portal": {
            "Türk Hava Kurumu University": 27,
            "European University of Lefke": 115,
            "Fatih Sultan Mehmet University": 84,
        },
        "per_image_row_counts": per_image,
    }
    SUMMARY.write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8")

    print("screenshots", len(paths))
    print("unique programs", len(rows))
    print("by university", dict(by_uni))
    print("availability", dict(avail))
    print("wrote", OUT)
    print("wrote", SUMMARY)


if __name__ == "__main__":
    main()
