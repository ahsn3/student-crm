-- Backfill missing Arabic program names so every program has name_ar populated.
-- If no Arabic text is present yet, we keep the English label as a placeholder value.
UPDATE program
SET name_ar = name
WHERE name IS NOT NULL
  AND (name_ar IS NULL OR btrim(name_ar) = '');
