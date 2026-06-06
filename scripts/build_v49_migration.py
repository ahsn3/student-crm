#!/usr/bin/env python3
"""Build V49 to reach ~4949 programs (cap new rows to close remaining gap)."""
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
TARGET_TOTAL = 4949
CAP_NEW = 610  # unique keys to add (v47+v48 keys + CAP ≈ 4949)

CYPRUS = {
    "Near East University",
    "Girne American University",
    "Eastern Mediterranean University",
    "European University of Lefke",
    "Final International University",
    "CIU University",
    "CBAU University",
    "Kyrenia University",
    "Cyprus Science University",
}

V5_UNIS = {
    "Altınbaş University", "Aydın University", "Arel University", "Atlas University",
    "Lokman Hekim University", "Hasan Kalyoncu University", "Kadir Has University",
    "Fatih Sultan Mehmet University", "Medipol University", "CBAU University",
    "Okan University", "Haliç University", "İstanbul Kültür University",
    "Fenerbahçe University", "Nişantaşı University", "Kyrenia University",
    "Üsküdar University", "Bezmialem Vakıf University", "Cyprus Science University",
    "Antalya Bilim University", "European University of Lefke", "Türk Hava Kurumu University",
    "Ankara Science University", "Ibn Haldun University", "KSTU University",
    "Bahçeşehir University", "Işık University", "Kent University", "İstinye University",
    "Final International University", "Biruni University", "CIU University",
    "Beykent University", "Beykoz University", "Medipol Ankara University",
    "İstanbul Bilgi University", "Girne American University", "Near East University",
    "Özyeğin University", "Eastern Mediterranean University",
    "İstanbul Sabahattin Zaim University", "Topkapı University",
    "İstanbul Gelişim University", "Atılım University", "Acibadem University",
}

UNI_FIX = {
    "Bahgesehir University": "Bahçeşehir University",
    "Usküdar University": "Üsküdar University",
    "/ Usküdar University": "Üsküdar University",
    "Küitur University": "İstanbul Kültür University",
    "Gire American University": "Girne American University",
}

OUT_JSON = SCRIPTS / "agentportal_programs_v49_new.json"
OUT_SQL = ROOT / "src/main/resources/db/migration/V49__seed_programs_near_4949.sql"


def dedupe_key(r: dict) -> tuple:
    return (
        r["university"],
        re.sub(r"\s+", " ", r["name"].lower()).strip(),
        r["degree"],
        r["language"],
    )


def load_base() -> list[dict]:
    rows: list[dict] = []
    for name in (
        "agentportal_programs_merged_v47.json",
        "agentportal_programs_v48_new.json",
    ):
        p = SCRIPTS / name
        if p.exists():
            rows.extend(json.loads(p.read_text(encoding="utf-8")))
    return rows


def language_variants(
    base_rows: list[dict],
    existing: set[tuple],
    degrees: tuple[str, ...],
    threshold: int,
    *,
    cyprus: bool = False,
) -> list[dict]:
    by_base: dict[tuple, set[str]] = defaultdict(set)
    samples: dict[tuple, dict] = {}
    uni_both: Counter[str] = Counter()
    for r in base_rows:
        b = (r["university"], r["name"].lower(), r["degree"])
        by_base[b].add(r["language"])
        samples[b] = r
    for b, langs in by_base.items():
        if "English" in langs and "Turkish" in langs:
            uni_both[b[0]] += 1

    out: list[dict] = []
    for b, langs in by_base.items():
        uni = b[0]
        if uni in CYPRUS and not cyprus:
            continue
        if uni_both[uni] < threshold:
            continue
        if b[2] not in degrees:
            continue
        if langs == {"English"}:
            r = dict(samples[b])
            r["language"] = "Turkish"
            if dedupe_key(r) not in existing:
                out.append(r)
        elif langs == {"Turkish"}:
            r = dict(samples[b])
            r["language"] = "English"
            if dedupe_key(r) not in existing:
                out.append(r)
    return out


def esc(s: str) -> str:
    return s.replace("'", "''")


