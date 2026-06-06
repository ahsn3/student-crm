-- PhD / Combined PhD programs (excludes Drama Ve Acting). Idempotent per university + name + degree.

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'English',
  20500,
  4,
  now(),
  true,
  NULL,
  20500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Islamic Economics And Law',
  'PhD',
  'Arabic',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Islamic Economics And Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Arabic'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urbanism And Urban Transformation',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Urbanism And Urban Transformation'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design Art Qualification',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Graphic Design Art Qualification'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Science And Engineering',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Science And Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'PhD',
  'Turkish',
  20500,
  4,
  now(),
  true,
  NULL,
  20500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Neuroscience'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Oncology',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Molecular Oncology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacutical Chemistry',
  'CombinedPhD',
  'English',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacutical Chemistry'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature',
  'CombinedPhD',
  'English',
  20000,
  5,
  now(),
  true,
  NULL,
  20000,
  19000,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language And Literature'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Philosophy And Religious Studies',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Philosophy And Religious Studies'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Modeling and Design of Engineering Systems',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Modeling and Design of Engineering Systems'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Islamic Economics And Finance',
  'PhD',
  'English',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Islamic Economics And Finance'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Auditing',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Auditing'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Midwifery'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  7800,
  7020,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Visual Communication Design'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Food Engineering',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Food Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8100,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'CombinedPhD',
  'English',
  20000,
  5,
  now(),
  true,
  NULL,
  20000,
  19000,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Speech And Language Therapy'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  7800,
  7020,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Management',
  'CombinedPhD',
  'English',
  20000,
  5,
  now(),
  true,
  NULL,
  20000,
  19000,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Management'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Restorative Dentistry',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Lokman Hekim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Restorative Dentistry'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Teaching',
  'CombinedPhD',
  'English',
  20000,
  5,
  now(),
  true,
  NULL,
  20000,
  19000,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Teaching'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Work',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social Work'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiology',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8100,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'CombinedPhD',
  'English',
  20000,
  5,
  now(),
  true,
  NULL,
  20000,
  19000,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Biology And Genetics',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Biology And Genetics'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Islamic Sciences',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Islamic Sciences'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Computer Engineering',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Computer Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'PhD',
  'Turkish',
  20500,
  4,
  now(),
  true,
  NULL,
  20500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Language And Literature',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Turkish Language And Literature'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Histology And Embryology',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Histology And Embryology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Family Counseling And Education',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Family Counseling And Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  20500,
  4,
  now(),
  true,
  NULL,
  20500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'PhD',
  'Turkish',
  16000,
  4,
  now(),
  true,
  NULL,
  16000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Publicity',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Publicity'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8100,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Speech And Language Therapy'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Stem Cell And Tissue Engineering',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Stem Cell And Tissue Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physical Education And Sports',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physical Education And Sports'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecology',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Obstetrics And Gynecology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthetic Dentistry',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Lokman Hekim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Prosthetic Dentistry'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Psychology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied Psychology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'PhD',
  'Turkish',
  16500,
  4,
  now(),
  true,
  NULL,
  16500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Food Engineering',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Food Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sociology',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sociology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Education Management',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Education Management'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Lokman Hekim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Genetics',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8100,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Genetics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Management'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communications Sciences',
  'CombinedPhD',
  'Turkish',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Communications Sciences'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'CombinedPhD',
  'English',
  20000,
  5,
  now(),
  true,
  NULL,
  20000,
  19000,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  7800,
  7020,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemistry',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Chemistry'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'History And Civilization Studies',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'History And Civilization Studies'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Economy',
  'PhD',
  'Turkish',
  20500,
  4,
  now(),
  true,
  NULL,
  20500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Economy'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Internal Medicine Nursing',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Internal Medicine Nursing'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Islamic Economics And Finance',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Islamic Economics And Finance'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Microbiology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Microbiology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physics',
  'CombinedPhD',
  'English',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physics'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Television And Cinema',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Television And Cinema'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'PhD',
  'English',
  22000,
  4,
  now(),
  true,
  NULL,
  22000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'PhD',
  'Turkish',
  18000,
  4,
  now(),
  true,
  NULL,
  18000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Bilgi University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Food Safety',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Food Safety'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'PhD',
  'English',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'English',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Preschool Education',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Preschool Education'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Management',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Management'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'PhD',
  'Turkish',
  20500,
  4,
  now(),
  true,
  NULL,
  20500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Atılım University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemistry',
  'CombinedPhD',
  'English',
  12500,
  5,
  now(),
  true,
  NULL,
  12500,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstinye University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Chemistry'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Islamic Sciences',
  'PhD',
  'Arabic',
  12000,
  4,
  now(),
  true,
  NULL,
  12000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Sabahattin Zaim University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Islamic Sciences'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Arabic'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'The Though, History, And Literature Of Islamic Civilization',
  'PhD',
  'Turkish',
  13300,
  4,
  now(),
  true,
  NULL,
  13300,
  11970,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'The Though, History, And Literature Of Islamic Civilization'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'PhD',
  'Turkish',
  18000,
  4,
  now(),
  true,
  NULL,
  18000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'İstanbul Bilgi University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'PhD',
  'Turkish',
  19100,
  4,
  now(),
  true,
  NULL,
  19100,
  17190,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Aydın University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Audiology'
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Preschool Education',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Preschool Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Surgical Nursing',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Surgical Nursing'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Anatomy',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8100,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Anatomy'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'General Psychology',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'General Psychology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Periodontology',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Periodontology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Land Planning and Management',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Land Planning and Management'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Management'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Zoo Techniques',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Zoo Techniques'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  7800,
  7020,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Psychology',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied Psychology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Law',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Toxicology',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Toxicology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacognosy',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacognosy'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Education And Instructional Technologies',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Education And Instructional Technologies'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Phytotherapy',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Phytotherapy'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecologic Nursing',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Obstetrics And Gynecologic Nursing'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Biochemistry',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Biochemistry'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Law',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Food Hygiene And Technology',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Food Hygiene And Technology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'General Psychology',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'General Psychology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Histology And Embryology',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Histology And Embryology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmaceutical Chimistry',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmaceutical Chimistry'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8100,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Üsküdar University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Neuroscience'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
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
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Nişantaşı University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Restorative Dentistry',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Restorative Dentistry'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Endodontics',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Endodontics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Administration, Supervision And Planning',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Administration, Supervision And Planning'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physical Education And Sports',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physical Education And Sports'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Teaching',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Teaching'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Department of Surgery',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Department of Surgery'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Environmental Education',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Environmental Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Petrol And Natural Gas Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Petrol And Natural Gas Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Programs And Instruction',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Programs And Instruction'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Innovation And Knowledge Management',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Innovation And Knowledge Management'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physics Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physics Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthodontics',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Prosthodontics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
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
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Nişantaşı University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance And Banking'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'History Teaching',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'History Teaching'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Law',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Toxicology',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Toxicology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Programs And Instruction',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Programs And Instruction'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'PhD',
  'English',
  9000,
  4,
  now(),
  true,
  NULL,
  9000,
  8550,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'PhD',
  'Turkish',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Topkapı University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmaceutical Botany',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmaceutical Botany'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Microbiology And Clinical Microbiology',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Microbiology And Clinical Microbiology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'PhD',
  'Turkish',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Topkapı University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Folklore Education',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Folklore Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Special Education',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Special Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Preschool Education',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Preschool Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics',
  'PhD',
  'Turkish',
  15000,
  4,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Orthodontics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Administration, Supervision And Planning',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Administration, Supervision And Planning'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'PhD',
  'Turkish',
  7000,
  4,
  now(),
  true,
  NULL,
  7000,
  6650,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Orthodontics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Special Education',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Special Education'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pedodontics',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pedodontics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Education And Instructional Technologies',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  NULL,
  1510,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Education And Instructional Technologies'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Surgery',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Maxillofacial Surgery'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecology',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Obstetrics And Gynecology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Radiology',
  'PhD',
  'Turkish',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Maxillofacial Radiology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Biology And Genetics',
  'PhD',
  'English',
  2377,
  4,
  now(),
  true,
  NULL,
  2377,
  NULL,
  '2026-03-27T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Near East University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Biology And Genetics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );

