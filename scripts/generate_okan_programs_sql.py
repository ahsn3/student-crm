#!/usr/bin/env python3
"""Emit Flyway V20__seed_okan_study_programs.sql from scripts/data/okan-tuition-2026-2027.txt (official 2026–27 list)."""
from __future__ import annotations

import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
SRC = ROOT / "scripts/data/okan-tuition-2026-2027.txt"
OUT = ROOT / "src/main/resources/db/migration/V20__seed_okan_study_programs.sql"

UNI = "Okan University"

ROW_RE = re.compile(
    r"^\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*$"
)


def esc(s: str) -> str:
    return s.replace("'", "''")


def first_usd_amount(cell: str) -> int:
    m = re.search(r"(\d[\d,]*)", cell.replace(",", ""))
    if not m:
        return 0
    return int(m.group(1))


def normalize_lang(raw: str) -> str:
    r = raw.strip().upper()
    if r == "ENGLISH":
        return "English"
    if r == "TURKISH":
        return "Turkish"
    if "ENGLISH" in r and "TURKISH" in r:
        return "English and Turkish"
    if "CHINESE" in r and "TURKISH" in r:
        return "Chinese and Turkish"
    if "RUSSIAN" in r and "TURKISH" in r:
        return "Russian and Turkish"
    return raw.strip().title()


def fix_display_name(name: str) -> str:
    return name.replace("Cullinary", "Culinary").strip()


def years_for(degree: str, name: str) -> int:
    n = name.lower()
    if degree == "Bachelor":
        if "medicine" in n:
            return 6
        if "dentistry" in n or "pharmacy" in n:
            return 5
        return 4
    if degree == "Diploma":
        return 2
    if degree == "Master":
        if "without thesis" in n:
            return 1
        return 2
    return 4


def parse_rows() -> list[tuple[str, str, str, int, int, int, int]]:
    """Returns (name, language, degree, before, cost, cash, years)."""
    text = SRC.read_text(encoding="utf-8")
    section = "skip"
    out: list[tuple[str, str, str, int, int, int]] = []
    seen: set[tuple[str, str, str, int]] = set()

    for line in text.splitlines():
        line = line.strip()
        if "FACULTY" in line or "CONSERVATORY" in line or "FACULTY OF APPLIED" in line:
            section = "bachelor"
            continue
        if "MASTER PROGRAMS" in line:
            section = "master"
            continue
        if "DOCTORATE (PhD)" in line:
            section = "skip_phd"
            continue
        if "ASSOCIATE DEGREE" in line:
            section = "associate"
            continue
        if "PREPARATION YEAR" in line or line.startswith("| For ") or line.startswith("| The "):
            break
        if section == "skip" or section == "skip_phd":
            continue

        m = ROW_RE.match(line)
        if not m:
            continue
        name, lang_raw, _plan, before_cell, cash_cell = (g.strip() for g in m.groups())
        if name.upper() == "DEPARTMENT" or "---" in name:
            continue

        degree = (
            "Bachelor"
            if section == "bachelor"
            else "Master"
            if section == "master"
            else "Diploma"
        )
        name = fix_display_name(name)
        lang = normalize_lang(lang_raw)
        before = first_usd_amount(before_cell)
        cash = first_usd_amount(cash_cell)
        if before <= 0 or cash < 0:
            continue

        key = (name.lower(), degree, lang.lower(), before)
        if key in seen:
            continue
        seen.add(key)

        y = years_for(degree, name)
        cost = before
        out.append((name, lang, degree, before, cost, cash, y))
    return out


def insert_block(name: str, lang: str, degree: str, before: int, cost: int, cash: int, years: int) -> str:
    name_sql = esc(name)
    lang_sql = esc(lang)
    deg_sql = esc(degree)
    uni_sql = esc(UNI)
    return f"""INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
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
  {cash},
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = '{uni_sql}'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = '{name_sql}'
      AND COALESCE(p.degree, '') = '{deg_sql}'
      AND COALESCE(p.language, '') = '{lang_sql}'
      AND COALESCE(p.before_discount, -1) = {before}
  );
"""


def main() -> None:
    rows = parse_rows()
    parts = [
        "-- Okan University bachelor, master, and associate (diploma) programs from official 2026–2027 international price list.\n"
        "-- PhD rows are omitted (already covered by V10). Idempotent per university + name + degree + language + before_discount.\n",
    ]
    for name, lang, degree, before, cost, cash, years in rows:
        parts.append(insert_block(name, lang, degree, before, cost, cash, years))
    OUT.write_text("\n".join(parts) + "\n", encoding="utf-8")
    print(f"Wrote {OUT} ({len(rows)} programs)")


if __name__ == "__main__":
    main()
