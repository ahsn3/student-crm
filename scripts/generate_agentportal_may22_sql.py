#!/usr/bin/env python3
"""Generate Flyway migration for May 22 agentportal program screenshots."""
from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "scripts" / "agentportal_programs_may22.json"
OUT = ROOT / "src/main/resources/db/migration/V46__seed_agentportal_may22_programs.sql"


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
    rows = json.loads(SRC.read_text(encoding="utf-8"))
    by_uni: dict[str, list[dict]] = defaultdict(list)
    for r in rows:
        by_uni[r["university"]].append(r)

    blocks = [
        "-- Programs from agentportal screenshots (2026-05-22). Idempotent bulk inserts.",
        "",
    ]

    for uni in sorted(by_uni.keys()):
        uni_rows = sorted(
            by_uni[uni],
            key=lambda r: (r["degree"], r["name"], r["language"]),
        )
        blocks.append(bulk_insert(uni, uni_rows))

    blocks.append("\n-- Refresh programs_count from actual rows")
    blocks.append(
        "UPDATE university u SET programs_count = sub.cnt\n"
        "FROM (SELECT university_id, COUNT(*) AS cnt FROM program GROUP BY university_id) sub\n"
        "WHERE u.id = sub.university_id\n"
        "  AND lower(trim(u.name)) IN ("
        + ", ".join(sql_value(u) for u in sorted(by_uni.keys()))
        + ");"
    )

    OUT.write_text("\n".join(blocks).strip() + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(f"Universities: {len(by_uni)}, programs: {len(rows)}")


if __name__ == "__main__":
    main()
