#!/usr/bin/env python3
"""Emit Flyway V10__seed_phd_programs.sql from scripts/phd_compact.txt (run from repo root)."""
from __future__ import annotations

import pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
COMPACT = ROOT / "scripts" / "phd_compact.txt"
OUT = ROOT / "src/main/resources/db/migration/V10__seed_phd_programs.sql"

UNI = {
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


def esc(s: str) -> str:
    return s.replace("'", "''")


def main() -> None:
    lines = [ln.strip() for ln in COMPACT.read_text(encoding="utf-8").splitlines() if ln.strip()]
    chunks: list[str] = [
        "-- PhD / Combined PhD programs (excludes Drama Ve Acting). Idempotent per university + name + degree.\n"
    ]
    for line in lines:
        parts = line.split("|")
        if len(parts) != 8:
            raise SystemExit(f"Bad line ({len(parts)} fields): {line!r}")
        code, name, lang, degree, bd_s, cost_s, cash_s, years_s = parts
        uni_name = UNI.get(code)
        if not uni_name:
            raise SystemExit(f"Unknown code {code!r} in {line!r}")
        before = int(bd_s)
        cost = int(cost_s)
        cash_sql = "NULL" if not cash_s.strip() else str(int(cash_s))
        years = int(years_s)
        name_sql = esc(name)
        deg_sql = esc(degree)
        lang_sql = esc(lang)
        uni_sql = esc(uni_name)
        sql = f"""INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  '{name_sql}',
  '{deg_sql}',
  '{lang_sql}',
  {cost},
  {years},
  now(),
  true,
  NULL,
  {before},
  {cash_sql},
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = '{uni_sql}'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = '{name_sql}'
      AND COALESCE(p.degree, '') = '{deg_sql}'
      AND COALESCE(p.language, '') = '{lang_sql}'
  );
"""
        chunks.append(sql)
    OUT.write_text("\n".join(chunks) + "\n", encoding="utf-8")
    print(f"Wrote {OUT} ({len(lines)} programs)")


if __name__ == "__main__":
    main()
