#!/usr/bin/env python3
"""Merge messages.properties with Arabic translations for messages_ar.properties."""
from __future__ import annotations

import re
import time
from pathlib import Path

from deep_translator import GoogleTranslator

ROOT = Path(__file__).resolve().parents[1]
EN_PATH = ROOT / "src/main/resources/messages.properties"
AR_PATH = ROOT / "src/main/resources/messages_ar.properties"

KEEP_ENGLISH_KEY_FRAGMENTS = (
    ".placeholder",
    ".ph.",
    "combobox.search",
    "form.student.placeholder",
    "programs.pdf.placeholder",
    "universities.modal.namePlaceholder",
    "universities.search.placeholder",
    "services.filter.search.placeholder",
    "applications.form.programSearchPlaceholder",
)

KEEP_ENGLISH_EXACT = {
    "programs.modal.programEn",
    "universities.modal.ph.country",
    "universities.modal.ph.website",
    "universities.modal.ph.currency",
    "universities.modal.ph.programs",
    "universities.modal.ph.campuses",
    "profile.input.title",
    "email.taken",
}

TRANSLATOR = GoogleTranslator(source="en", target="ar")
PLACEHOLDER_RE = re.compile(r"(\{[0-9]+\})")
HTML_TAG_RE = re.compile(r"(<[^>]+>)")


def parse_properties(path: Path) -> list[tuple[str | None, str, str]]:
    """Return list of (key, value, raw_line) preserving comments and blanks."""
    entries: list[tuple[str | None, str, str]] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            entries.append((None, "", line))
            continue
        if "=" not in line:
            entries.append((None, "", line))
            continue
        key, value = line.split("=", 1)
        entries.append((key.strip(), value, line))
    return entries


def unescape_java(value: str) -> str:
    def u(m: re.Match[str]) -> str:
        return chr(int(m.group(1), 16))

    value = re.sub(r"\\u([0-9a-fA-F]{4})", u, value)
    return (
        value.replace("\\n", "\n")
        .replace("\\r", "\r")
        .replace("\\t", "\t")
        .replace("\\\\", "\\")
    )


def load_key_values(path: Path) -> dict[str, str]:
    out: dict[str, str] = {}
    for key, value, _ in parse_properties(path):
        if key:
            out[key] = unescape_java(value)
    return out


def should_keep_english(key: str) -> bool:
    if key in KEEP_ENGLISH_EXACT:
        return True
    return any(frag in key for frag in KEEP_ENGLISH_KEY_FRAGMENTS)


def protect_tokens(text: str) -> tuple[str, list[str]]:
    tokens: list[str] = []

    def repl(m: re.Match[str]) -> str:
        tokens.append(m.group(0))
        return f"__TOK{len(tokens) - 1}__"

    for pattern in (PLACEHOLDER_RE, HTML_TAG_RE):
        text = pattern.sub(repl, text)
    return text, tokens


def restore_tokens(text: str, tokens: list[str]) -> str:
    for i, tok in enumerate(tokens):
        text = text.replace(f"__TOK{i}__", tok)
    return text


def to_unicode_escape(s: str) -> str:
    out: list[str] = []
    for ch in s:
        code = ord(ch)
        if ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ch == "\t":
            out.append("\\t")
        elif ch == "\\":
            out.append("\\\\")
        elif 32 <= code <= 126:
            out.append(ch)
        else:
            out.append(f"\\u{code:04x}")
    return "".join(out)


def translate_batch_values(texts: list[str]) -> list[str]:
    protected_list: list[str] = []
    token_lists: list[list[str]] = []
    for text in texts:
        protected, tokens = protect_tokens(text)
        protected_list.append(protected)
        token_lists.append(tokens)
    try:
        translated = TRANSLATOR.translate_batch(protected_list)
    except Exception:
        time.sleep(2)
        translated = TRANSLATOR.translate_batch(protected_list)
    return [restore_tokens(t, tokens) for t, tokens in zip(translated, token_lists)]


def main() -> None:
    existing_ar = load_key_values(AR_PATH)
    en_entries = parse_properties(EN_PATH)
    merged: dict[str, str] = dict(existing_ar)
    to_translate: list[tuple[str, str]] = []

    for key, value, _ in en_entries:
        if not key or key in merged:
            continue
        if should_keep_english(key):
            merged[key] = value
        else:
            to_translate.append((key, value))

    print(f"Translating {len(to_translate)} keys...")
    batch_size = 40
    for start in range(0, len(to_translate), batch_size):
        chunk = to_translate[start : start + batch_size]
        values = [v for _, v in chunk]
        translated = translate_batch_values(values)
        for (key, en_val), ar_val in zip(chunk, translated):
            merged[key] = ar_val if ar_val else en_val
        print(f"  {min(start + batch_size, len(to_translate))}/{len(to_translate)}")
        time.sleep(0.15)

    lines: list[str] = ["# Arabic localization (auto-generated + manual overrides)\n"]
    for key, value, raw in en_entries:
        if key is None:
            if raw.strip().startswith("#"):
                lines.append(raw + "\n")
            elif not raw.strip():
                lines.append("\n")
            continue
        ar_val = merged.get(key, value)
        if ar_val is None:
            ar_val = value
        if should_keep_english(key):
            lines.append(f"{key}={ar_val}\n")
        else:
            lines.append(f"{key}={to_unicode_escape(ar_val)}\n")

    AR_PATH.write_text("".join(lines), encoding="utf-8")
    print(f"Wrote {AR_PATH} ({len(merged)} keys)")


if __name__ == "__main__":
    main()
