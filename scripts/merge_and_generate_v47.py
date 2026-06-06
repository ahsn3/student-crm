#!/usr/bin/env python3
"""Merge all program JSON sources and generate V47 supplement migration."""
from __future__ import annotations

import json
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
OUT_SQL = ROOT / "src/main/resources/db/migration/V47__seed_agentportal_supplement_to_4000.sql"
OUT_JSON = SCRIPTS / "agentportal_programs_merged_v47.json"

UNI_FIX = {
    "Bahgesehir University": "Bahçeşehir University",
    "Usküdar University": "Üsküdar University",
    "/ Usküdar University": "Üsküdar University",
    "Küitur University": "İstanbul Kültür University",
    "Gire American University": "Girne American University",
}

SOURCES = [
    "agentportal_programs_all_assets.json",
    "agentportal_programs_may20.json",
    "agentportal_programs_may22.json",
    "agentportal_programs_may17.json",
    "agentportal_programs_may20_all.json",
    "extracted_programs.json",
    "uskudar_programs_merged.json",
    "istinye_programs.json",
    "kent_lokman_programs.json",
    "thk_lefke_fsm_programs_final.json",
]

# V5 university names we can seed
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


def esc(s: str) -> str:
    return s.replace("'", "''")


def sql_value(v) -> str:
    if v is None:
        return "NULL::numeric"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return str(int(v)) if isinstance(v, int) or v == int(v) else str(v)
    return f"'{esc(str(v))}'"


def value_row(row: dict) -> str:
    name = row["name"]
    name_ar = row.get("name_ar") or name
    cash = row.get("cash")
    if cash is not None and int(cash) < 1000:
        cash = None
    cash_sql = "NULL::numeric" if cash is None else str(int(cash))
    avail = row.get("available", True)
    return (
        f"  ({sql_value(name)}, {sql_value(row['degree'])}, {sql_value(row['language'])}, "
        f"{int(row['cost'])}, {int(row['years'])}, {sql_value(avail)}, "
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


def dedupe_key(r: dict) -> tuple:
    return (
        r.get("university", "").strip(),
        re.sub(r"\s+", " ", r.get("name", "").lower()).strip(),
        r.get("degree", ""),
        r.get("language", ""),
    )


def load_phd_compact() -> list[dict]:
    compact = SCRIPTS / "phd_compact.txt"
    if not compact.exists():
        return []
    uni_map = {
        "AYDIN": "Aydın University",
        "ATILIM": "Atılım University",
        "ZAIM": "İstanbul Sabahattin Zaim University",
        "ISTINYE": "İstinye University",
        "USKUDAR": "Üsküdar University",
        "LOKMAN": "Lokman Hekim University",
        "NEU": "Near East University",
        "OKAN": "Okan University",
        "NISANTASI": "Nişantaşı University",
        "TOPKAPI": "Topkapı University",
        "BILGI": "İstanbul Bilgi University",
    }
    rows = []
    for line in compact.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line:
            continue
        parts = line.split("|")
        if len(parts) != 8:
            continue
        code, name, lang, degree, bd_s, cost_s, cash_s, years_s = parts
        uni = uni_map.get(code)
        if not uni:
            continue
        cash = int(cash_s) if cash_s.strip() else None
        rows.append(
            {
                "university": uni,
                "name": name,
                "name_ar": None,
                "degree": degree,
                "language": lang,
                "before": int(bd_s),
                "cost": int(cost_s),
                "cash": cash,
                "years": int(years_s),
                "available": True,
            }
        )
    return rows


def load_all() -> list[dict]:
    seen: dict[tuple, dict] = {}
    for r in load_phd_compact():
        uni = UNI_FIX.get(r.get("university", ""), r.get("university", ""))
        if uni in V5_UNIS:
            r["university"] = uni
            seen[dedupe_key(r)] = r
    for name in SOURCES:
        p = SCRIPTS / name
        if not p.exists():
            continue
        rows = json.loads(p.read_text(encoding="utf-8"))
        if not isinstance(rows, list):
            continue
        for r in rows:
            uni = r.get("university", "").strip()
            uni = UNI_FIX.get(uni, uni)
            if uni not in V5_UNIS:
                # fuzzy map common OCR names
                if "Kultur" in uni or "Kültür" in uni:
                    uni = "İstanbul Kültür University"
                elif uni == "Istanbul Health and Technology University":
                    continue
                else:
                    continue
            r = dict(r)
            r["university"] = UNI_FIX.get(uni, uni)
            if not r.get("name") or not r.get("degree") or not r.get("language"):
                continue
            if not r.get("before") or not r.get("cost"):
                continue
            k = dedupe_key(r)
            seen[k] = r
    return list(seen.values())


def main() -> None:
    rows = load_all()
    rows.sort(key=lambda r: (r["university"], r["degree"], r["name"], r["language"]))
    OUT_JSON.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")

    by_uni: dict[str, list[dict]] = defaultdict(list)
    for r in rows:
        by_uni[r["university"]].append(r)

    blocks = [
        "-- Supplement programs from all agentportal screenshots (target ~4000+ total).",
        "-- Idempotent: only inserts rows not already present.",
        "",
    ]
    for uni in sorted(by_uni.keys()):
        blocks.append(bulk_insert(uni, by_uni[uni]))

    blocks.append("\nUPDATE university u SET programs_count = sub.cnt")
    blocks.append(
        "FROM (SELECT university_id, COUNT(*) AS cnt FROM program GROUP BY university_id) sub"
    )
    blocks.append("WHERE u.id = sub.university_id;")

    OUT_SQL.write_text("\n".join(blocks).strip() + "\n", encoding="utf-8")
    print(f"Merged unique programs: {len(rows)}")
    print(f"Universities: {len(by_uni)}")
    print(f"Wrote {OUT_SQL}")


if __name__ == "__main__":
    main()
