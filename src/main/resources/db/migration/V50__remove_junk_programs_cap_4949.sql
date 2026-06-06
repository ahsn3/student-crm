-- V50: Remove OCR/import junk programs and cap catalog at 4949 (agent portal total).
-- application.program_id references program(id) ON DELETE SET NULL.

-- Obvious garbage from screenshot/OCR seeds (V45–V49).
DELETE FROM program
WHERE lower(btrim(name)) IN ('9găo', '9gao')
   OR btrim(name) ~ '^[0-9]'
   OR btrim(name) ~* '^[¡a]\s+Kyrenia'
   OR btrim(name) ~* 'Universit.*(furkey|/Zyprus|Zyprus|izyprus|Türkiye\s*TR)'
   OR btrim(name) ~* '^[0-9]+\s*(Kent|Kyrenia)'
   OR (btrim(name) ~* 'Universit' AND length(btrim(name)) < 28)
   OR length(btrim(name)) < 5;

-- Trim excess rows until total matches portal (keep best-quality names).
DELETE FROM program
WHERE id IN (
  SELECT id
  FROM (
    SELECT id,
      ROW_NUMBER() OVER (
        ORDER BY
          CASE
            WHEN btrim(name) ~ '^[0-9]' THEN 0
            WHEN lower(btrim(name)) IN ('9găo', '9gao') THEN 0
            WHEN btrim(name) ~* 'Universit' AND length(btrim(name)) < 35 THEN 1
            WHEN btrim(name) ~* '[^a-zA-Z0-9\s\-\.&''(),/]' THEN 2
            ELSE 100
          END ASC,
          length(btrim(name)) ASC,
          updated_at ASC NULLS FIRST,
          name ASC
      ) AS del_rank
    FROM program
  ) ranked
  WHERE del_rank <= GREATEST(0, (SELECT count(*)::int FROM program) - 4949)
);
