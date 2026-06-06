#!/usr/bin/env python3
"""Merge full + targeted May 20 extractions into final JSON for SQL generation."""
from __future__ import annotations

import json
import re
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ALL = ROOT / "agentportal_programs_may20_all.json"
TARGETED = ROOT / "agentportal_programs_may20_targeted.json"
OUT = ROOT / "agentportal_programs_may20.json"
SUMMARY = ROOT / "agentportal_programs_may20_summary.json"

PORTAL_EXPECTED = {
    "Aydın University": 357,
    "Arel University": 127,
    "Beykent University": 199,
}


def dedupe_key(r: dict) -> tuple:
    return (
        r["university"],
        re.sub(r"\s+", " ", r["name"].lower()).strip(),
        r["degree"],
        r["language"],
    )


def load(path: Path) -> list[dict]:
    if not path.exists():
        return []
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    merged: dict[tuple, dict] = {}
    for src in (ALL, TARGETED):
        for r in load(src):
            merged[dedupe_key(r)] = r

    rows = sorted(
        merged.values(),
        key=lambda r: (r["university"], r["degree"], r["name"], r["language"]),
    )
    OUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")

    by_uni = Counter(r["university"] for r in rows)
    gaps = {u: PORTAL_EXPECTED[u] - by_uni.get(u, 0) for u in PORTAL_EXPECTED}
    summary = {
        "total_unique_programs": len(rows),
        "by_university": dict(by_uni),
        "expected_from_portal": PORTAL_EXPECTED,
        "gaps_vs_portal": gaps,
        "sources": {
            "all": len(load(ALL)),
            "targeted": len(load(TARGETED)),
        },
    }
    SUMMARY.write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8")
    print("merged", len(rows), dict(by_uni))
    print("gaps", gaps)
    print("wrote", OUT)


if __name__ == "__main__":
    main()
