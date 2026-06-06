#!/usr/bin/env python3
"""Generate Flyway migration for THK, Lefke, and FSM programs (bulk INSERT per university)."""
from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "scripts" / "thk_lefke_fsm_programs_clean.json"
OUT = ROOT / "src/main/resources/db/migration/V41__seed_thk_lefke_fsm_programs.sql"


def esc(s: str) -> str:
    return s.replace("'", "''")


def sql_value(v) -> str:
    if v is None:
        return "NULL"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return str(int(v)) if isinstance(v, int) or v == int(v) else str(v)
    return f"'{esc(str(v))}'"


def values_row(row: dict) -> str:
    name_ar = row.get("name_ar") or row["name"]
    cash = row.get("cash")
    # OCR sometimes leaks year fragments (e.g. 202) into cash_price.
    if cash is not None and int(cash) < 1000:
        cash = None
    cash_sql = "NULL::numeric" if cash is None else str(int(cash))
    avail = "true" if row.get("available", True) else "false"
    return (
        f"({sql_value(row['name'])}, {sql_value(row['degree'])}, {sql_value(row['language'])}, "
        f"{int(row['cost'])}, {int(row['years'])}, {avail}, "
        f"{sql_value(name_ar)}, {int(row['before'])}, {cash_sql})"
    )


def bulk_insert_block(university: str, rows: list[dict]) -> str:
    values = ",\n  ".join(values_row(r) for r in rows)
    return f"""
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
WHERE lower(trim(u.name)) = lower(trim({sql_value(university)}))
  AND p.id IS NULL;
"""


def main() -> None:
    rows = json.loads(SRC.read_text(encoding="utf-8"))
    by_uni: dict[str, list[dict]] = defaultdict(list)
    for row in rows:
        by_uni[row["university"]].append(row)

    parts = [
        "-- Seed Türk Hava Kurumu, European University of Lefke, and Fatih Sultan Mehmet programs.",
        "-- Source: agentportal screenshots 2026-05-17. Bulk INSERT per university for fast Flyway startup.",
    ]
    for university in sorted(by_uni.keys()):
        parts.append(bulk_insert_block(university, by_uni[university]))

    OUT.write_text("\n".join(parts).strip() + "\n", encoding="utf-8")
    print(f"wrote {OUT} ({len(rows)} programs, {len(by_uni)} statements)")


if __name__ == "__main__":
    main()
