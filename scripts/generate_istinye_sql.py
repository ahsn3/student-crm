#!/usr/bin/env python3
"""Generate Flyway migration for İstinye University programs."""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "scripts" / "istinye_programs.json"
OUT = ROOT / "src/main/resources/db/migration/V39__seed_istinye_programs.sql"


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
    uni = row["university"]
    name = row["name"]
    name_ar = row.get("name_ar") or name
    degree = row["degree"]
    language = row["language"]
    before = row["before"]
    cost = row["cost"]
    cash = row.get("cash")
    years = row["years"]
    available = row.get("available", True)

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
  {sql_value(cash)},
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim({sql_value(uni)}))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim({sql_value(name)}))
      AND COALESCE(p.degree, '') = {sql_value(degree)}
      AND COALESCE(p.language, '') = {sql_value(language)}
  );
"""


def update_available_block(row: dict) -> str:
    if row.get("available", True):
        return ""
    uni = row["university"]
    name = row["name"]
    degree = row["degree"]
    language = row["language"]
    return f"""
UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim({sql_value(uni)}))
  AND lower(trim(p.name)) = lower(trim({sql_value(name)}))
  AND COALESCE(p.degree, '') = {sql_value(degree)}
  AND COALESCE(p.language, '') = {sql_value(language)};
"""


def main() -> None:
    rows = json.loads(SRC.read_text(encoding="utf-8"))
    blocks = [
        "-- İstinye University programs from agentportal screenshots (2026-05-17).",
        "-- Idempotent inserts; updates availability for quota-full programs already in DB.",
        "",
    ]
    for row in rows:
        blocks.append(insert_block(row))
    blocks.append("")
    blocks.append("-- Mark quota-full programs (including rows seeded in earlier migrations).")
    for row in rows:
        u = update_available_block(row)
        if u:
            blocks.append(u)
    OUT.write_text("\n".join(blocks).strip() + "\n", encoding="utf-8")
    quota = sum(1 for r in rows if not r.get("available", True))
    print(f"Wrote {len(rows)} inserts + {quota} availability updates to {OUT}")


if __name__ == "__main__":
    main()
