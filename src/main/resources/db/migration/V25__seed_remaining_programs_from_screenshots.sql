-- Second pass seed from screenshots with improved extraction coverage.
-- Includes Kultur/HKU/Antalya Bilim and is idempotent.

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  3735,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3735
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  3735,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3735
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'Turkish',
  11900,
  4,
  now(),
  true,
  NULL,
  14000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 14000
      AND COALESCE(p.cost, -1) = 11900
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'Turkish',
  4150,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 4150
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Bachelor',
  'Turkish',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Midwifery'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pilotage',
  'Bachelor',
  'Turkish',
  8300,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pilotage'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 8300
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism Management',
  'Bachelor',
  'English',
  3320,
  4,
  now(),
  true,
  NULL,
  8300,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8300
      AND COALESCE(p.cost, -1) = 3320
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Technology',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cooking',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cooking'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Court And Office Management',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Court And Office Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dialysis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticiany',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Opticiany'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Dental Health'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Surgery Services',
  'Diploma',
  'Turkish',
  2340,
  2,
  now(),
  true,
  NULL,
  5200,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Surgery Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 2340
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'Turkish',
  3400,
  4,
  now(),
  true,
  NULL,
  4000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4000
      AND COALESCE(p.cost, -1) = 3400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Master',
  'Turkish',
  3400,
  4,
  now(),
  true,
  NULL,
  4000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4000
      AND COALESCE(p.cost, -1) = 3400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Global Politics And International Relations',
  'Master',
  'Turkish',
  3400,
  4,
  now(),
  true,
  NULL,
  4000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Global Politics And International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4000
      AND COALESCE(p.cost, -1) = 3400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Global Politics And International Relations With',
  'Master',
  'English',
  4590,
  2,
  now(),
  true,
  NULL,
  5400,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Global Politics And International Relations With'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5400
      AND COALESCE(p.cost, -1) = 4590
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Master',
  'Turkish',
  3400,
  4,
  now(),
  true,
  NULL,
  4000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4000
      AND COALESCE(p.cost, -1) = 3400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'Master',
  'Turkish',
  3400,
  4,
  now(),
  true,
  NULL,
  4000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4000
      AND COALESCE(p.cost, -1) = 3400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'Master',
  'Turkish',
  3400,
  4,
  now(),
  true,
  NULL,
  4000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4000
      AND COALESCE(p.cost, -1) = 3400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  7650,
  4,
  now(),
  true,
  NULL,
  9000,
  1000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Antalya Bilim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7650
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aerospace Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aerospace Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
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
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Teaching',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Guidance And Psychological Counseling',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Guidance And Psychological Counseling'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Hasan Kalyoncu UniversitYurkey',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  2011,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Hasan Kalyoncu UniversitYurkey'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Logistics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Logistics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'Turkish',
  6500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 6500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mechanical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Preschool Education',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Preschool Education'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Primary School Teaching',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Primary School Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Film'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
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
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Visual Communication Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 8000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Insurance',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Insurance'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dialysis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  2020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Justice',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Justice'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Uav Technologies And Operations',
  'Diploma',
  'Turkish',
  2500,
  2,
  now(),
  true,
  NULL,
  2500,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Uav Technologies And Operations'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2500
      AND COALESCE(p.cost, -1) = 2500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Finance With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Finance With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
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
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 6000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Environmental Sciences And Energy Managem',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Environmental Sciences And Energy Managem'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Logistics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations W',
  'Master',
  'English',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations W'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design With Thesis',
  'Master',
  'Turkish',
  2250,
  4,
  now(),
  true,
  NULL,
  2250,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Visual Communication Design With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2250
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'PhD',
  'Turkish',
  3600,
  4,
  now(),
  true,
  NULL,
  3600,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3600
      AND COALESCE(p.cost, -1) = 3600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'PhD',
  'Turkish',
  3600,
  4,
  now(),
  true,
  NULL,
  3600,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3600
      AND COALESCE(p.cost, -1) = 3600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'PhD',
  'Turkish',
  3600,
  4,
  now(),
  true,
  NULL,
  3600,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3600
      AND COALESCE(p.cost, -1) = 3600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'PhD',
  'Turkish',
  3600,
  4,
  now(),
  true,
  NULL,
  3600,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Hasan Kalyoncu University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 3600
      AND COALESCE(p.cost, -1) = 3600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cartoon And Animation',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cartoon And Animation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communication And Design',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Communication And Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communication Arts',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Communication Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Game Design',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Digital Game Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elementary Education',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Elementary Education'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language And Literature'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Teaching',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Guidance And Psychological Counseling',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Guidance And Psychological Counseling'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'Turkish',
  6000,
  4,
  now(),
  true,
  NULL,
  12000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 12000
      AND COALESCE(p.cost, -1) = 6000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Molecular Biology And Genetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Film'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  NULL,
  9000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Software Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 4500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Language And Literature',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  NULL,
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Turkish Language And Literature'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6000
      AND COALESCE(p.cost, -1) = 3000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Air Conditioning And Refrigeration Technologie',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Air Conditioning And Refrigeration Technologie'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aircraft Technology',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aircraft Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Altemative Energy And Sources Technology',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Altemative Energy And Sources Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Logistics',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Logistics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Insurance',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Insurance'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Air Transportation Management',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Air Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Technology',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Court And Office Management',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Court And Office Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'E-Commerce And Marketing',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'E-Commerce And Marketing'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electronics technology',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electronics technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion Design',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Fashion Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Flight Operations Management',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Flight Operations Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Foreign Trade',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Foreign Trade'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Graphic Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretarial',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Documentation And Secretarial'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Opticianry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Publicity',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Publicity'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Tourism And Hotel Management',
  'Diploma',
  'Turkish',
  2250,
  2,
  now(),
  true,
  NULL,
  4500,
  2250,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Tourism And Hotel Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4500
      AND COALESCE(p.cost, -1) = 2250
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Design',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Design'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Design With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Design With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Engineering',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Engineering With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture With Thesis',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Art Management With Thesis',
  'Master',
  'Turkish',
  4550,
  2,
  now(),
  true,
  NULL,
  4550,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Art Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'English',
  7150,
  4,
  now(),
  true,
  NULL,
  7150,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 7150
      AND COALESCE(p.cost, -1) = 7150
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration (De)',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration (De)'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration De With Thesis',
  'Master',
  'Turkish',
  6240,
  4,
  now(),
  true,
  NULL,
  6240,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration De With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6240
      AND COALESCE(p.cost, -1) = 6240
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Management',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'Master',
  'Turkish',
  11500,
  4,
  now(),
  true,
  NULL,
  11500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 11500
      AND COALESCE(p.cost, -1) = 11500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
  'Turkish',
  13500,
  2,
  now(),
  true,
  NULL,
  13500,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Clinical Psychology With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 13500
      AND COALESCE(p.cost, -1) = 13500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communication And Design With Thesis',
  'Master',
  'English',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Communication And Design With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communication Arts With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Communication Arts With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Management With Thesis',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Directorship With Thesis',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Directorship With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Education Management',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Education Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Education Management With Thesis',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Education Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Programs And Instruction',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Programs And Instruction'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Programs And Instruction With The',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Educational Programs And Instruction With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering With The',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'English',
  6240,
  4,
  now(),
  true,
  NULL,
  6240,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6240
      AND COALESCE(p.cost, -1) = 6240
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Engineering Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature With Thesis',
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
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language And Literature With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Education With Thesis',
  'Master',
  'English',
  5000,
  4,
  now(),
  true,
  NULL,
  5000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Education With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Environmental Design With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Environmental Design With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'European Union Studies With Thesis',
  'Master',
  'English',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'European Union Studies With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Executive Business Administration',
  'Master',
  'English',
  7800,
  4,
  now(),
  true,
  NULL,
  7800,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Executive Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geomatic Engineering With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geomatic Engineering With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geomatics Engineering',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geomatics Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geotechnical',
  'Master',
  'Turkish',
  5200,
  1,
  now(),
  true,
  NULL,
  5200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geotechnical'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geotechnical Engineering',
  'Master',
  'Turkish',
  6240,
  4,
  now(),
  true,
  NULL,
  6240,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geotechnical Engineering'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6240
      AND COALESCE(p.cost, -1) = 6240
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Guidance And Psychological Counseling With',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Guidance And Psychological Counseling With'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Rights With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Rights With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial And Organizational Psychology With',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial And Organizational Psychology With'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Innovation Management With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Innovation Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Desigr'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture With Thesis',
  'Master',
  'Turkish',
  6240,
  2,
  now(),
  true,
  NULL,
  6240,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6240
      AND COALESCE(p.cost, -1) = 6240
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Economics And Finance',
  'Master',
  'English',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Economics And Finance'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Economics And Finance With The',
  'Master',
  'English',
  6240,
  4,
  now(),
  true,
  NULL,
  6240,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Economics And Finance With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6240
      AND COALESCE(p.cost, -1) = 6240
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Master',
  'English',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations With Thesis',
  'Master',
  'English',
  6240,
  4,
  now(),
  true,
  NULL,
  6240,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Relations With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 6240
      AND COALESCE(p.cost, -1) = 6240
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics de',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics de'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Economics',
  'Master',
  'Turkish',
  4550,
  1,
  now(),
  true,
  NULL,
  4550,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Economics'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Economics With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Economics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics And Computer Science With The',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics And Computer Science With The'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Monetary and Capital Markets',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Monetary and Capital Markets'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Monetary and Capital Markets With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Monetary and Capital Markets With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physics With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physics With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pre-School Education',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pre-School Education'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'Master',
  'Turkish',
  6875,
  4,
  now(),
  true,
  NULL,
  6875,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6875
      AND COALESCE(p.cost, -1) = 6875
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law With Thesis',
  'Master',
  'Turkish',
  7500,
  4,
  now(),
  true,
  NULL,
  7500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7500
      AND COALESCE(p.cost, -1) = 7500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Production Economics',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Production Economics'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Project Management',
  'Master',
  'Turkish',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Project Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Project Management With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Project Management With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law',
  'Master',
  'Turkish',
  6875,
  4,
  now(),
  true,
  NULL,
  6875,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6875
      AND COALESCE(p.cost, -1) = 6875
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law With Thesis',
  'Master',
  'Turkish',
  7500,
  2,
  now(),
  true,
  NULL,
  7500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Law With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7500
      AND COALESCE(p.cost, -1) = 7500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Quality and Production Management',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Quality and Production Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Quality and Production Management With The:',
  'Master',
  'Turkish',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Quality and Production Management With The:'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Cinema With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Cinema With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Real Estate Development And Management',
  'Master',
  'Turkish',
  5000,
  1,
  now(),
  true,
  NULL,
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Real Estate Development And Management'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sport Law',
  'Master',
  'Turkish',
  4550,
  4,
  now(),
  true,
  NULL,
  4550,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sport Law'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Structure',
  'Master',
  'English',
  4680,
  4,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Structure'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Structure',
  'Master',
  'Turkish',
  4680,
  1,
  now(),
  true,
  NULL,
  4680,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Structure'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4680
      AND COALESCE(p.cost, -1) = 4680
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Structure With Thesis',
  'Master',
  'English',
  5200,
  2,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Structure With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Structure With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Structure With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Language And Literature With Thesis',
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
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Turkish Language And Literature With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urban Design With Thesis',
  'Master',
  'Turkish',
  4550,
  2,
  now(),
  true,
  NULL,
  4550,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Urban Design With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4550
      AND COALESCE(p.cost, -1) = 4550
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urbanization With Thesis',
  'Master',
  'Turkish',
  5200,
  4,
  now(),
  true,
  NULL,
  5200,
  201,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Urbanization With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5200
      AND COALESCE(p.cost, -1) = 5200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'dog bi go la',
  'Master',
  'Turkish',
  6500,
  4,
  now(),
  true,
  NULL,
  6500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'dog bi go la'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 6500
      AND COALESCE(p.cost, -1) = 6500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geomatics Engineering',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geomatics Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Geotechnical',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Geotechnical'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'PhD',
  'English',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mathematics',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Mathematics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Molecular Biology And Genetics'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Private Law',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Private Law'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Project Management',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Project Management'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Structure',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Structure'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Language And Literature',
  'PhD',
  'English',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Turkish Language And Literature'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'ple agili',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  NULL,
  9000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) IN (lower(trim('İstanbul Kültür University')), lower(trim('Kültür University')))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'ple agili'
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 7800
  );

