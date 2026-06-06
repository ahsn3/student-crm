#!/usr/bin/env python3
"""Re-extract only screenshots that previously yielded 0 rows."""
from __future__ import annotations

import json
from pathlib import Path

from extract_agentportal_thk_lefke_fsm import (
    UNI_PATTERNS,
    dedupe_key,
    extract_image,
    pick_uni,
    uni_score,
)

TARGET_UNIS = tuple(UNI_PATTERNS.keys())
from ocrmac import ocrmac

IMG_DIR = Path("/Users/ahmedhassan/.cursor/projects/Users-ahmedhassan-Desktop-ingazgate/assets")
ZERO_ROW = (
    "Screenshot_2026-05-17_at_17.23.20-aa03eebc-90a7-499a-8457-b7be8704cfa3.png",
    "Screenshot_2026-05-17_at_17.23.22-653276c5-7c08-4bf5-8111-e3a14648e09f.png",
    "Screenshot_2026-05-17_at_17.23.26-d99cefe7-7d28-44e0-8e31-3241852fc74d.png",
    "Screenshot_2026-05-17_at_17.23.28-ce702aeb-01f4-468f-87e8-cd5851fb27fc.png",
    "Screenshot_2026-05-17_at_17.23.59-825ef1d5-b400-405c-b982-d291083009ae.png",
    "Screenshot_2026-05-17_at_17.24.03-6ed14243-6152-4a6f-87dd-aad56a48c522.png",
    "Screenshot_2026-05-17_at_17.24.08-381ac5fe-4b36-4497-84b6-a004d8203ea8.png",
    "Screenshot_2026-05-17_at_17.24.09-3afd7f2b-ebb2-41e4-8e1d-7670716c169f.png",
    "Screenshot_2026-05-17_at_17.24.14-333802a7-ad37-4380-a4e0-a8249a2abdac.png",
    "Screenshot_2026-05-17_at_17.24.15-74f91c40-873b-4e99-931a-43a263f2ad96.png",
    "Screenshot_2026-05-17_at_17.24.19-4b703243-1e58-4f2b-84cb-37ad8e586baf.png",
    "Screenshot_2026-05-17_at_17.24.21-33364100-567c-42a0-a1ef-75aeca4ea537.png",
)
BASE = Path(__file__).resolve().parent / "thk_lefke_fsm_programs_clean.json"
OUT = Path(__file__).resolve().parent / "thk_lefke_fsm_programs_clean.json"


def extract_one(p: Path) -> list[dict]:
    anns = ocrmac.OCR(str(p), language_preference=["en-US"]).recognize(px=True)
    chosen = pick_uni(anns)
    batch = extract_image(p, forced_uni=chosen) if chosen else []
    if not batch:
        ranked = sorted(TARGET_UNIS, key=lambda u: (-uni_score(anns, u), u))
        for forced in ranked:
            trial = extract_image(p, forced_uni=forced)
            if trial:
                return trial
    return batch


def main() -> None:
    rows = json.loads(BASE.read_text(encoding="utf-8"))
    uniq = {dedupe_key(r): r for r in rows}
    added = 0
    for name in ZERO_ROW:
        p = IMG_DIR / name
        if not p.exists():
            print("missing", name)
            continue
        batch = extract_one(p)
        print(name, len(batch))
        for r in batch:
            k = dedupe_key(r)
            if k not in uniq:
                added += 1
            uniq[k] = r
    merged = list(uniq.values())
    merged.sort(key=lambda r: (r["university"], r["degree"], r["name"]))
    OUT.write_text(json.dumps(merged, ensure_ascii=False, indent=2), encoding="utf-8")
    print("added", added, "total", len(merged))


if __name__ == "__main__":
    main()
