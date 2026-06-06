-- İstinye University programs from agentportal screenshots (2026-05-17).
-- Idempotent inserts; updates availability for quota-full programs already in DB.


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Architecture',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architecture'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'Turkish',
  2026,
  4,
  now(),
  true,
  'Architecture',
  2026,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architecture'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Audiology',
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Audiology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biomedical Engineering',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Biomedical Engineering',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Biomedical Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Business Administration',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Child Development',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema And Television',
  'Bachelor',
  'Turkish',
  2700,
  4,
  now(),
  true,
  'Cinema And Television',
  3600,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cinema And Television'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'English',
  2700,
  4,
  now(),
  true,
  'Civil Engineering',
  4800,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Civil Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Computer Engineering',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Computer Engineering',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  500,
  5,
  now(),
  false,
  'Dentistry',
  24500,
  23275,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'Turkish',
  24000,
  5,
  now(),
  true,
  'Dentistry',
  24000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Game Design',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Digital Game Design',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Digital Game Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Economics',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Economics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language And Literature',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'English Language And Literature',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Language And Literature'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Health Management',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Design',
  'Bachelor',
  'Turkish',
  2700,
  4,
  now(),
  true,
  'Industrial Design',
  3600,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Industrial Engineering',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desig',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Interior Architecture And Environmental Desig',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Interior Architecture And Environmental Desig'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'English',
  2700,
  4,
  now(),
  true,
  'Interior Architecture And Environmental Desigr',
  3600,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Interior Architecture And Environmental Desigr'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'International Relations',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Relations'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Business',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'International Trade And Business',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Business'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Bachelor',
  'English',
  2700,
  4,
  now(),
  true,
  'International Trade And Finance',
  3600,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Finance'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Logistics Management',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Logistics Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Management Information Systems',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Management Information Systems'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Management Information Systems',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Management Information Systems'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Mechanical Engineering',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Mechanical Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'English',
  2700,
  4,
  now(),
  true,
  'Mechatronics Engineering',
  4800,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Mechatronics Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'English',
  29000,
  6,
  now(),
  true,
  'Medicine',
  29000,
  27550,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicine'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'Turkish',
  25000,
  6,
  now(),
  false,
  'Medicine',
  25000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicine'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Midwifery',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Molecular Biology And Genetics',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology And Genetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'English',
  7000,
  4,
  now(),
  true,
  'New Media And Communication',
  7000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('New Media And Communication'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Nursing',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  6000,
  4,
  now(),
  false,
  'Nursing',
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutnition And Dietetics',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Nutnition And Dietetics',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutnition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  9000,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  9000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  15000,
  4,
  now(),
  true,
  'Pharmacy',
  15000,
  14250,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'Turkish',
  14500,
  4,
  now(),
  false,
  'Pharmacy',
  14500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  false,
  'Physiotherapy And Rehabilitation',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  10000,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  10000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Psychology',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Psychology',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'Turkish',
  7000,
  4,
  now(),
  true,
  'Public Relations And Advertising',
  7000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Advertising'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Development',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Software Development',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Software Development'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  8000,
  4,
  now(),
  true,
  'Software Engineering',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Software Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Software Engineering',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Software Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Speech And Language Therapy',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Speech And Language Therapy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Language And Literaturee',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Turkish Language And Literaturee',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Turkish Language And Literaturee'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'Bachelor',
  'Turkish',
  7000,
  4,
  now(),
  true,
  'Visual Communication Design',
  7000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Visual Communication Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Business Administration',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemistry',
  'CombinedPhD',
  'English',
  15000,
  5,
  now(),
  true,
  'Chemistry',
  15000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chemistry'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communications Sciences',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Communications Sciences',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Communications Sciences'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Health Management',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Histology And Embryology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Histology And Embryology',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Histology And Embryology'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Biology And Genetics',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Medical Biology And Genetics',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Biology And Genetics'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Midwifery',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Oncology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Molecular Oncology',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Oncology'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Neuroscience',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuroscience'))
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
  'Nutrition And Dietetics',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecology',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Obstetrics And Gynecology',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Obstetrics And Gynecology'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physics',
  'CombinedPhD',
  'English',
  15000,
  5,
  now(),
  true,
  'Physics',
  15000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physics'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'English'
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
  'Physiotherapy And Rehabilitation',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Stem Cell And Tissue Engineering',
  'CombinedPhD',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'Stem Cell And Tissue Engineering',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Stem Cell And Tissue Engineering'))
      AND COALESCE(p.degree, '') = 'CombinedPhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aircraft Technology',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Aircraft Technology',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Aircraft Technology'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Anesthesia',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anesthesia'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia (Evening Class)',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Anesthesia (Evening Class)',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anesthesia (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Automotive Technology',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Automotive Technology',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Automotive Technology'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development ( Evening Class)',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Child Development ( Evening Class)',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development ( Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Civil Aviation Cabin Services',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Civil Aviation Cabin Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Aided Design And Animation',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Computer Aided Design And Animation',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Aided Design And Animation'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Computer Programming',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Programming'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming (Evening Class)',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Computer Programming (Evening Class)',
  1400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Programming (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Technologies',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Computer Technologies',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Technologies'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cooking',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Cooking',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cooking'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Dialysis',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dialysis'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'E-Trade And Marketing',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'E-Trade And Marketing',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('E-Trade And Marketing'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electro Neurophysiology',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Electro Neurophysiology',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electro Neurophysiology'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'First And Emergency Aid',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('First And Emergency Aid'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Help (Evening Class)',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'First And Emergency Help (Evening Class)',
  1400,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('First And Emergency Help (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Food Technologies',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Food Technologies',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Food Technologies'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Foreign Trade',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Foreign Trade',
  1400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Foreign Trade'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Graphic Design',
  1400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Graphic Design'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Graphic Design ( Evening Class)',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Graphic Design ( Evening Class)',
  1400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Graphic Design ( Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Services',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  false,
  'Health Services',
  3500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Security Technologies',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Information Security Technologies',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Information Security Technologies'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretariat ( Even',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Medical Documentation And Secretariat ( Even',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Documentation And Secretariat ( Even'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Medical Imaging Techniques',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Imaging Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques (Evening Class)',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Medical Imaging Techniques (Evening Class)',
  1400,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Imaging Techniques (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Medical Laboratory Techniques',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques ( Evening Class',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Medical Laboratory Techniques ( Evening Class',
  1400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Laboratory Techniques ( Evening Class'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Operating Room Services',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Operating Room Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services evening class',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Operating Room Services evening class',
  1400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Operating Room Services evening class'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operation Room Services (Evening Class)',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Operation Room Services (Evening Class)',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Operation Room Services (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Opticianry',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Opticianry'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry (Evening Class)',
  'Diploma',
  'Turkish',
  1400,
  2,
  now(),
  true,
  'Opticianry (Evening Class)',
  1400,
  202,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Opticianry (Evening Class)'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Oral And Dental Health',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Dental Health'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy Services',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Pharmacy Services',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Physiotherapy',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radiotherapy',
  'Diploma',
  'Turkish',
  5000,
  2,
  now(),
  false,
  'Radiotherapy',
  5000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Radiotherapy'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anatomy With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Anatomy With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anatomy With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied Economics',
  'Master',
  'English',
  3500,
  1,
  now(),
  true,
  'Applied Economics',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Applied Economics'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Design With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Architectural Design With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architectural Design With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Design With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Architectural Design With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architectural Design With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Engineering With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Artificial Intelligence Engineering With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Artificial Intelligence Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'English',
  8000,
  1,
  now(),
  true,
  'Business Administration',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Business Administration',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Business Administration With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Business Administration With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema And Television With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Cinema And Television With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cinema And Television With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Master',
  'English',
  3500,
  1,
  now(),
  true,
  'Civil Engineering',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Civil Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'Master',
  'Turkish',
  15000,
  2,
  now(),
  true,
  'Clinical Psychology',
  15000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Master',
  'English',
  8000,
  1,
  now(),
  true,
  'Computer Engineering',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Computer Engineering With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Security',
  'Master',
  'English',
  8000,
  1,
  now(),
  true,
  'Cyber Security',
  8000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cyber Security'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Data Science',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Data Science'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Data Science With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Data Science With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Data Science With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Data Science With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Data Science With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering With The',
  'Master',
  'English',
  8500,
  1,
  now(),
  true,
  'Electrical And Electronic Engineering With The',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering With The'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering With The',
  'Master',
  'Turkish',
  8500,
  1,
  now(),
  true,
  'Electrical And Electronic Engineering With The',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering With The'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electronics Engineering With Thesis',
  'Master',
  'English',
  4000,
  2,
  now(),
  true,
  'Electronics Engineering With Thesis',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electronics Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Engineering Management With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Engineering Management With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Executive Business Administration With Thesis',
  'Master',
  'English',
  4000,
  2,
  now(),
  true,
  'Executive Business Administration With Thesis',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Executive Business Administration With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Fashion And Textile Design',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Fashion And Textile Design'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Fashion And Textile Design With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Fashion And Textile Design With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Master',
  'Turkish',
  8000,
  2,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Gastronomy And Culinary Arts With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Health Management With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Mangement',
  'Master',
  'Turkish',
  8000,
  2,
  now(),
  true,
  'Health Mangement',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Mangement'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Master',
  'English',
  3500,
  1,
  now(),
  true,
  'Industrial Engineering',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering With Thesis',
  'Master',
  'English',
  4000,
  2,
  now(),
  true,
  'Industrial Engineering With Thesis',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technologies With Thesis',
  'Master',
  'English',
  4000,
  2,
  now(),
  true,
  'Information Technologies With Thesis',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Information Technologies With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Interior Architecture With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Interior Architecture With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Management Information Systems With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Management Information Systems With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Master',
  'English',
  3500,
  1,
  now(),
  true,
  'Mechanical Engineering',
  5100,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Mechanical Engineering'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering With Thesis',
  'Master',
  'English',
  4000,
  2,
  now(),
  true,
  'Mechanical Engineering With Thesis',
  5100,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Mechanical Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Biology And Genetics With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Medical Biology And Genetics With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Biology And Genetics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Molecular Biology And Genetics With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology And Genetics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Neuroscience With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuroscience With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Nutrition And Dietetics',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Nutrition And Dietetics With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecologic Nursing',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Obstetrics And Gynecologic Nursing',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Obstetrics And Gynecologic Nursing'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecologic Nursing With The:',
  'Master',
  'Turkish',
  8500,
  1,
  now(),
  true,
  'Obstetrics And Gynecologic Nursing With The:',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Obstetrics And Gynecologic Nursing With The:'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Occupational Health And Safety',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacology And Cancer Biology With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Pharmacology And Cancer Biology With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacology And Cancer Biology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'English',
  8500,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation With Thesis',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Master',
  'English',
  8500,
  1,
  now(),
  true,
  'Political Science And International Relations',
  8500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Political Science And International Relations'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Political Science And International Relations',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Political Science And International Relations'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Psychology',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Psychology With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Speech And Language Therapy With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Speech And Language Therapy With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Physiotherapy With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Sports Physiotherapy With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sports Physiotherapy With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Stem Cell And Tissue Engineering With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Stem Cell And Tissue Engineering With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Stem Cell And Tissue Engineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Surgical Nursing',
  'Master',
  'Turkish',
  8000,
  1,
  now(),
  true,
  'Surgical Nursing',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Surgical Nursing'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Surgical Nursing With Thesis',
  'Master',
  'Turkish',
  8500,
  2,
  now(),
  true,
  'Surgical Nursing With Thesis',
  8500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Surgical Nursing With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'mooled Economies with nests',
  'Master',
  'English',
  4000,
  2,
  now(),
  true,
  'mooled Economies with nests',
  5100,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('mooled Economies with nests'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Architecture',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architecture'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Business Administration',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemistry',
  'PhD',
  'English',
  12500,
  4,
  now(),
  true,
  'Chemistry',
  12500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chemistry'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Anatomy',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Clinical Anatomy',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Anatomy'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Communications Sciences',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Communications Sciences',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Communications Sciences'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Health Management',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Histology And Embryology',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Histology And Embryology',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Histology And Embryology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Biology And Genetics',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Medical Biology And Genetics',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Biology And Genetics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Midwifery',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Oncology',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Molecular Oncology',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Oncology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Neuroscience',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Neuroscience',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Neuroscience'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Obstetrics And Gynecology',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Obstetrics And Gynecology',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Obstetrics And Gynecology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacutical Chemistry',
  'PhD',
  'English',
  12500,
  4,
  now(),
  true,
  'Pharmacutical Chemistry',
  12500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacutical Chemistry'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physics',
  'PhD',
  'English',
  12500,
  4,
  now(),
  true,
  'Physics',
  12500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Stem Cell And Tissue Engineering',
  'PhD',
  'Turkish',
  12500,
  4,
  now(),
  false,
  'Stem Cell And Tissue Engineering',
  12500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Stem Cell And Tissue Engineering'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


-- Mark quota-full programs (including rows seeded in earlier migrations).

UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Dentistry'))
  AND COALESCE(p.degree, '') = 'Bachelor'
  AND COALESCE(p.language, '') = 'English';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Medicine'))
  AND COALESCE(p.degree, '') = 'Bachelor'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Nursing'))
  AND COALESCE(p.degree, '') = 'Bachelor'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Pharmacy'))
  AND COALESCE(p.degree, '') = 'Bachelor'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
  AND COALESCE(p.degree, '') = 'Bachelor'
  AND COALESCE(p.language, '') = 'English';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Anesthesia'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Automotive Technology'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Child Development ( Evening Class)'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Computer Aided Design And Animation'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Computer Programming'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Dialysis'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Electro Neurophysiology'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Health Services'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Medical Documentation And Secretariat ( Even'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Medical Imaging Techniques'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Operating Room Services'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Physiotherapy'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Radiotherapy'))
  AND COALESCE(p.degree, '') = 'Diploma'
  AND COALESCE(p.language, '') = 'Turkish';


UPDATE program p
SET available = false, updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('İstinye University'))
  AND lower(trim(p.name)) = lower(trim('Stem Cell And Tissue Engineering'))
  AND COALESCE(p.degree, '') = 'PhD'
  AND COALESCE(p.language, '') = 'Turkish';
