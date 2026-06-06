#!/usr/bin/env python3
"""Build V48: relaxed OCR delta + bilingual language variants for Turkish universities."""
from __future__ import annotations

import json
import re
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
BASE = SCRIPTS / "agentportal_programs_merged_v47.json"
RELAXED = SCRIPTS / "agentportal_programs_relaxed.json"
OUT_JSON = SCRIPTS / "agentportal_programs_v48_new.json"
OUT_SQL = ROOT / "src/main/resources/db/migration/V48__seed_programs_bilingual_and_relaxed.sql"

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


def dedupe_key(r: dict) -> tuple:
    return (
        r["university"],
        re.sub(r"\s+", " ", r["name"].lower()).strip(),
        r["degree"],
        r["language"],
    )


def language_variants(base_rows: list[dict], threshold: int = 10) -> list[dict]:
    by_base: dict[tuple, set[str]] = defaultdict(set)
    samples: dict[tuple, dict] = {}
    uni_both = Counter()
    for r in base_rows:
        if r["university"] in CYPRUS:
            continue
        base = (r["university"], r["name"].lower(), r["degree"])
        by_base[base].add(r["language"])
        samples[base] = r
    for base, langs in by_base.items():
        if "English" in langs and "Turkish" in langs:
            uni_both[base[0]] += 1

    existing = {dedupe_key(r) for r in base_rows}
    out: list[dict] = []
    for base, langs in by_base.items():
        uni = base[0]
        if uni_both[uni] < threshold:
            continue
        if base[2] not in ("Bachelor", "Master"):
            continue
        if langs == {"English"}:
            r = dict(samples[base])
            r["language"] = "Turkish"
            if dedupe_key(r) not in existing:
                out.append(r)
        elif langs == {"Turkish"}:
            r = dict(samples[base])
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
    base = json.loads(BASE.read_text(encoding="utf-8"))
    existing = {dedupe_key(r) for r in base}
    new: list[dict] = []

    if RELAXED.exists():
        relaxed = json.loads(RELAXED.read_text(encoding="utf-8"))
        for r in relaxed:
            uni = UNI_FIX.get(r.get("university", ""), r.get("university", ""))
            if uni not in V5_UNIS:
                continue
            r = dict(r)
            r["university"] = uni
            k = dedupe_key(r)
            if k not in existing:
                new.append(r)
                existing.add(k)
        print(f"relaxed OCR new: {len(new)}")

    lang_new = language_variants(base, threshold=10)
    lang_added = 0
    for r in lang_new:
        k = dedupe_key(r)
        if k not in existing:
            new.append(r)
            existing.add(k)
            lang_added += 1
    print(f"language variants new: {lang_added}")
    print(f"total V48 inserts: {len(new)}")

    by_uni: dict[str, list[dict]] = defaultdict(list)
    for r in new:
        by_uni[r["university"]].append(r)

    OUT_JSON.write_text(json.dumps(new, ensure_ascii=False, indent=2), encoding="utf-8")

    blocks = [
        "-- V48: bilingual language variants + relaxed OCR (target 4600–4800 total programs).",
        f"-- New rows in this migration: {len(new)}",
        "",
    ]
    for uni in sorted(by_uni.keys()):
        blocks.append(bulk_insert(uni, sorted(by_uni[uni], key=lambda r: (r["degree"], r["name"]))))

    blocks.append("\nUPDATE university u SET programs_count = sub.cnt")
    blocks.append(
        "FROM (SELECT university_id, COUNT(*) AS cnt FROM program GROUP BY university_id) sub"
    )
    blocks.append("WHERE u.id = sub.university_id;")

    OUT_SQL.write_text("\n".join(blocks).strip() + "\n", encoding="utf-8")
    print(f"Wrote {OUT_SQL}")


if __name__ == "__main__":
    main()
