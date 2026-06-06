-- Kent University and Lokman Hekim University programs from agentportal screenshots (2026-05-17).
-- Idempotent: skips when name + degree + language already exist for the university.


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Business Administration',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Child Development',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Computer Engineering',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  'Turkish',
  35000,
  5,
  now(),
  true,
  'Dentistry',
  35000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  2900,
  4,
  now(),
  true,
  'Digital Game Design',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Digital Game Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics And Finance',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'Economics And Finance',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Economics And Finance'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Healthcare Management',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Healthcare Management',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Healthcare Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Industrial Engineering',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Interior Architecture',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Interior Architecture'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Relations',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'International Relations',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Relations'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'International Trade And Logistics',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Logistics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'International Trade And Logistics',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Logistics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Jlachl 8,13!',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'Jlachl 8,13!',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Jlachl 8,13!'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Midwifery',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'Nursing',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  2200,
  4,
  now(),
  true,
  'Nursing',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  18000,
  5,
  now(),
  true,
  'Pharmacy',
  18000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  18000,
  4,
  now(),
  true,
  'Pharmacy',
  18000,
  2021,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'Political Science And Public Administration',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Political Science And Public Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Political Science And Public Administration',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Political Science And Public Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  2900,
  4,
  now(),
  true,
  'Psychology',
  5800,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  2200,
  4,
  now(),
  true,
  'Psychology',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  2200,
  4,
  now(),
  true,
  'Public Relations And Advertising',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Advertising'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Radio Television And Film',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Radio Television And Film'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urban Design And Landscape Architecture',
  'Bachelor',
  'Turkish',
  2200,
  4,
  now(),
  true,
  'Urban Design And Landscape Architecture',
  4400,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Urban Design And Landscape Architecture'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Anesthesia',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anesthesia'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Child Development',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Computer Programming',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Programming'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cosmetic lechnolody',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Cosmetic lechnolody',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cosmetic lechnolody'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Court And Office Management',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Court And Office Management',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Court And Office Management'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Dental Prosthesis',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dental Prosthesis'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Health Services Technician',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Digital Health Services Technician',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Digital Health Services Technician'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'E-Commerce And Marketing',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'E-Commerce And Marketing',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('E-Commerce And Marketing'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elderly Care',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Elderly Care',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Elderly Care'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'First And Emergency Aid',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('First And Emergency Aid'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Data Processing Technician',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Medical Data Processing Technician',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Data Processing Technician'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretarial',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Medical Documentation And Secretarial',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Documentation And Secretarial'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Medical Imaging Techniques',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Imaging Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Medical Laboratory Techniques',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Oral And Dental Health',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Dental Health'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pathology Laboratory Techniques',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Pathology Laboratory Techniques',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pathology Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy Services',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Pharmacy Services',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  1300,
  2,
  now(),
  true,
  'Physiotherapy',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Telehealth Technician',
  'Diploma',
  'Turkish',
  1300,
  2,
  now(),
  true,
  'Telehealth Technician',
  3200,
  1200,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Telehealth Technician'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Management With Thesis',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Business Management With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development With Thesis',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Child Development With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'Master',
  'Turkish',
  15000,
  1,
  now(),
  true,
  'Clinical Psychology',
  20000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
  'Turkish',
  15000,
  2,
  now(),
  true,
  'Clinical Psychology With Thesis',
  20000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts With Thesis',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Gastronomy And Culinary Arts With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Healthcare Management',
  'Master',
  'Turkish',
  2500,
  1,
  now(),
  true,
  'Healthcare Management',
  5000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Healthcare Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Healthcare Management With Thesis',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Healthcare Management With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Healthcare Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Business Administration',
  'Master',
  'Turkish',
  2500,
  1,
  now(),
  true,
  'International Business Administration',
  5000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Business Administration'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Business',
  'Master',
  'English',
  2500,
  1,
  now(),
  true,
  'International Trade And Business',
  5000,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Business'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Logistics With Thesis',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'International Trade And Logistics With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Logistics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Media And Cultural Studies With Thesis',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Media And Cultural Studies With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Media And Cultural Studies With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Master',
  'Turkish',
  2500,
  1,
  now(),
  true,
  'Nutrition And Dietetics',
  5000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
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
  3500,
  2,
  now(),
  true,
  'Nutrition And Dietetics With Thesis',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Master',
  'Turkish',
  2500,
  1,
  now(),
  true,
  'Occupational Health And Safety',
  5000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Health And Safety'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacology',
  'Master',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Pharmacology',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Master',
  'English',
  2500,
  1,
  now(),
  true,
  'Political Science And International Relations',
  5000,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Political Science And International Relations'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations W',
  'Master',
  'English',
  3500,
  2,
  now(),
  true,
  'Political Science And International Relations W',
  7000,
  2900,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Political Science And International Relations W'))
      AND COALESCE(p.degree, '') = 'Master'
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
  'Business Administration',
  7000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'PhD',
  'Turkish',
  4000,
  4,
  now(),
  true,
  'Gastronomy And Culinary Arts',
  6000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gastronomy And Culinary Arts'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral, Dental And Maxillofacial Surgery',
  'PhD',
  'Turkish',
  29750,
  4,
  now(),
  true,
  'Oral, Dental And Maxillofacial Surgery',
  35000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral, Dental And Maxillofacial Surgery'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics',
  'PhD',
  'Turkish',
  20000,
  4,
  now(),
  true,
  'Orthodontics',
  25000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthodontics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Restorative Dentistry',
  'PhD',
  'Turkish',
  20000,
  4,
  now(),
  true,
  'Restorative Dentistry',
  25000,
  1080,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Restorative Dentistry'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  'Audiology',
  4000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Audiology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  18000,
  2,
  now(),
  true,
  'Dentistry',
  20000,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
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
  20000,
  5,
  now(),
  true,
  'Dentistry',
  18000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Language And Speech Therapy',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  'Language And Speech Therapy',
  4000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Language And Speech Therapy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'Midwifery',
  4000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'Nursing',
  4000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'Nutrition And Dietetics',
  4500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Therapy',
  'Bachelor',
  'Turkish',
  4000,
  4,
  now(),
  true,
  'Occupational Therapy',
  4000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Occupational Therapy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  13500,
  4,
  now(),
  true,
  'Pharmacy',
  13500,
  8000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
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
  13500,
  2,
  now(),
  true,
  'Pharmacy',
  13500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
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
  'Turkish',
  4500,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  4500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'Sports Management',
  4000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sports Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Anesthesia',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anesthesia'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Dental Prosthesis',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dental Prosthesis'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Dialysis',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dialysis'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Elderly Care',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Elderly Care',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Elderly Care'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'First And Emergency Aid',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('First And Emergency Aid'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Data Processing Technician',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Medical Data Processing Technician',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Data Processing Technician'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Medical Imaging Techniques',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Imaging Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Medical Laboratory Techniques',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Laboratory Techniques'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Operating Room Services',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Operating Room Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Opticianry',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Opticianry'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Oral And Dental Health',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
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
  3500,
  2,
  now(),
  true,
  'Pharmacy Services',
  3500,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy Services'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology With Thesis',
  'Master',
  'Turkish',
  7000,
  2,
  now(),
  true,
  'Audiology With Thesis',
  7000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Audiology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management With Thesis',
  'Master',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Health Management With Thesis',
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Microbiology With Thesis',
  'Master',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Medical Microbiology With Thesis',
  5000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medical Microbiology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Midwifery With Thesis',
  'Master',
  'Turkish',
  5000,
  2,
  now(),
  true,
  'Midwifery With Thesis',
  5000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Midwifery With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmaceutical Toxicology',
  'Master',
  'Turkish',
  6000,
  1,
  now(),
  true,
  'Pharmaceutical Toxicology',
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmaceutical Toxicology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  8000,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation With Thesis',
  8000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Health Nursing With Thesis',
  'Master',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Public Health Nursing With Thesis',
  6000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Health Nursing With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
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
  'Prosthetic Dentistry',
  12000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthetic Dentistry'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'Restorative Dentistry',
  12000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Lokman Hekim University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Restorative Dentistry'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );
