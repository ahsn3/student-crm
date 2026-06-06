#!/usr/bin/env python3
"""Generate Flyway migration for Üsküdar University programs from extracted JSON."""
from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "scripts" / "uskudar_programs_merged.json"
OUT = ROOT / "src/main/resources/db/migration/V36__seed_uskudar_programs_supplement.sql"

UNI = "Üsküdar University"


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


def insert_block(row: dict) -> str:
    name = row["name"]
    name_ar = row.get("name_ar") or name
    degree = row["degree"]
    language = row["language"]
    before = row["before"]
    cost = row["cost"]
    cash = row.get("cash")
    years = row["years"]
    available = row.get("available", True)

    cash_sql = sql_value(cash)

    return f"""
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  {sql_value(name)},
  {sql_value(degree)},
  {sql_value(language)},
  {cost},
  {years},
  now(),
  {sql_value(available)},
  {sql_value(name_ar)},
  {before},
  {cash_sql},
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim({sql_value(UNI)}))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim({sql_value(name)}))
      AND COALESCE(p.degree, '') = {sql_value(degree)}
      AND COALESCE(p.language, '') = {sql_value(language)}
  );
"""


def main() -> None:
    rows = json.loads(SRC.read_text(encoding="utf-8"))
    blocks = [
        "-- Supplement Üsküdar University programs (improved OCR + merge, 2026-05-17).",
        "-- Idempotent: skips when name + degree + language already exist for this university.",
    ]
    for row in rows:
        blocks.append(insert_block(row))
    OUT.write_text("\n".join(blocks).strip() + "\n", encoding="utf-8")
    print(f"Wrote {len(rows)} programs to {OUT}")


if __name__ == "__main__":
    main()