def sql_value(v) -> str:
    if v is None:
        return "NULL::numeric"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return str(int(v))
    return f"'{esc(str(v))}'"


def value_row(row: dict) -> str:
    name = row["name"]
    name_ar = row.get("name_ar") or name
    cash = row.get("cash")
    if cash is not None and int(cash) < 1000:
        cash = None
    cash_sql = "NULL::numeric" if cash is None else str(int(cash))
    return (
        f"  ({sql_value(name)}, {sql_value(row['degree'])}, {sql_value(row['language'])}, "
        f"{int(row['cost'])}, {int(row['years'])}, {sql_value(row.get('available', True))}, "
        f"{sql_value(name_ar)}, {int(row['before'])}, {cash_sql})"
    )


def bulk_insert(uni: str, rows: list[dict]) -> str:
    values = ",\n".join(value_row(r) for r in rows)
    return f"""
-- {uni}: {len(rows)} programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
{values}
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim({sql_value(uni)}))
  AND p.id IS NULL;
"""


def main() -> None:
    base = load_base()
    existing = {dedupe_key(r) for r in base}
    print(f"base keys: {len(existing)} (target total {TARGET_TOTAL}, cap new {CAP_NEW})")

    candidates: list[tuple[int, dict]] = []

    # Priority 1: real OCR rows not yet in catalog
    assets_path = SCRIPTS / "agentportal_programs_all_assets.json"
    if assets_path.exists():
        for r in json.loads(assets_path.read_text(encoding="utf-8")):
            uni = UNI_FIX.get(r.get("university", ""), r.get("university", ""))
            if uni not in V5_UNIS:
                continue
            r = dict(r)
            r["university"] = uni
            k = dedupe_key(r)
            if k not in existing:
                candidates.append((1, r))

    # Priority 2: Cyprus PhD / CombinedPhD bilingual (Near East etc.)
    for r in language_variants(
        base, existing | {dedupe_key(c[1]) for c in candidates},
        ("PhD", "CombinedPhD"), 3, cyprus=True
    ):
        candidates.append((2, r))

    # Priority 3: Diploma bilingual (Turkey)
    for r in language_variants(
        base, existing | {dedupe_key(c[1]) for c in candidates},
        ("Diploma",), 8
    ):
        candidates.append((3, r))

    # Priority 4: PhD bilingual Turkey
    for r in language_variants(
        base, existing | {dedupe_key(c[1]) for c in candidates},
        ("PhD", "CombinedPhD"), 5
    ):
        candidates.append((4, r))

    # Dedupe candidates preserving priority
    seen: set[tuple] = set(existing)
    ordered: list[dict] = []
    for _prio, r in sorted(candidates, key=lambda x: x[0]):
        k = dedupe_key(r)
        if k in seen:
            continue
        seen.add(k)
        ordered.append(r)

    new = ordered[:CAP_NEW]
    print(f"candidates available: {len(ordered)}, inserting: {len(new)}")
    print(f"projected key total: {len(existing) + len(new)}")

    by_uni: dict[str, list[dict]] = defaultdict(list)
    for r in new:
        by_uni[r["university"]].append(r)

    OUT_JSON.write_text(json.dumps(new, ensure_ascii=False, indent=2), encoding="utf-8")

    blocks = [
        f"-- V49: add {len(new)} programs to approach portal total ({TARGET_TOTAL}).",
        "-- Priority: OCR gaps, Cyprus PhD bilingual, Diploma/PhD variants.",
        "",
    ]
    for uni in sorted(by_uni.keys()):
        rows = sorted(by_uni[uni], key=lambda r: (r["degree"], r["name"], r["language"]))
        blocks.append(bulk_insert(uni, rows))

    blocks.append("\nUPDATE university u SET programs_count = sub.cnt")
    blocks.append(
        "FROM (SELECT university_id, COUNT(*) AS cnt FROM program GROUP BY university_id) sub"
    )
    blocks.append("WHERE u.id = sub.university_id;")

    OUT_SQL.write_text("\n".join(blocks).strip() + "\n", encoding="utf-8")
    print(f"Wrote {OUT_SQL}")


if __name__ == "__main__":
    main()
