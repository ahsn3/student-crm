-- Seed additional programs from the 2026-05-06 screenshot batch.
-- Idempotent: only inserts rows that do not already exist (by university/name/degree/language/before_discount/cost).

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics And Finance',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language And Literature'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  10000,
  4,
  now(),
  true,
  NULL,
  20000,
  9000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 10000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  5000,
  2,
  now(),
  true,
  NULL,
  10000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science And Analytics',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Data Science And Analytics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Ergotherapy',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Ergotherapy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Exercise And Sport Sciences',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Exercise And Sport Sciences'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Midwifery'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  NULL,
  16000,
  7200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 16000
      AND COALESCE(p.cost, -1) = 8000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physical Education And Sports Teaching',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physical Education And Sports Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  4000,
  2,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Film'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Speech And Language Therapy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'English',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dent Prosthesis',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dent Prosthesis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dialysis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fenerbahçe UniversitYurkey',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fenerbahçe UniversitYurkey'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Data Processing Technician',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Data Processing Technician'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Operating Room Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Dental Health'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthopedic Prosthesis And Orhotics',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Orthopedic Prosthesis And Orhotics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pathology Laboratory Techniques',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pathology Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radiation Therapy',
  'Diploma',
  'Turkish',
  2400,
  2,
  now(),
  true,
  NULL,
  4800,
  2160,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radiation Therapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 2400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'English',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'English',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science',
  'Master',
  'English',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Data Science'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management',
  'Master',
  'English',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Master',
  'English',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations W',
  'Master',
  'English',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations W'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'Turkish',
  4000,
  2,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Pharmacy',
  'Master',
  'Turkish',
  3000,
  1,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Pharmacy'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science',
  'Master',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Data Science'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Exercise and Sports Psychology With Thesis',
  'Master',
  'Turkish',
  4000,
  2,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Exercise and Sports Psychology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Internal Medicine Nursing With Thesis',
  'Master',
  'Turkish',
  4000,
  2,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Internal Medicine Nursing With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Organizational Behavior',
  'Master',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Organizational Behavior'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Organizational Behavior With Thesis',
  'Master',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Organizational Behavior With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  4000,
  2,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Sciences',
  'Master',
  'Turkish',
  3000,
  1,
  now(),
  true,
  NULL,
  6000,
  2700,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Sciences'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Sciences With Thesis',
  'Master',
  'Turkish',
  4000,
  4,
  now(),
  true,
  NULL,
  8000,
  3600,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Sciences With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  7500,
  4,
  now(),
  true,
  NULL,
  15000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 15000
      AND COALESCE(p.cost, -1) = 7500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Sciences',
  'PhD',
  'Turkish',
  7500,
  4,
  now(),
  true,
  NULL,
  15000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Sciences'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 15000
      AND COALESCE(p.cost, -1) = 7500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  17500,
  4,
  now(),
  true,
  NULL,
  17500,
  7000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 17500
      AND COALESCE(p.cost, -1) = 17500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics And Finance',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language And Literature'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Translation And Interpretation',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Translation And Interpretation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Flight Training',
  'Bachelor',
  'English',
  10000,
  4,
  now(),
  true,
  NULL,
  10000,
  10000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Flight Training'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10000
      AND COALESCE(p.cost, -1) = 10000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  4400,
  4,
  now(),
  true,
  NULL,
  4400,
  4400,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  NULL,
  3800,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3800
      AND COALESCE(p.cost, -1) = 3800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  4400,
  4,
  now(),
  true,
  NULL,
  4400,
  4400,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Finance Management',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Finance Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Air Traffic Control',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  NULL,
  8000,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Air Traffic Control'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 8000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aircraft Maintenance And Repair',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aircraft Maintenance And Repair'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Electrics And Electronics (Avionics)',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Electrics And Electronics (Avionics)'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Finance',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Coaching',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Coaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communication And Design',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Communication And Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science And Analytics',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Data Science And Analytics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'Turkish',
  13500,
  4,
  now(),
  true,
  NULL,
  13500,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 13500
      AND COALESCE(p.cost, -1) = 13500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Game Design',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Digital Game Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Exercise And Sport Sciences',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Exercise And Sport Sciences'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion And Textile Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Graphic Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Design',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information System And Technologies',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information System And Technologies'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Business',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Business'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Logistics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'Turkish',
  14500,
  4,
  now(),
  true,
  NULL,
  14500,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 14500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Midwifery'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Film'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Recreation',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Recreation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Services',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social Services'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sociology',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sociology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Development',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Development'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Speech And Language Therapy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Theatre',
  'Bachelor',
  'Turkish',
  3250,
  4,
  now(),
  true,
  NULL,
  3250,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Theatre'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3250
      AND COALESCE(p.cost, -1) = 3250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tour Guide Training',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tour Guide Training'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism Administration',
  'Bachelor',
  'Turkish',
  2950,
  4,
  now(),
  true,
  NULL,
  2950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2950
      AND COALESCE(p.cost, -1) = 2950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Tax Applications',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Tax Applications'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aircraft Technology',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aircraft Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Restoration',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Restoration'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiometry',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Audiometry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Automotive Technology',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Automotive Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Insurance',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Insurance'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biomedical Device Technologies',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Biomedical Device Technologies'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Management',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Technology',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Court Office Services:',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Court Office Services:'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dental Prosthesis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dialysis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Health Services Technician',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Digital Health Services Technician'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electric',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electric'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electro Neurophysiology',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electro Neurophysiology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electronics technology',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electronics technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion Design',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Foreign Trade',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Foreign Trade'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Green And Ecological Building Technician',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Green And Ecological Building Technician'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Design',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Internet And Network Technology',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Internet And Network Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Justice',
  'Diploma',
  'Turkish',
  1900,
  2,
  now(),
  true,
  NULL,
  1900,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Justice'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1900
      AND COALESCE(p.cost, -1) = 1900
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Machinery',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Machinery'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marina And Yacht Management',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marina And Yacht Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Maritime Transport And Business',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Maritime Transport And Business'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Maritime Transportation Management',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Maritime Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Data Processing Technician',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Data Processing Technician'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretariat',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Documentation And Secretariat'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Operating Room Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Opticianry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Dental Health'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthopedic Prosthesis And Orhotics',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Orthopedic Prosthesis And Orhotics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pathology Laboratory Techniques',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pathology Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy Services',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Photography And Cameraman Ship',
  'Diploma',
  'Turkish',
  1600,
  2,
  now(),
  true,
  NULL,
  1600,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Photography And Cameraman Ship'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1600
      AND COALESCE(p.cost, -1) = 1600
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Promotion',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Promotion'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radiotherapy',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Services',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Development',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Development'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tour Guide Training',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tour Guide Training'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism And Hotel Management',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism And Hotel Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Unmanned Aerial Vehicle Technology',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Unmanned Aerial Vehicle Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'opall ogis',
  'Diploma',
  'Turkish',
  1950,
  2,
  now(),
  true,
  NULL,
  1950,
  1800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'opall ogis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1950
      AND COALESCE(p.cost, -1) = 1950
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'English',
  4500,
  1,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Entrepreneurship And Innovation Management',
  'Master',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Entrepreneurship And Innovation Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business Administration',
  'Master',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business Administration With The',
  'Master',
  'English',
  5000,
  2,
  now(),
  true,
  NULL,
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Business Administration With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Journalism',
  'Master',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Journalism'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Master',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations W',
  'Master',
  'English',
  5000,
  2,
  now(),
  true,
  NULL,
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations W'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Auditing',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Auditing'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Auditing (De)',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Auditing (De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Auditing With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Auditing With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising And Brand Communications',
  'Master',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Advertising And Brand Communications'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising And Brand Communications (De)',
  'Master',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Advertising And Brand Communications (De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising And Brand Communications With 7',
  'Master',
  'Turkish',
  5000,
  2,
  now(),
  true,
  NULL,
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Advertising And Brand Communications With 7'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aetifical Intelligence Engineering',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aetifical Intelligence Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aetifical Intelligence Engineering With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aetifical Intelligence Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Design',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Design'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Big Data Analytics And Management',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Big Data Analytics And Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Big Data Analytics And Management With Thes',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Big Data Analytics And Management With Thes'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biotechnology With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Biotechnology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration (De)',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration (De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chiropractic Treatment With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Chiropractic Treatment With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'Master',
  'Turkish',
  17000,
  4,
  now(),
  true,
  NULL,
  17000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 17000
      AND COALESCE(p.cost, -1) = 17000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
  'Turkish',
  18500,
  2,
  now(),
  true,
  NULL,
  18500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 18500
      AND COALESCE(p.cost, -1) = 18500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Entrepreneurship And Innovation Management',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Entrepreneurship And Innovation Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion And Textile Design'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion And Textile Design With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance And Banking',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance And Banking'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance And Banking (De)',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance And Banking (De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Mangement',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Mangement'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technologies',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Technologies'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technologies With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Technologies With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business Administration',
  'Master',
  'Turkish',
  3300,
  1,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business Administration With The',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Business Administration With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business ministration De',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Business ministration De'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Financial Reporting And Auditing',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Financial Reporting And Auditing'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Finance'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Local Government With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Local Government With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Movement And Training Sciences In Sports',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Movement And Training Sciences In Sports'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Movement And Training Sciences In Sports Wit',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Movement And Training Sciences In Sports Wit'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music And Performing Arts',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music And Performing Arts'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music And Performing Arts With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music And Performing Arts With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Jouralism',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Jouralism'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Journalism With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Journalism With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations (D',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations (D'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations W',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations W'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration Wit',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration Wit'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology With Thesis',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Cinema With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Cinema With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Strategic Marketing And Brand Management',
  'Master',
  'Turkish',
  3300,
  1,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Strategic Marketing And Brand Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Strategic Marketing And Brand Management W',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Strategic Marketing And Brand Management W'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism Management',
  'Master',
  'Turkish',
  3300,
  4,
  now(),
  true,
  NULL,
  3300,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3300
      AND COALESCE(p.cost, -1) = 3300
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism Management With Thesis',
  'Master',
  'Turkish',
  3850,
  2,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'dog bl go douall a,!!',
  'Master',
  'Turkish',
  3850,
  4,
  now(),
  true,
  NULL,
  3850,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'dog bl go douall a,!!'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3850
      AND COALESCE(p.cost, -1) = 3850
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'English',
  6000,
  4,
  now(),
  true,
  NULL,
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'PhD',
  'English',
  6000,
  4,
  now(),
  true,
  NULL,
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Management',
  'PhD',
  'Turkish',
  6000,
  4,
  now(),
  true,
  NULL,
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Management'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance And Banking',
  'PhD',
  'Turkish',
  6000,
  4,
  now(),
  true,
  NULL,
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance And Banking'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Movement And Exercise Sciences',
  'PhD',
  'Turkish',
  6000,
  4,
  now(),
  true,
  NULL,
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Movement And Exercise Sciences'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 6000
  );
