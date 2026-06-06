-- Seed programs from 2026-05-06 second screenshot batch (Atılım/Kyrenia/Kadir Has).
-- Idempotent insert and always populate name_ar (fallback to English when Arabic OCR is unavailable).

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aerospace Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Aerospace Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aerospace Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aircraft Maintenance And Repair',
  'Bachelor',
  'English',
  10875,
  4,
  now(),
  true,
  'Aircraft Maintenance And Repair',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aircraft Maintenance And Repair'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 10875
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Audiology',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Audiology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Automotive Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Automotive Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Automotive Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Electrics And Electronics (Avionics)',
  'Bachelor',
  'English',
  10875,
  4,
  now(),
  true,
  'Aviation Electrics And Electronics (Avionics)',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Electrics And Electronics (Avionics)'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 10875
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Aviation Management',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Business Administration',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemical Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Chemical Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Chemical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Child Development',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Civil Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Computer Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Economics',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Energy Systems Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Energy Systems Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Energy Systems Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'English Language And Literature',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language And Literature'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Finance',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Industrial Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information System Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Information System Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information System Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'International Relations',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'International Trade And Logistics',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Logistics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Mathematics',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Mechanical Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Mechatronics Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'English',
  20250,
  4,
  now(),
  true,
  'Medicine',
  27000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 27000
      AND COALESCE(p.cost, -1) = 20250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Nursing',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pilotage',
  'Bachelor',
  'English',
  22000,
  4,
  now(),
  true,
  'Pilotage',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pilotage'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Psychology',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Software Engineering',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Translation And Interpretation (English)',
  'Bachelor',
  'English',
  7250,
  4,
  now(),
  true,
  'Translation And Interpretation (English)',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Translation And Interpretation (English)'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Architecture',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Business Administration',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'Turkish',
  7250,
  2,
  now(),
  true,
  'Economics',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Fashion And Textile Design',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion And Textile Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Graphic Design',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Graphic Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Design',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Industrial Design',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Product Design',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Industrial Product Design',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Product Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'Turkish',
  10875,
  2,
  now(),
  true,
  'Interior Architecture And Environmental Desigr',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 10875
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Bachelor',
  'Turkish',
  7250,
  4,
  now(),
  true,
  'Political Science And Public Administration',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14500
      AND COALESCE(p.cost, -1) = 7250
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Anesthesia',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Court Office Services',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Court Office Services',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Court Office Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'E-Commerce And Marketing',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'E-Commerce And Marketing',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'E-Commerce And Marketing'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'First And Emergency Aid',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Medical Imaging Techniques',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Medical Laboratory Techniques',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Operating Room Services',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Operating Room Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Physiotherapy',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Physics',
  'Master',
  'English',
  8800,
  4,
  now(),
  true,
  'Applied Physics',
  8800,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied Physics'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8800
      AND COALESCE(p.cost, -1) = 8800
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Physics With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Applied Physics With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied Physics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture With Thesis',
  'Master',
  'English',
  8200,
  2,
  now(),
  true,
  'Architecture With Thesis',
  8200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'English',
  6700,
  4,
  now(),
  true,
  'Business Administration',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration (De)',
  'Master',
  'English',
  6700,
  1,
  now(),
  true,
  'Business Administration (De)',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration (De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  6700,
  4,
  now(),
  true,
  'Business Administration With Thesis',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Master',
  'English',
  8200,
  1,
  now(),
  true,
  'Civil Engineering',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Civil Engineering With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Computer Engineering',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Computer Engineering With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  8200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering With The',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering With The',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Global Politics And International Relations',
  'Master',
  'English',
  6700,
  4,
  now(),
  true,
  'Global Politics And International Relations',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Global Politics And International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Global Politics And International Relations With',
  'Master',
  'English',
  6700,
  4,
  now(),
  true,
  'Global Politics And International Relations With',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Global Politics And International Relations With'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Industrial Engineering With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technologies With Thesis',
  'Master',
  'English',
  8200,
  2,
  now(),
  true,
  'Information Technologies With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Information Technologies With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Manufacturing Engineering',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Manufacturing Engineering',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Manufacturing Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Manufacturing Engineering With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Manufacturing Engineering With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Manufacturing Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Mathematics',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Mathematics With Thesis',
  8200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Mechatronics Engineering',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Mechatronics Engineering With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Metallurgical And Materials Engineering',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Metallurgical And Materials Engineering',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Metallurgical And Materials Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Metallurgical And Materials Engineering With T',
  'Master',
  'English',
  8200,
  2,
  now(),
  true,
  'Metallurgical And Materials Engineering With T',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Metallurgical And Materials Engineering With T'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Master',
  'English',
  8200,
  1,
  now(),
  true,
  'Software Engineering',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering With Thesis',
  'Master',
  'English',
  8200,
  4,
  now(),
  true,
  'Software Engineering With Thesis',
  8200,
  2011,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Translation Studies',
  'Master',
  'English',
  6700,
  1,
  now(),
  true,
  'Translation Studies',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Translation Studies'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Translation Studies With Thesis',
  'Master',
  'English',
  6700,
  4,
  now(),
  true,
  'Translation Studies With Thesis',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Translation Studies With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Economics',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Applied Economics',
  6700,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied Economics'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Economics With Thesis',
  'Master',
  'Turkish',
  6700,
  2,
  now(),
  true,
  'Applied Economics With Thesis',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied Economics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Business Administration',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration ( De)',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Business Administration ( De)',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration ( De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Literature and Culture',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'English Literature and Culture',
  6700,
  2011,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Literature and Culture'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Literature and Culture With Thesis',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'English Literature and Culture With Thesis',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Literature and Culture With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'European Union Relations',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'European Union Relations',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'European Union Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'European Union Relations With Thesis',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'European Union Relations With Thesis',
  6700,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'European Union Relations With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Finance',
  6700,
  2011,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance With Thesis',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Finance With Thesis',
  6700,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Care Organizations Management',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Health Care Organizations Management',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Care Organizations Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Care Organizations Management With 1',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Health Care Organizations Management With 1',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Care Organizations Management With 1'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Interior Architecture And Environmental Desigr',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecology',
  'Master',
  'Turkish',
  8200,
  4,
  now(),
  true,
  'Obstetrics And Gynecology',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Obstetrics And Gynecology'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecology With Thesis',
  'Master',
  'Turkish',
  8200,
  2,
  now(),
  true,
  'Obstetrics And Gynecology With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Obstetrics And Gynecology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  8200,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation With Thesis',
  8200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8200
      AND COALESCE(p.cost, -1) = 8200
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Political Science And Public Administration',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration Wit',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Political Science And Public Administration Wit',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration Wit'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Private Law',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law With Thesis',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Private Law With Thesis',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Public Law',
  6700,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism Management',
  'Master',
  'Turkish',
  6700,
  4,
  now(),
  true,
  'Tourism Management',
  6700,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6700
      AND COALESCE(p.cost, -1) = 6700
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'English',
  20500,
  4,
  now(),
  true,
  'Business Administration',
  20500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20500
      AND COALESCE(p.cost, -1) = 20500
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
  'Civil Engineering',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
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
  'Electrical And Computer Engineering',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Computer Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
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
  'Mathematics',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
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
  'Mechanical Engineering',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
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
  'Modeling and Design of Engineering Systems',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Modeling and Design of Engineering Systems'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
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
  'Software Engineering',
  22000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
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
  'Architecture',
  16500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 16500
      AND COALESCE(p.cost, -1) = 16500
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
  'Business Administration',
  20500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 20500
      AND COALESCE(p.cost, -1) = 20500
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
  'Political Economy',
  20500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Economy'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 20500
      AND COALESCE(p.cost, -1) = 20500
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
  'Political Science And Public Administration',
  20500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 20500
      AND COALESCE(p.cost, -1) = 20500
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
  'Private Law',
  20500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 20500
      AND COALESCE(p.cost, -1) = 20500
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
  'Public Law',
  20500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 20500
      AND COALESCE(p.cost, -1) = 20500
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Advertising',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Architecture',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Business Administration',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Computer Engineering',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Economics',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Design',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Industrial Design',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Industrial Engineering',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Design',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Interior Architecture And Environmental Design',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'International Trade And Finance',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Management Information Systems',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Mechatronics Engineering',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechatronics Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Molecular Biology And Genetics',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Molecular Biology And Genetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'New Media',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Political Science And International Relations',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Psychology',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Radio Television And Film',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Film'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'Visual Communication Design',
  20000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kadir Has University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Visual Communication Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 20000
      AND COALESCE(p.cost, -1) = 6000
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Architecture',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'English',
  3925,
  4,
  now(),
  true,
  'Aviation Management',
  3925,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3925
      AND COALESCE(p.cost, -1) = 3925
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Finance',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Banking And Finance',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Civil Engineering',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Computer Engineering',
  62705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 62705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  7090,
  4,
  now(),
  true,
  'Dentistry',
  7090,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 7090
      AND COALESCE(p.cost, -1) = 7090
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Teaching',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'English Language Teaching',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Interior Architecture',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business Administration',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'International Business Administration',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'International Relations',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Law',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Logistics Management',
  62705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 62705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Engineering',
  'Bachelor',
  'English',
  3190,
  4,
  now(),
  true,
  'Marine Engineering',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Management',
  'Bachelor',
  'English',
  3190,
  4,
  now(),
  true,
  'Marine Management',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Transportation And Ba Engineering',
  'Bachelor',
  'English',
  3190,
  4,
  now(),
  true,
  'Marine Transportation And Ba Engineering',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Transportation And Ba Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  63190,
  4,
  now(),
  true,
  'Mechanical Engineering',
  3190,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 63190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'English',
  7615,
  4,
  now(),
  true,
  'Medicine',
  7615,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 7615
      AND COALESCE(p.cost, -1) = 7615
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  1970,
  4,
  now(),
  true,
  'Nursing',
  1970,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1970
      AND COALESCE(p.cost, -1) = 1970
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  4112,
  5,
  now(),
  true,
  'Pharmacy',
  4112,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4112
      AND COALESCE(p.cost, -1) = 4112
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pilotage',
  'Bachelor',
  'English',
  10750,
  4,
  now(),
  true,
  'Pilotage',
  10750,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pilotage'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 10750
      AND COALESCE(p.cost, -1) = 10750
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Psychology',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Software Engineering',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism And Hotel Management',
  'Bachelor',
  'English',
  2705,
  4,
  now(),
  true,
  'Tourism And Hotel Management',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism And Hotel Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'Turkish',
  2705,
  4,
  now(),
  true,
  'Architecture',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'Turkish',
  2705,
  4,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Guidance And Psychological Counseling',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Guidance And Psychological Counseling',
  63190,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Guidance And Psychological Counseling'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 63190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'Bachelor',
  'Turkish',
  2705,
  4,
  now(),
  true,
  'Interior Architecture',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'Turkish',
  2705,
  4,
  now(),
  true,
  'Law',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Engineering',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Marine Engineering',
  3190,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Transportation And Ba Engineering',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Marine Transportation And Ba Engineering',
  3190,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Transportation And Ba Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Medical Imaging Techniques',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'Turkish',
  7615,
  4,
  now(),
  true,
  'Medicine',
  7615,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7615
      AND COALESCE(p.cost, -1) = 7615
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  1970,
  4,
  now(),
  true,
  'Nursing',
  1970,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1970
      AND COALESCE(p.cost, -1) = 1970
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  62705,
  4,
  now(),
  true,
  'Psychology',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 62705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'Turkish',
  2705,
  4,
  now(),
  true,
  'Software Engineering',
  2705,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Special Education',
  'Bachelor',
  'Turkish',
  3190,
  4,
  now(),
  true,
  'Special Education',
  3190,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Special Education'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Language Teaching',
  'Bachelor',
  'Turkish',
  2705,
  4,
  now(),
  true,
  'Turkish Language Teaching',
  2705,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Turkish Language Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2705
      AND COALESCE(p.cost, -1) = 2705
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied English And Translation',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Applied English And Translation',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied English And Translation'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Air Transportation Management',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Civil Air Transportation Management',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Air Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Civil Aviation Cabin Services',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Computer Programming',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Security',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Cyber Security',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cyber Security'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Dental Prosthesis',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dental Prosthesis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elderly Care',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Elderly Care',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Elderly Care'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Maritime Management And Operations',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Maritime Management And Operations',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Maritime Management And Operations'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Maritime Transportation Management',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'Maritime Transportation Management',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Maritime Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'a Kyrenia UniversitiZyprus',
  'Diploma',
  'English',
  3190,
  2,
  now(),
  true,
  'a Kyrenia UniversitiZyprus',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'a Kyrenia UniversitiZyprus'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  '0 Kyrenia Universitizyprus',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  '0 Kyrenia Universitizyprus',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = '0 Kyrenia Universitizyprus'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Anesthesia',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Computer Programming',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cooking',
  'Diploma',
  'Turkish',
  63190,
  2,
  now(),
  true,
  'Cooking',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cooking'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 63190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Dental Prosthesis',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dental Prosthesis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elderly Care',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Elderly Care',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Elderly Care'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electro Neurophysiology',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Electro Neurophysiology',
  63190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electro Neurophysiology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 63190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Environmental Protection And Control',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Environmental Protection And Control',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Environmental Protection And Control'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Justice',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Justice',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Justice'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Medical Imaging Techniques',
  3190,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Operating Room Services',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Operating Room Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Oral And Dental Health',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Dental Health'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Physiotherapy',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Underwater Technologies',
  'Diploma',
  'Turkish',
  3190,
  2,
  now(),
  true,
  'Underwater Technologies',
  3190,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Underwater Technologies'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3190
      AND COALESCE(p.cost, -1) = 3190
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aerospace Engineering With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Aerospace Engineering With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aerospace Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Aviation Management With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Finance',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Banking And Finance',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Finance'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Finance With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Banking And Finance With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Finance With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Big Data Analytics With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Big Data Analytics With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Big Data Analytics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Business Administration With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Clinical Psychology With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'International Relations',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations With Thesis',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'International Relations With Thesis',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Sciences',
  'Master',
  'English',
  1254,
  4,
  now(),
  true,
  'Marine Sciences',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Sciences'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Transportation And Ba Engineering Witt',
  'Master',
  'English',
  1254,
  2,
  now(),
  true,
  'Marine Transportation And Ba Engineering Witt',
  1254,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Transportation And Ba Engineering Witt'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1254
      AND COALESCE(p.cost, -1) = 1254
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Allergy And Immunology',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  'Allergy And Immunology',
  1510,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Allergy And Immunology'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1510
      AND COALESCE(p.cost, -1) = 1510
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Transportation And Ba Engineering',
  'PhD',
  'English',
  1510,
  4,
  now(),
  true,
  'Marine Transportation And Ba Engineering',
  1510,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Transportation And Ba Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 1510
      AND COALESCE(p.cost, -1) = 1510
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marine Transportation And Ba Engineering',
  'PhD',
  'Turkish',
  1510,
  4,
  now(),
  true,
  'Marine Transportation And Ba Engineering',
  1510,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Marine Transportation And Ba Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 1510
      AND COALESCE(p.cost, -1) = 1510
  );
