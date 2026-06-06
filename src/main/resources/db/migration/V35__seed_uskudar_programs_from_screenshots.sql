-- Seed Üsküdar University programs from agentportal screenshots (2026-05-17).
-- Idempotent: skips rows that already exist with same name, degree, language, and pricing.

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Advertising',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Advertising'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Audiology',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Audiology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Bioengineering',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  'Bioengineering',
  5000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Bioengineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Child Development',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  5600,
  4,
  now(),
  true,
  'Computer Engineering',
  5600,
  5000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5600
      AND COALESCE(p.cost, -1) = 5600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  22000,
  4,
  now(),
  true,
  'Dentistry',
  22000,
  4400,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 22000
      AND COALESCE(p.cost, -1) = 22000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'Turkish',
  16000,
  4,
  now(),
  true,
  'Dentistry',
  16000,
  14400,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 16000
      AND COALESCE(p.cost, -1) = 16000
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
  'Electrical And Electronic Engineering',
  5000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Translation And Interpretation',
  'Bachelor',
  'English',
  4400,
  4,
  now(),
  true,
  'English Translation And Interpretation',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Translation And Interpretation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Health Management',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'History',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'History',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('History'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Journalism',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Journalism',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Journalism'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'Turkish',
  18000,
  4,
  now(),
  true,
  'Medicine',
  18000,
  16200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicine'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 18000
      AND COALESCE(p.cost, -1) = 18000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Midwifery',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  'Molecular Biology And Genetics',
  5000,
  4500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology And Genetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5000
      AND COALESCE(p.cost, -1) = 5000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Molecular Biology And Genetics',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology And Genetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'English',
  4400,
  4,
  now(),
  true,
  'New Media And Communication',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('New Media And Communication'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Nursing',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Occupational Health And Safety',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Therapy',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Occupational Therapy',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Therapy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Perfusion',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Perfusion',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Perfusion'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Philosophy',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Philosophy',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Philosophy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  5600,
  4,
  now(),
  true,
  'Psychology',
  5600,
  5000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5600
      AND COALESCE(p.cost, -1) = 5600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Psychology',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Publicity',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Public Relations And Publicity',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Publicity'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Radio Television And Film',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Radio Television And Film'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Work',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Social Work',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Social Work'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sociology',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Sociology',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sociology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  5600,
  4,
  now(),
  true,
  'Software Engineering',
  5600,
  5000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Software Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5600
      AND COALESCE(p.cost, -1) = 5600
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Speech And Language Therapy',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Speech And Language Therapy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'Bachelor',
  'Turkish',
  4200,
  4,
  now(),
  true,
  'Visual Communication Design',
  4200,
  3800,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Visual Communication Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4200
      AND COALESCE(p.cost, -1) = 4200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Anesthesia',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anesthesia'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Autopsy Assistantship',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Autopsy Assistantship',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Autopsy Assistantship'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biomedical Device Technologies',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Biomedical Device Technologies',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Biomedical Device Technologies'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Care And Rehabilitation Of People With Disabil',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Care And Rehabilitation Of People With Disabil',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Care And Rehabilitation Of People With Disabil'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development (Evening Class)',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Child Development (Evening Class)',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Protective And Nursing Services',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Child Protective And Nursing Services',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Protective And Nursing Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Dental Prosthesis',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dental Prosthesis'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Dialysis',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dialysis'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elderly care se mees',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Elderly care se mees',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Elderly care se mees'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electro Neurophysiology',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Electro Neurophysiology',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electro Neurophysiology'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Emergency And Disaster Management',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Emergency And Disaster Management',
  2800,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Emergency And Disaster Management'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Environmental Health',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Environmental Health',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Environmental Health'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'First And Emergency Aid',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('First And Emergency Aid'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Food Technologies',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Food Technologies',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Food Technologies'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Institutions Management',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Health Institutions Management',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Institutions Management'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Home-Care Service',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Home-Care Service',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Home-Care Service'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Laboratory Techniques',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Laboratory Techniques',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretarial',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Medical Documentation And Secretarial',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Documentation And Secretarial'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Medical Imaging Techniques',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Imaging Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Medical Laboratory Techniques',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicinal And Aromatic Plants',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Medicinal And Aromatic Plants',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicinal And Aromatic Plants'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nuclear Technology And Radiation Safety',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Nuclear Technology And Radiation Safety',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nuclear Technology And Radiation Safety'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Occupational Health And Safety',
  2800,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Operating Room Services',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Operating Room Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Opticianry',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Opticianry'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthopedic Prosthesis And Orhotics',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Orthopedic Prosthesis And Orhotics',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthopedic Prosthesis And Orhotics'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pathology Laboratory Techniques',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Pathology Laboratory Techniques',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pathology Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Physiotherapy',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Podology',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Podology',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Podology'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Safety',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Social Safety',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Social Safety'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Work',
  'Diploma',
  'Turkish',
  2800,
  2,
  now(),
  true,
  'Social Work',
  2800,
  2660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Social Work'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 2800
      AND COALESCE(p.cost, -1) = 2800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Addiction Counseling And Rehabilitation',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Addiction Counseling And Rehabilitation',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Addiction Counseling And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Psychology With Thesis',
  'Master',
  'Turkish',
  7300,
  4,
  now(),
  true,
  'Applied Psychology With Thesis',
  7300,
  6570,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Applied Psychology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7300
      AND COALESCE(p.cost, -1) = 7300
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artifical Intelligence Engineering',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Artifical Intelligence Engineering',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Artifical Intelligence Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Engineering With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Artificial Intelligence Engineering With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Artificial Intelligence Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Bioengineering',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Bioengineering',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Bioengineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Bioengineering With Thesis',
  'Master',
  'English',
  4800,
  4,
  now(),
  true,
  'Bioengineering With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Bioengineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Bioengineering With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Bioengineering With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Bioengineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Bioinformatics With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Bioinformatics With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Bioinformatics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biotechnology',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Biotechnology',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Biotechnology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biotechnology With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Biotechnology With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Biotechnology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemical Engineering',
  'Master',
  'English',
  4400,
  4,
  now(),
  true,
  'Chemical Engineering',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chemical Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemical Engineering With Thesis',
  'Master',
  'English',
  4800,
  4,
  now(),
  true,
  'Chemical Engineering With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chemical Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Master',
  'Turkish',
  3960,
  4,
  now(),
  true,
  'Child Development',
  4400,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 3960
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'Master',
  'Turkish',
  15200,
  4,
  now(),
  true,
  'Clinical Psychology',
  15200,
  13680,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 15200
      AND COALESCE(p.cost, -1) = 15200
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
  'Turkish',
  17400,
  4,
  now(),
  true,
  'Clinical Psychology With Thesis',
  17400,
  15660,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 17400
      AND COALESCE(p.cost, -1) = 17400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Master',
  'English',
  5100,
  4,
  now(),
  true,
  'Computer Engineering',
  5100,
  4590,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5100
      AND COALESCE(p.cost, -1) = 5100
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Computer Engineering',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'English',
  5700,
  2,
  now(),
  true,
  'Computer Engineering With Thesis',
  5700,
  5130,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5700
      AND COALESCE(p.cost, -1) = 5700
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Computer Engineering With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Criminal Justice',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Criminal Justice',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Criminal Justice'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Secunty With Thesis',
  'Master',
  'English',
  5700,
  4,
  now(),
  true,
  'Cyber Secunty With Thesis',
  5700,
  5130,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cyber Secunty With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5700
      AND COALESCE(p.cost, -1) = 5700
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Security',
  'Master',
  'English',
  4400,
  4,
  now(),
  true,
  'Cyber Security',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cyber Security'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Security',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Cyber Security',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cyber Security'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Security With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Cyber Security With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cyber Security With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Master',
  'English',
  5100,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  5100,
  4590,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5100
      AND COALESCE(p.cost, -1) = 5100
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering With The',
  'Master',
  'English',
  5700,
  2,
  now(),
  true,
  'Electrical And Electronic Engineering With The',
  5700,
  5130,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering With The'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 5700
      AND COALESCE(p.cost, -1) = 5700
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management',
  'Master',
  'English',
  4400,
  4,
  now(),
  true,
  'Engineering Management',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Engineering Management',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'English',
  4800,
  2,
  now(),
  true,
  'Engineering Management With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Family Counseling',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Family Counseling',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Family Counseling'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Family Counseling With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Family Counseling With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Family Counseling With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Forensic Chemistry and Forensic Toxicology',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Forensic Chemistry and Forensic Toxicology',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Forensic Chemistry and Forensic Toxicology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Forensic Chemistry and Forensic Toxicology W',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Forensic Chemistry and Forensic Toxicology W',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Forensic Chemistry and Forensic Toxicology W'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Forensic Science',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Forensic Science',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Forensic Science'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Forensic Sciences With Thesis',
  'Master',
  'Turkish',
  5100,
  2,
  now(),
  true,
  'Forensic Sciences With Thesis',
  5100,
  4590,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Forensic Sciences With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 5100
      AND COALESCE(p.cost, -1) = 5100
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Informatics',
  'Master',
  'Turkish',
  4400,
  1,
  now(),
  true,
  'Health Informatics',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Informatics'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Informatics With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Health Informatics With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Informatics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Health Management With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Mangement',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Health Mangement',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Mangement'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'International Relations',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Relations'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'International Relations With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Relations With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Media And Cultural Studies',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Media And Cultural Studies',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Media And Cultural Studies'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Media And Cultural Studies With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Media And Cultural Studies With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Media And Cultural Studies With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Master',
  'Turkish',
  4400,
  1,
  now(),
  true,
  'Midwifery',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Midwifery With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology',
  'Master',
  'English',
  4400,
  4,
  now(),
  true,
  'Molecular Biology',
  4400,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Molecular Biology',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Molecular Biology With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuromarketing',
  'Master',
  'Turkish',
  4400,
  1,
  now(),
  true,
  'Neuromarketing',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuromarketing'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuromarketing With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Neuromarketing With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuromarketing With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience',
  'Master',
  'English',
  4400,
  4,
  now(),
  true,
  'Neuroscience',
  4400,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuroscience'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Neuroscience',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuroscience'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Journalism',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'New Media And Journalism',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('New Media And Journalism'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Journalism With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'New Media And Journalism With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('New Media And Journalism With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Nursing With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Nutrition And Dietetics With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Occupational Health And Safety',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Occupational Health And Safety With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Therapy',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Occupational Therapy',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Therapy'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Therapy With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Occupational Therapy With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Therapy With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Perfusion',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Perfusion',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Perfusion'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Perfusion With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Perfusion With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Perfusion With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Philosophy',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Philosophy',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Philosophy'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Philosophy With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Philosophy With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Philosophy With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Public Relations And Advertising',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Advertising'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising With Thesis',
  'Master',
  'Turkish',
  4800,
  2,
  now(),
  true,
  'Public Relations And Advertising With Thesis',
  4800,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Advertising With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Work',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Social Work',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Social Work'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Work With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Social Work With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Social Work With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sociology',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Sociology',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sociology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sociology With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Sociology With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sociology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Speech And Language Therapy',
  4400,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Speech And Language Therapy'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sufi Culture And Literature',
  'Master',
  'Turkish',
  7500,
  4,
  now(),
  true,
  'Sufi Culture And Literature',
  7500,
  6750,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sufi Culture And Literature'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7500
      AND COALESCE(p.cost, -1) = 7500
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sufi Culture And Literature With Thesis',
  'Master',
  'Turkish',
  9150,
  2,
  now(),
  true,
  'Sufi Culture And Literature With Thesis',
  9150,
  8235,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sufi Culture And Literature With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9150
      AND COALESCE(p.cost, -1) = 9150
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'Master',
  'Turkish',
  4400,
  4,
  now(),
  true,
  'Visual Communication Design',
  4400,
  3960,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Visual Communication Design'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4400
      AND COALESCE(p.cost, -1) = 4400
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design With Thesis',
  'Master',
  'Turkish',
  4800,
  4,
  now(),
  true,
  'Visual Communication Design With Thesis',
  4800,
  4320,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Visual Communication Design With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 4800
      AND COALESCE(p.cost, -1) = 4800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Forensic Science',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  'Forensic Science',
  7800,
  7020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Forensic Science'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'PhD',
  'Turkish',
  7800,
  4,
  now(),
  true,
  'Health Management',
  7800,
  7020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
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
  'International Relations',
  7800,
  7020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Relations'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
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
  'Medical Genetics',
  9000,
  8100,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Genetics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 9000
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
  'New Media And Communication',
  7800,
  7020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('New Media And Communication'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
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
  'Nursing',
  9000,
  8100,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 9000
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
  'Occupational Health And Safety',
  7800,
  7020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
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
  'Physiology',
  9000,
  8100,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 9000
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
  'Psychology',
  19100,
  17190,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 19100
      AND COALESCE(p.cost, -1) = 19100
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
  'Speech And Language Therapy',
  9000,
  8100,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Speech And Language Therapy'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 9000
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'The Though, History, And Literature Of Islamic',
  'PhD',
  'Turkish',
  13300,
  4,
  now(),
  true,
  'The Though, History, And Literature Of Islamic',
  13300,
  11970,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('The Though, History, And Literature Of Islamic'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 13300
      AND COALESCE(p.cost, -1) = 13300
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
  'Visual Communication Design',
  7800,
  7020,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Visual Communication Design'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 7800
      AND COALESCE(p.cost, -1) = 7800
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Whacill ple',
  'PhD',
  'Turkish',
  9000,
  4,
  now(),
  true,
  'Whacill ple',
  9000,
  8100,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Whacill ple'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
      AND COALESCE(p.before_discount, -1) = 9000
      AND COALESCE(p.cost, -1) = 9000
  );
