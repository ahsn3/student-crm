-- Bahçeşehir, KSTU, and Istanbul Health programs from agentportal screenshots (2026-05-17).
-- Idempotent: skips when name + degree + language already exist for the university.

INSERT INTO university (id, name, country, website, currency, programs_count, campuses_count, logo_url, created_at)
SELECT gen_random_uuid(), 'Istanbul Health and Technology University', 'Turkey',
  'https://www.istun.edu.tr/', 'USD', 26, 1,
  'https://www.google.com/s2/favicons?domain=istun.edu.tr&sz=128', now()
WHERE NOT EXISTS (
  SELECT 1 FROM university u WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
);


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'Advertising',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Advertising'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Architecture',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architecture'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Engineering',
  'Bachelor',
  'English',
  12000,
  4,
  now(),
  true,
  'Artificial Intelligence Engineering',
  12000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Artificial Intelligence Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'Bachelor',
  'Turkish',
  6375,
  4,
  now(),
  true,
  'Audiology',
  6375,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Audiology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Business Administration',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cartoon And Animation',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'Cartoon And Animation',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cartoon And Animation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema And Television',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'Cinema And Television',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cinema And Television'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Computer Engineering',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Computer Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Digital Game Design',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'Digital Game Design',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  8500,
  4,
  now(),
  true,
  'Economics',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  9000,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Energy Systems Engineering',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Energy Systems Engineering',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Energy Systems Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Engineering Management',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Translation And Interpretation',
  'Bachelor',
  'Turkish',
  8500,
  4,
  now(),
  true,
  'English Translation And Interpretation',
  8500,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Translation And Interpretation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Fashion And Textile Design',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Fashion And Textile Design',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Fashion And Textile Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gelis pianoi',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Gelis pianoi',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Gelis pianoi'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Guidance And Psychological Counseling',
  'Bachelor',
  'English',
  5950,
  4,
  now(),
  true,
  'Guidance And Psychological Counseling',
  5950,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Guidance And Psychological Counseling'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industral Engineering',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Industral Engineering',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industral Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Security Technology',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Information Security Technology',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Information Security Technology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Desigr',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Interior Architecture And Environmental Desigr',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Interior Architecture And Environmental Desigr'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Finance',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'International Finance',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Finance'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Business',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'International Trade And Business',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Trade And Business'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Logistics Management',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Logistics Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Mechatronics Engineering',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  28000,
  6,
  now(),
  true,
  'Medicine',
  28000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicine'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Molecular Biology And Genetics',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Molecular Biology And Genetics',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Molecular Biology And Genetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music',
  'Bachelor',
  'English',
  5950,
  4,
  now(),
  true,
  'Music',
  5950,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Music'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music Technology',
  'Bachelor',
  'Turkish',
  5950,
  4,
  now(),
  true,
  'Music Technology',
  5950,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Music Technology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'New Media',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('New Media'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  6375,
  4,
  now(),
  true,
  'Nursing',
  6375,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  6375,
  4,
  now(),
  true,
  'Nutnition And Dietetics',
  6375,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  'English',
  6375,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  6375,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Performing Arts',
  'Bachelor',
  'English',
  5950,
  4,
  now(),
  true,
  'Performing Arts',
  5950,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Performing Arts'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  15000,
  5,
  now(),
  true,
  'Pharmacy',
  15000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'English',
  6375,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  6375,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  6375,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  6375,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pilotage',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Pilotage',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pilotage'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Preschool Education',
  'Bachelor',
  'English',
  5950,
  4,
  now(),
  true,
  'Preschool Education',
  5950,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Preschool Education'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Psychology',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'Public Relations And Advertising',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Advertising'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sociology',
  'Bachelor',
  'English',
  8500,
  4,
  now(),
  true,
  'Sociology',
  8500,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sociology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'Software Engineering',
  9000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Software Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Visual Communication Design',
  'Bachelor',
  'English',
  6800,
  4,
  now(),
  true,
  'Visual Communication Design',
  6800,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Visual Communication Design'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Vocal Training',
  'Bachelor',
  'Turkish',
  5950,
  4,
  now(),
  true,
  'Vocal Training',
  5950,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Vocal Training'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Anesthesia'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiometry',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Audiometry',
  3500,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Audiometry'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Child Development',
  3500,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dialysis'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('First And Emergency Aid'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretarial',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Medical Documentation And Secretarial',
  3500,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  3500,
  2,
  now(),
  true,
  'Medical Imaging Techniques',
  3500,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Dental Health'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radiotherapy',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'Radiotherapy',
  3500,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Radiotherapy'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Advertising And Brand Communication Manage',
  'Master',
  'Turkish',
  14000,
  1,
  now(),
  true,
  'Advertising And Brand Communication Manage',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Advertising And Brand Communication Manage'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'Architecture',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Architecture'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence With Thesis',
  'Master',
  'English',
  14000,
  2,
  now(),
  true,
  'Artificial Intelligence With Thesis',
  14000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Artificial Intelligence With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'Aviation Management',
  12000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Aviation Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Bioengineering With Thesis',
  'Master',
  'English',
  14000,
  2,
  now(),
  true,
  'Bioengineering With Thesis',
  14000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Bioengineering With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'Business Administration',
  12000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  12000,
  1,
  now(),
  true,
  'Business Administration',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration ( De)',
  'Master',
  'English',
  7000,
  1,
  now(),
  true,
  'Business Administration ( De)',
  7000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration ( De)'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration (De)',
  'Master',
  'Turkish',
  7000,
  1,
  now(),
  false,
  'Business Administration (De)',
  7000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration (De)'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  14000,
  2,
  now(),
  true,
  'Business Administration With Thesis',
  14000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
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
  14000,
  2,
  now(),
  true,
  'Business Administration With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chiropractic Treatment',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'Chiropractic Treatment',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chiropractic Treatment'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology With Thesis',
  'Master',
  'English',
  18000,
  2,
  now(),
  true,
  'Clinical Psychology With Thesis',
  18000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'Engineering Management',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Engineering Management With Thesis',
  'Master',
  'Turkish',
  14000,
  2,
  now(),
  true,
  'Engineering Management With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Engineering Management With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Education',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'English Language Education',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Language Education'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Education (De)',
  'Master',
  'English',
  7000,
  1,
  now(),
  true,
  'English Language Education (De)',
  7000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Language Education (De)'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Entrepreneurship And Innovation Management',
  'Master',
  'English',
  14000,
  1,
  now(),
  true,
  'Entrepreneurship And Innovation Management',
  14000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Entrepreneurship And Innovation Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Executive MBA With Thesis',
  'Master',
  'Turkish',
  18000,
  2,
  now(),
  true,
  'Executive MBA With Thesis',
  18000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Executive MBA With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Financial Technologies',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'Financial Technologies',
  12000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Financial Technologies'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Financial Technologies With Thesis',
  'Master',
  'English',
  14000,
  2,
  now(),
  true,
  'Financial Technologies With Thesis',
  14000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Financial Technologies With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Game Development Technologies',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'Game Development Technologies',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Game Development Technologies'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Global Affairs With Thesis',
  'Master',
  'English',
  14000,
  2,
  now(),
  true,
  'Global Affairs With Thesis',
  14000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Global Affairs With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Care Organizations Management',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'Health Care Organizations Management',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Care Organizations Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Care Organizations Management With 1',
  'Master',
  'Turkish',
  14000,
  1,
  now(),
  true,
  'Health Care Organizations Management With 1',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Health Care Organizations Management With 1'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'History',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'History',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('History'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'History With Thesis',
  'Master',
  'Turkish',
  14000,
  2,
  now(),
  true,
  'History With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('History With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management (De)',
  'Master',
  'Turkish',
  7000,
  1,
  now(),
  true,
  'Human Resources Management (De)',
  7000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Human Resources Management (De)'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Information Technologies With Thesis',
  'Master',
  'Turkish',
  14000,
  2,
  now(),
  true,
  'Information Technologies With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Information Technologies With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Design With Thesis',
  'Master',
  'Turkish',
  14000,
  2,
  now(),
  true,
  'Interior Design With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Interior Design With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Commercial Law',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'International Commercial Law',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('International Commercial Law'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Marketing (De)',
  'Master',
  'Turkish',
  7000,
  1,
  now(),
  true,
  'Marketing (De)',
  7000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Marketing (De)'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Minema And Talavicion With thesis',
  'Master',
  'English',
  12000,
  2,
  now(),
  true,
  'Minema And Talavicion With thesis',
  12000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Minema And Talavicion With thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Music With Thesis',
  'Master',
  'Turkish',
  14000,
  2,
  now(),
  true,
  'Music With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Music With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Law With Thesis',
  'Master',
  'Turkish',
  12000,
  2,
  now(),
  true,
  'Public Law With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Law With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sport Management',
  'Master',
  'Turkish',
  14000,
  1,
  now(),
  true,
  'Sport Management',
  12000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sport Management'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Nutrition With Thesis',
  'Master',
  'Turkish',
  14000,
  2,
  now(),
  true,
  'Sports Nutrition With Thesis',
  14000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sports Nutrition With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema And Media Research',
  'PhD',
  'English',
  40000,
  4,
  now(),
  true,
  'Cinema And Media Research',
  40000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cinema And Media Research'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cinema And Media Research',
  'PhD',
  'Turkish',
  40000,
  4,
  now(),
  true,
  'Cinema And Media Research',
  40000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Cinema And Media Research'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'PhD',
  'English',
  40000,
  4,
  now(),
  true,
  'Electrical And Electronic Engineering',
  40000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Electrical And Electronic Engineering'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Education',
  'PhD',
  'English',
  40000,
  4,
  now(),
  true,
  'English Language Education',
  40000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Language Education'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Guidance And Counseling',
  'PhD',
  'Turkish',
  40000,
  4,
  now(),
  true,
  'Guidance And Counseling',
  40000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Guidance And Counseling'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Engineering',
  'PhD',
  'Turkish',
  40000,
  4,
  now(),
  true,
  'Management Engineering',
  40000,
  8500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Management Engineering'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'PhD',
  'Turkish',
  40000,
  4,
  now(),
  true,
  'Public Relations And Advertising',
  40000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Public Relations And Advertising'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  2500,
  4,
  now(),
  true,
  'Business Administration',
  2500,
  2500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'Turkish',
  2500,
  4,
  now(),
  true,
  'Business Administration',
  2500,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemical Engineering',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Chemical Engineering',
  3000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chemical Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Chemical Engineering',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  'Chemical Engineering',
  3000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Chemical Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Computer Engineering',
  3000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  3000,
  4,
  now(),
  true,
  'Computer Engineering',
  3000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  15000,
  5,
  now(),
  true,
  'Dentistry',
  15000,
  4000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  13000,
  5,
  now(),
  true,
  'Dentistry',
  13000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Translation And Interpretation',
  'Bachelor',
  'English',
  2500,
  4,
  now(),
  true,
  'English Translation And Interpretation',
  2500,
  2500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('English Translation And Interpretation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Industrial Engineering',
  3000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  'Industrial Engineering',
  3000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Industrial Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Mechanical Engineering',
  3000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Mechanical Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechanical Engineering',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  'Mechanical Engineering',
  3000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Mechanical Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Mechatronics Engineering',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Mechatronics Engineering',
  3000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  16000,
  6,
  now(),
  true,
  'Medicine',
  16000,
  4000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicine'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics',
  'Bachelor',
  'Turkish',
  2500,
  4,
  now(),
  true,
  'Nutrition And Dietetics',
  2500,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  90000,
  4,
  now(),
  true,
  'Pharmacy',
  9000,
  3500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  7000,
  4,
  now(),
  true,
  'Pharmacy',
  7000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  2500,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  2500,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  'Turkish',
  2500,
  4,
  now(),
  true,
  'Psychology',
  2500,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Psychology'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Software Engineering',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Software Engineering',
  3000,
  3000,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
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
  3000,
  4,
  now(),
  true,
  'Software Engineering',
  3000,
  1500,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('Istanbul Health and Technology University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Software Engineering'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  3000,
  4,
  now(),
  true,
  'Business Administration',
  3000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
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
  3400,
  4,
  now(),
  true,
  'Child Development',
  3400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Child Development'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Pharmacy',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  'Clinical Pharmacy',
  3800,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Pharmacy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Coaching',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  'Coaching',
  3000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Coaching'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  6000,
  5,
  now(),
  true,
  'Dentistry',
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
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
  6000,
  5,
  now(),
  true,
  'Dentistry',
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Dentistry'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'English',
  10500,
  6,
  now(),
  true,
  'Medicine',
  10500,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Medicine'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  3400,
  4,
  now(),
  true,
  'Nursing',
  3400,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nursing'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Bachelor',
  'Turkish',
  2500,
  4,
  now(),
  true,
  'Oral And Dental Health',
  2500,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Dental Health'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'English',
  3800,
  4,
  now(),
  true,
  'Pharmacy',
  3800,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  3400,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  3400,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Recreation',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  'Recreation',
  3000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Recreation'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management',
  'Bachelor',
  'Turkish',
  3000,
  4,
  now(),
  true,
  'Sports Management',
  3000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Sports Management'))
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  2000,
  2,
  now(),
  true,
  'Oral And Dental Health',
  2000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Dental Health'))
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Master',
  'Turkish',
  3000,
  1,
  now(),
  true,
  'Business Administration',
  3000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
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
  'Turkish',
  3000,
  2,
  now(),
  false,
  'Business Administration With Thesis',
  3000,
  20261,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'Master',
  'Turkish',
  6000,
  1,
  now(),
  true,
  'Clinical Psychology',
  6000,
  20260,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Educational Administration And Supervision W',
  'Master',
  'Turkish',
  4000,
  2,
  now(),
  true,
  'Educational Administration And Supervision W',
  4000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Educational Administration And Supervision W'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nutrition And Dietetics With Thesis',
  'Master',
  'Turkish',
  4000,
  2,
  now(),
  true,
  'Nutrition And Dietetics With Thesis',
  4000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Nutrition And Dietetics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Surgery',
  'Master',
  'English',
  12000,
  1,
  now(),
  false,
  'Oral And Maxillofacial Surgery',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Maxillofacial Surgery'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Surgery',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'Oral And Maxillofacial Surgery',
  12000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Maxillofacial Surgery'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Surgery With Thesis',
  'Master',
  'English',
  12000,
  2,
  now(),
  true,
  'Oral And Maxillofacial Surgery With Thesis',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Maxillofacial Surgery With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Surgery With Thesis',
  'Master',
  'Turkish',
  12000,
  2,
  now(),
  true,
  'Oral And Maxillofacial Surgery With Thesis',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Maxillofacial Surgery With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics',
  'Master',
  'Turkish',
  6000,
  1,
  now(),
  true,
  'Orthodontics',
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthodontics'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics With Thesis',
  'Master',
  'English',
  6000,
  2,
  now(),
  true,
  'Orthodontics With Thesis',
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthodontics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics With Thesis',
  'Master',
  'Turkish',
  6000,
  2,
  now(),
  true,
  'Orthodontics With Thesis',
  6000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthodontics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation With Thesis',
  'Master',
  'Turkish',
  3000,
  2,
  now(),
  true,
  'Physiotherapy And Rehabilitation With Thesis',
  3000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthetic Dentistry',
  'Master',
  'Turkish',
  12000,
  1,
  now(),
  true,
  'Prosthetic Dentistry',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthetic Dentistry'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthetic Dentistry With Thesis',
  'Master',
  'Turkish',
  12000,
  2,
  now(),
  true,
  'Prosthetic Dentistry With Thesis',
  12000,
  20261,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthetic Dentistry With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthodontics',
  'Master',
  'English',
  12000,
  1,
  now(),
  true,
  'Prosthodontics',
  12000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthodontics'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthodontics With Thesis',
  'Master',
  'English',
  12000,
  2,
  now(),
  true,
  'Prosthodontics With Thesis',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthodontics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthodontics With Thesis',
  'Master',
  'Turkish',
  12000,
  2,
  now(),
  true,
  'Prosthodontics With Thesis',
  12000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthodontics With Thesis'))
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'English',
  8000,
  4,
  now(),
  true,
  'Business Administration',
  8000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'PhD',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Business Administration',
  8000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Business Administration'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Clinical Psychology',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  'Clinical Psychology',
  12000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Clinical Psychology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Education Management And Planning',
  'PhD',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Education Management And Planning',
  8000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Education Management And Planning'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Maxillofacial Surgery',
  'PhD',
  'English',
  60000,
  4,
  now(),
  true,
  'Oral And Maxillofacial Surgery',
  60000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Oral And Maxillofacial Surgery'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics',
  'PhD',
  'English',
  60000,
  4,
  now(),
  true,
  'Orthodontics',
  60000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthodontics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthodontics',
  'PhD',
  'Turkish',
  60000,
  4,
  now(),
  true,
  'Orthodontics',
  60000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Orthodontics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pedodontics',
  'PhD',
  'Turkish',
  32000,
  4,
  now(),
  true,
  'Pedodontics',
  32000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pedodontics'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Periodontology',
  'PhD',
  'Turkish',
  32000,
  4,
  now(),
  true,
  'Periodontology',
  32000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Periodontology'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'PhD',
  'English',
  12000,
  4,
  now(),
  true,
  'Pharmacy',
  12000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'English'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'PhD',
  'Turkish',
  12000,
  4,
  now(),
  true,
  'Pharmacy',
  12000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Pharmacy'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'PhD',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'Physiotherapy And Rehabilitation',
  8000,
  NULL,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Physiotherapy And Rehabilitation'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );


INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Prosthodontic Treatment',
  'PhD',
  'Turkish',
  32000,
  4,
  now(),
  true,
  'Prosthodontic Treatment',
  32000,
  2026,
  now()
FROM university u
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND lower(trim(p.name)) = lower(trim('Prosthodontic Treatment'))
      AND COALESCE(p.degree, '') = 'PhD'
      AND COALESCE(p.language, '') = 'Turkish'
  );
