-- Okan University bachelor, master, and associate (diploma) programs from official 2026–2027 international price list.
-- PhD rows are omitted (already covered by V10). Idempotent per university + name + degree + language + before_discount.

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'English',
  22500,
  6,
  now(),
  true,
  NULL,
  22500,
  21375,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'Turkish',
  19500,
  6,
  now(),
  true,
  NULL,
  19500,
  18525,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 19500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  18000,
  5,
  now(),
  true,
  NULL,
  18000,
  17100,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 18000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'Turkish',
  15000,
  5,
  now(),
  true,
  NULL,
  15000,
  14250,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 15000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  8000,
  5,
  now(),
  true,
  NULL,
  8000,
  7600,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'Turkish',
  9000,
  5,
  now(),
  true,
  NULL,
  9000,
  8550,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
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
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition & Dietetics',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition & Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition & Dietetics',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition & Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy & Rehabilitation',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy & Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy & Rehabilitation',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy & Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Automotive Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Automotive Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
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
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical & Electronic Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical & Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Genetics & Bioengineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Genetics & Bioengineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geomatics Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geomatics Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
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
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

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
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics & Finance',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics & Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Finance and Banking',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Finance and Banking'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science and International Relations',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science and International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science and International Relations',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science and International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Flight Training (Pilotage)',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  NULL,
  8000,
  7600,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Flight Training (Pilotage)'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy & Culinary Arts',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy & Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy & Culinary Arts',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy & Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Systems & Technologies',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Systems & Technologies'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Systems & Technologies',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Systems & Technologies'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media & Communication',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media & Communication'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations & Advertising',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations & Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema & Television',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cinema & Television'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Game Design',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Digital Game Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture & Environmental Design',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture & Environmental Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture & Environmental Design',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture & Environmental Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Textile & Fashion Design',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Textile & Fashion Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Visual Communication Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chinese Translation & Interpreting',
  'Bachelor',
  'Chinese and Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Chinese Translation & Interpreting'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Chinese and Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Translation & Interpreting',
  'Bachelor',
  'English and Turkish',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Translation & Interpreting'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English and Turkish'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Russian Translation & Interpreting',
  'Bachelor',
  'Russian and Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Russian Translation & Interpreting'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Russian and Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Teaching',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pre-School Teaching',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pre-School Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychological Counseling & Guidance',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychological Counseling & Guidance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Special Education Teaching',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Special Education Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Theater',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Theater'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anatomy (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anatomy (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting & Auditing (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting & Auditing (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting & Auditing (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting & Auditing (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting & Auditing (Without Thesis) (Distance Learning)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting & Auditing (Without Thesis) (Distance Learning)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advanced Electronics & Communication Technology (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Advanced Electronics & Communication Technology (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Engineering (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Artificial Intelligence Engineering (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Engineering (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Artificial Intelligence Engineering (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Automotive Mechatronics & Intelligent Vehicles (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Automotive Mechatronics & Intelligent Vehicles (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking (Without Thesis) (Distance Learning)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking (Without Thesis) (Distance Learning)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking & Finance (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking & Finance (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development & Education (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development & Education (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development & Education (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development & Education (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema & Television (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cinema & Television (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema & Television (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cinema & Television (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology (With Thesis)',
  'Master',
  'Turkish',
  28500,
  2,
  now(),
  true,
  NULL,
  28500,
  27075,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 28500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology (Without Thesis)',
  'Master',
  'Turkish',
  23750,
  1,
  now(),
  true,
  NULL,
  23750,
  22565,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 23750
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economy Law',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economy Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economy Law',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economy Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Administration & Supervision (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Administration & Supervision (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Administration & Supervision (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Administration & Supervision (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Entrepreneurship (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Entrepreneurship (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Entrepreneurship (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Entrepreneurship (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Explosives Engineering (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Explosives Engineering (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Explosives Engineering (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Explosives Engineering (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion Design (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion Design (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion Design (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion Design (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geomatics Engineering (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geomatics Engineering (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geomatics Engineering (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geomatics Engineering (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geotechnical Engineering (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geotechnical Engineering (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geotechnical Engineering (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geotechnical Engineering (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Healthcare Management (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Healthcare Management (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Healthcare Management (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Healthcare Management (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Systems (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Systems (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Systems (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Systems (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Systems (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Systems (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Systems (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Systems (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technology (IT) Law (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Technology (IT) Law (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technology (IT) Law (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Technology (IT) Law (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture & Environmental Design (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture & Environmental Design (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture & Environmental Design (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture & Environmental Design (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Logistics (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Logistics (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Logistics (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Logistics (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Local Administrations (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Local Administrations (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Local Administrations (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Local Administrations (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management (Without Thesis) (Distance Learning)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management (Without Thesis) (Distance Learning)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marketing (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marketing (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marketing (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marketing (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marketing Communication (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marketing Communication (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'MBA – Business Administration (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'MBA – Business Administration (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'MBA – Business Administration (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'MBA – Business Administration (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'MBA – Business Administration (Without Thesis)',
  'Master',
  'English',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'MBA – Business Administration (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'MBA – Business Administration (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'MBA – Business Administration (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'MBA – Business Administration (Without Thesis) (Distance Learning)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'MBA – Business Administration (Without Thesis) (Distance Learning)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Music (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition & Dietetic (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition & Dietetic (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition & Dietetic (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition & Dietetic (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health & Safety (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health & Safety (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health & Safety (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health & Safety (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Painting (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Painting (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Painting (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Painting (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy & Rehabilitation (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy & Rehabilitation (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy & Rehabilitation (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy & Rehabilitation (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Power Electronics & Clean Energy Systems (With Thesis)',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  NULL,
  6000,
  5700,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Power Electronics & Clean Energy Systems (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pre-school Education (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pre-school Education (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pre-school Education (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pre-school Education (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Quality Management in Healthcare (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Quality Management in Healthcare (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Quality Management in Healthcare (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Quality Management in Healthcare (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Real Estate Finance & Valuation (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Real Estate Finance & Valuation (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Real Estate Finance & Valuation (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Real Estate Finance & Valuation (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Real Estate Finance & Valuation (Without Thesis)(Distance Learning)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Real Estate Finance & Valuation (Without Thesis)(Distance Learning)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sales & Marketing (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sales & Marketing (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sales & Marketing (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sales & Marketing (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social & Cultural Studies (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social & Cultural Studies (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social & Cultural Studies (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social & Cultural Studies (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Physiology (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Physiology (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Physiology (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Physiology (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism Management (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism Management (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism & Hospitality (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism & Hospitality (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism & Hospitality (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism & Hospitality (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Translation Studies (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Translation Studies (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Translation Studies (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Translation Studies (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urban Renewal (With Thesis)',
  'Master',
  'Turkish',
  4500,
  2,
  now(),
  true,
  NULL,
  4500,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Urban Renewal (With Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urban Renewal (Without Thesis)',
  'Master',
  'Turkish',
  3500,
  1,
  now(),
  true,
  NULL,
  3500,
  3325,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Urban Renewal (Without Thesis)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting and Tax Practices',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting and Tax Practices'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aircraft Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aircraft Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Restoration',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Restoration'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Operation',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Artificial Intelligence Operation'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiometry',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Audiometry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking and Insurance',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking and Insurance'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Air Transportation Management',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Air Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Air Transportation Management',
  'Diploma',
  'English',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Air Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'English',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cloud Computing Operation',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cloud Computing Operation'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Aided Design (CAD) & Animation Program',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Aided Design (CAD) & Animation Program'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Equipment Operations',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Equipment Operations'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Control and Automation Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Control and Automation Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cooking',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cooking'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Court Office Services',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Court Office Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dialysis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Health Systems Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Digital Health Systems Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Transformation Electronics',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Digital Transformation Electronics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'E-Commerce and Marketing',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'E-Commerce and Marketing'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elderly Care Services',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Elderly Care Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electricity',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electricity'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electroneurophysiology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electroneurophysiology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electronic Communication Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electronic Communication Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First Aid & Emergency',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First Aid & Emergency'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Flight Operations Management',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Flight Operations Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Foreign Trade',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Foreign Trade'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Foreign Trade',
  'Diploma',
  'English',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Foreign Trade'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Graphic Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Heating, Ventilation & Air Conditioning (HVAC) Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Heating, Ventilation & Air Conditioning (HVAC) Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Design',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Machinery',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Machinery'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mobile Technologies',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mobile Technologies'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Natural Gas and Installation Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Natural Gas and Installation Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health & Safety',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health & Safety'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health & Safety (Distance Learning)',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health & Safety (Distance Learning)'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operation Room Services',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Operation Room Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Opticianry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral & Dental Health',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral & Dental Health'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pathology Laboratory Techniques',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pathology Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radiotherapy',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Smart Infrastructure Technology',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Smart Infrastructure Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Surveying & Cadastre',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Surveying & Cadastre'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Web Design and Programming',
  'Diploma',
  'Turkish',
  2025,
  2,
  now(),
  true,
  NULL,
  2025,
  1925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Okan University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Web Design and Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2025
  );

