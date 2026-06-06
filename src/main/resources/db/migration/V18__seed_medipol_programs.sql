-- Medipol University programs (Turkey). Idempotent per university + name + degree + language.
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electrical And Electronic Engineering',
  'Bachelor',
  'English',
  5400,
  4,
  now(),
  true,
  'هندسة كهرباء والكترون',
  6000,
  6000,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electrical And Electronic Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'التجارة الدولية والمالية',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Economics And Finance',
  'Bachelor',
  'English',
  4050,
  4,
  now(),
  true,
  'الاقتصاد والتمويل',
  4500,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Economics And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'English',
  39600,
  6,
  now(),
  true,
  'طب بشري',
  44000,
  17000,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'إدارة الطيران',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'Turkish',
  7650,
  4,
  now(),
  true,
  'العلاج الطبيعي وإعادة التأهيل',
  8500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Journalism',
  'Bachelor',
  'Turkish',
  4050,
  4,
  now(),
  true,
  'صحافة',
  4500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Journalism'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'علم النفس',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Artificial Intelligence Engineering',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'هندسة الذكاء الاصطناعي',
  10000,
  10000,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Artificial Intelligence Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Media And Visual Arts',
  'Bachelor',
  'Turkish',
  4050,
  4,
  now(),
  true,
  'الاعلام و الفنون المرئية',
  4500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Media And Visual Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'إدارة اللوجستية',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Bachelor',
  'English',
  4275,
  4,
  now(),
  true,
  'علاج النطق واللغة',
  4750,
  4750,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Speech And Language Therapy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'English',
  32400,
  5,
  now(),
  true,
  'طب الأسنان',
  36000,
  17000,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dentistry',
  'Bachelor',
  'Turkish',
  29700,
  5,
  now(),
  true,
  'طب الأسنان',
  33000,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dentistry'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'الإدارة الصحية',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Speech And Language Therapy',
  'Bachelor',
  'Turkish',
  4050,
  4,
  now(),
  true,
  'علاج النطق واللغة',
  4500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Speech And Language Therapy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Preschool Education',
  'Bachelor',
  'Turkish',
  4950,
  4,
  now(),
  true,
  'التعليم ما قبل الابتدائي',
  5500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Preschool Education'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Turkish Music Art',
  'Bachelor',
  'Turkish',
  4500,
  4,
  now(),
  true,
  'فن الموسيقى التركية',
  5000,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Turkish Music Art'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'English',
  4050,
  4,
  now(),
  true,
  'العلاقات العامة والدعاية والإعلان',
  4500,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'History',
  'Bachelor',
  'English',
  5850,
  4,
  now(),
  true,
  'التاريخ',
  6500,
  6500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'History'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And International Relations',
  'Bachelor',
  'English',
  4950,
  4,
  now(),
  true,
  'العلوم السياسية والعلاقات الدولية',
  5500,
  5500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And International Relations'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Primary Mathematics Teaching',
  'Bachelor',
  'Turkish',
  4950,
  4,
  now(),
  true,
  'تدريس الرياضيات الابتدائية',
  5500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Primary Mathematics Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Design',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'العمارة الداخلية والتصميم البيئي',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Services',
  'Bachelor',
  'Turkish',
  4050,
  4,
  now(),
  true,
  'الخدمة الاجتماعية',
  4500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social Services'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'International Trade And Finance',
  'Bachelor',
  'English',
  4050,
  4,
  now(),
  true,
  'التجارة الدولية والمالية',
  4500,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'International Trade And Finance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'New Media And Communication',
  'Bachelor',
  'Turkish',
  4950,
  4,
  now(),
  true,
  'الإعلام والاتصال الجديد',
  5500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'New Media And Communication'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Bachelor',
  'Turkish',
  5400,
  4,
  now(),
  true,
  'تنمية الطفل',
  6000,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'English Language Teaching',
  'Bachelor',
  'English',
  4950,
  4,
  now(),
  true,
  'تدريس اللغة الإنجليزية',
  5500,
  5500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'English Language Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Bachelor',
  'English',
  4950,
  4,
  now(),
  true,
  'إدارة الأعمال',
  5500,
  5500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Urban Design And Landscape Architecture',
  'Bachelor',
  'Turkish',
  4050,
  4,
  now(),
  true,
  'التصميم الحضري وهندسة المناظر الطبيعية',
  4500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Urban Design And Landscape Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'Turkish',
  7875,
  4,
  now(),
  true,
  'التمريض',
  8750,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Insurance',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'المصارف والتأمين',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Insurance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Ergotherapy',
  'Bachelor',
  'Turkish',
  4050,
  4,
  now(),
  true,
  'العلاج الوظيفي',
  4500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Ergotherapy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychology',
  'Bachelor',
  'English',
  4950,
  4,
  now(),
  true,
  'علم النفس',
  5500,
  5500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychological Counseling And Guidance',
  'Bachelor',
  'English',
  4050,
  4,
  now(),
  true,
  'الإرشاد النفسي والتوجيه',
  4500,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychological Counseling And Guidance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Psychological Counseling And Guidance',
  'Bachelor',
  'Turkish',
  4950,
  4,
  now(),
  true,
  'الإرشاد النفسي والتوجيه',
  5500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Psychological Counseling And Guidance'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Bachelor',
  'English',
  4950,
  4,
  now(),
  true,
  'العلوم السياسية والإدارة العامة',
  5500,
  5500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
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
  'الصيدلة',
  18000,
  16200,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management',
  'Bachelor',
  'Turkish',
  5500,
  4,
  now(),
  true,
  'إدارة الموارد البشرية',
  5500,
  4950,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management'
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
  'التغذية والحمية',
  4500,
  4050,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nutrition And Dietetics'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Law',
  'Bachelor',
  'Turkish',
  8000,
  4,
  now(),
  true,
  'الحقوق',
  8000,
  7200,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Law'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'Turkish',
  6000,
  4,
  now(),
  true,
  'فنون الطهي والطبخ',
  6000,
  5400,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Aviation Management',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  'إدارة الطيران',
  4500,
  4050,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Aviation Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy And Rehabilitation',
  'Bachelor',
  'English',
  9000,
  4,
  now(),
  true,
  'العلاج الطبيعي وإعادة التأهيل',
  9000,
  8100,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy And Rehabilitation'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biomedical Engineering',
  'Bachelor',
  'English',
  6500,
  4,
  now(),
  true,
  'الهندسة الطبية الحيوية',
  6500,
  5850,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Biomedical Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiology',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'علم السمع',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Audiology'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'Turkish',
  5850,
  4,
  now(),
  true,
  'هندسة معمارية',
  6500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architecture',
  'Bachelor',
  'English',
  4950,
  4,
  now(),
  true,
  'هندسة معمارية',
  5500,
  5500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architecture'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Orthotics And Prosthetics',
  'Bachelor',
  'Turkish',
  5000,
  4,
  now(),
  true,
  'الأطراف الصناعية والأجهزة التقويمية',
  5000,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Orthotics And Prosthetics'
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
  'القبالة',
  8000,
  7200,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Midwifery'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy',
  'Bachelor',
  'Turkish',
  15000,
  5,
  now(),
  true,
  'الصيدلة',
  15000,
  13500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Advertising',
  'Bachelor',
  'Turkish',
  5500,
  4,
  now(),
  true,
  'العلاقات العامة والدعاية والإعلان',
  5500,
  4950,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Advertising'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Engineering',
  'Bachelor',
  'Turkish',
  7000,
  4,
  now(),
  true,
  'الهندسة المدنية',
  7000,
  6300,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Health Management',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  'الإدارة الصحية',
  4500,
  4050,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Health Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Design',
  'Bachelor',
  'Turkish',
  5000,
  4,
  now(),
  true,
  'التصميم الصناعي',
  5000,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Architecture And Environmental Design',
  'Bachelor',
  'English',
  5000,
  4,
  now(),
  true,
  'العمارة الداخلية والتصميم البيئي',
  5000,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Architecture And Environmental Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Gastronomy And Culinary Arts',
  'Bachelor',
  'English',
  4750,
  4,
  now(),
  true,
  'فنون الطهي والطبخ',
  4750,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Gastronomy And Culinary Arts'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Information Systems',
  'Bachelor',
  'Turkish',
  6500,
  4,
  now(),
  true,
  'نظم معلومات الإدارة',
  6500,
  5850,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'الهندسة المدنية',
  5000,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Nursing',
  'Bachelor',
  'English',
  6000,
  4,
  now(),
  true,
  'التمريض',
  6000,
  5400,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Nursing'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics Management',
  'Bachelor',
  'English',
  4500,
  4,
  now(),
  true,
  'إدارة اللوجستية',
  4500,
  4050,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics Management'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Political Science And Public Administration',
  'Bachelor',
  'Turkish',
  6000,
  4,
  now(),
  true,
  'العلوم السياسية والإدارة العامة',
  6000,
  5400,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Political Science And Public Administration'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Engineering',
  'Bachelor',
  'English',
  6500,
  4,
  now(),
  true,
  'هندسة الحاسوب',
  6500,
  5850,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
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
  'نظم معلومات الإدارة',
  4500,
  4050,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Information Systems'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Special Education Teaching',
  'Bachelor',
  'Turkish',
  5500,
  4,
  now(),
  true,
  'تربية خاصة',
  5500,
  4950,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Special Education Teaching'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'تصميم الاتصال البصري',
  4500,
  4050,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Visual Communication Design'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Industrial Engineering',
  'Bachelor',
  'English',
  4750,
  4,
  now(),
  true,
  'الهندسة الصناعية',
  4750,
  4275,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Industrial Engineering'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio Television And Film',
  'Bachelor',
  'Turkish',
  5500,
  4,
  now(),
  true,
  'الإذاعة والتلفزيون والسينما',
  5500,
  4950,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio Television And Film'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medicine',
  'Bachelor',
  'Turkish',
  34000,
  4,
  now(),
  true,
  'طب بشري',
  34000,
  30600,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medicine'
      AND COALESCE(p.degree, '') = 'Bachelor'
      AND COALESCE(p.language, '') = 'Turkish'
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
  'إدارة الأعمال',
  4500,
  NULL,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration With Thesis',
  'Master',
  'English',
  5000,
  2,
  now(),
  true,
  'إدارة الأعمال مع أطروحة',
  5000,
  NULL,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration With Thesis'
      AND COALESCE(p.degree, '') = 'Master'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'تخدير',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'English',
  3150,
  2,
  now(),
  true,
  'العلاج الطبيعي',
  3500,
  3500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'Turkish',
  3150,
  2,
  now(),
  true,
  'برمجة الكمبيوتر',
  3500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Biomedical Device Technologies',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'تقنيات الأجهزة الطبية الحيوية',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Biomedical Device Technologies'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Anesthesia',
  'Diploma',
  'English',
  3150,
  2,
  now(),
  true,
  'تخدير',
  3500,
  3500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Anesthesia'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radio And Television Programming',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'برمجة الإذاعة والتلفزيون',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radio And Television Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'English',
  4050,
  2,
  now(),
  true,
  'تعويضات سنية',
  4500,
  4500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dental Prosthesis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Documentation And Secretarial',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'التوثيق الطبي والسكرتارية',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Documentation And Secretarial'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Radiotherapy',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'العلاج الإشعاعي',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Radiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'English',
  3150,
  2,
  now(),
  true,
  'إسعافات أولية',
  3500,
  3500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Business Administration',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'إدارة الأعمال',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Business Administration'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Cyber Security',
  'Diploma',
  'English',
  3150,
  2,
  now(),
  true,
  'الأمن السيبراني',
  3500,
  3500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Cyber Security'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Imaging Techniques',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'تقنيات التصوير الطبي',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Imaging Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Back-End Software Development',
  'Diploma',
  'English',
  3150,
  2,
  now(),
  true,
  'تطوير برمجيات الخلفية',
  3500,
  3500,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Back-End Software Development'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Management Of Health Institutions',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'إدارة المؤسسات الصحية',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Management Of Health Institutions'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Justice',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'عدالة',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Justice'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Cabin Services',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'خدمات مقصورة الطيران المدني',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Cabin Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Child Development',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'تنمية الطفل',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Child Development'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Civil Aviation Transportation Management',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'إدارة النقل الجوي المدني',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Civil Aviation Transportation Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pharmacy Services',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'خدمات الصيدلة',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pharmacy Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Banking And Insurance',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'المصارف والتأمين',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Banking And Insurance'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Foreign Trade',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'تجارة خارجية',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Foreign Trade'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Pathology Laboratory Techniques',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'تقنيات مختبر علم الأمراض',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Pathology Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Applied English And Translation',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'الإنجليزية التطبيقية والترجمة',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Applied English And Translation'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Audiometry',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'قياس السمع',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Audiometry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Public Relations And Publicity',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'العلاقات العامة والإعلان',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Public Relations And Publicity'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Physiotherapy',
  'Diploma',
  'Turkish',
  3500,
  2,
  now(),
  true,
  'العلاج الطبيعي',
  3500,
  3150,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Physiotherapy'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Operating Room Services',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'خدمات غرفة العمليات',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Operating Room Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Social Services',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'الخدمة الاجتماعية',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Social Services'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Robotics And Artificial Intelligence',
  'Diploma',
  'English',
  3500,
  2,
  now(),
  true,
  'الروبوتات والذكاء الاصطناعي',
  3500,
  3150,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Robotics And Artificial Intelligence'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Accounting And Tax Applications',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'تطبيقات المحاسبة والضرائب',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Accounting And Tax Applications'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Computer Programming',
  'Diploma',
  'English',
  3500,
  2,
  now(),
  true,
  'برمجة الكمبيوتر',
  3500,
  3150,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Computer Programming'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'English'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Logistics',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'اللوجستيات',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Logistics'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Occupational Health And Safety',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'الصحة والسلامة المهنية',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Occupational Health And Safety'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Human Resources Management',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'إدارة الموارد البشرية',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Human Resources Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dialysis',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'غسيل الكلى',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dialysis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Opticianry',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'البصريات',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Opticianry'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Interior Design',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'التصميم الداخلي',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Interior Design'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Medical Laboratory Techniques',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'تقنيات المختبر الطبي',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Medical Laboratory Techniques'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Finance',
  'Diploma',
  'Turkish',
  3250,
  2,
  now(),
  true,
  'التمويل',
  3250,
  2925,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Finance'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Architectural Restoration',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'الترميم المعماري',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Architectural Restoration'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Oral And Dental Health',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'صحة الفم والأسنان',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Oral And Dental Health'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'First And Emergency Aid',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'إسعافات أولية',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'First And Emergency Aid'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Electroneurophysiology',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'الفسيولوجيا الكهربائية العصبية',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Electroneurophysiology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Construction Technology',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'تكنولوجيا البناء',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Construction Technology'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Dental Prosthesis',
  'Diploma',
  'Turkish',
  3150,
  2,
  now(),
  true,
  'تعويضات سنية',
  3500,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Dental Prosthesis'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  'Sports Management',
  'Diploma',
  'Turkish',
  2925,
  2,
  now(),
  true,
  'إدارة الرياضة',
  3250,
  1390,
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = 'Medipol University'
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = 'Sports Management'
      AND COALESCE(p.degree, '') = 'Diploma'
      AND COALESCE(p.language, '') = 'Turkish'
  );

