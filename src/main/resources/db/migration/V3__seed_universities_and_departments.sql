INSERT INTO university (id, name, country, website, created_at)
SELECT '7f4f81df-5c66-4f9d-9d5e-f8fc450baf01'::uuid, 'Istanbul University', 'Turkey', 'https://www.istanbul.edu.tr', now()
WHERE NOT EXISTS (SELECT 1 FROM university WHERE lower(name) = lower('Istanbul University'));

INSERT INTO university (id, name, country, website, created_at)
SELECT '5b6f3d1c-30dc-4938-9df1-29ca8a2e73f9'::uuid, 'Ankara University', 'Turkey', 'https://www.ankara.edu.tr', now()
WHERE NOT EXISTS (SELECT 1 FROM university WHERE lower(name) = lower('Ankara University'));

INSERT INTO university (id, name, country, website, created_at)
SELECT 'f4f314fa-4fa6-4f7a-bc89-0f2f7be36e23'::uuid, 'Marmara University', 'Turkey', 'https://www.marmara.edu.tr', now()
WHERE NOT EXISTS (SELECT 1 FROM university WHERE lower(name) = lower('Marmara University'));

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at)
SELECT
  '211551ef-73e0-4289-b6eb-f8911b5b06d4'::uuid,
  (SELECT id FROM university WHERE lower(name) = lower('Istanbul University') LIMIT 1),
  'Computer Engineering',
  NULL,
  NULL,
  NULL,
  NULL,
  now()
WHERE NOT EXISTS (SELECT 1 FROM program WHERE lower(name) = lower('Computer Engineering'));

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at)
SELECT
  'c84c3933-b5c4-43fe-9eb0-ff8e0f8aed58'::uuid,
  (SELECT id FROM university WHERE lower(name) = lower('Ankara University') LIMIT 1),
  'Business Administration',
  NULL,
  NULL,
  NULL,
  NULL,
  now()
WHERE NOT EXISTS (SELECT 1 FROM program WHERE lower(name) = lower('Business Administration'));

INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at)
SELECT
  '1cf38906-9fb4-4460-a2a0-79c603f1dcc8'::uuid,
  (SELECT id FROM university WHERE lower(name) = lower('Marmara University') LIMIT 1),
  'Architecture',
  NULL,
  NULL,
  NULL,
  NULL,
  now()
WHERE NOT EXISTS (SELECT 1 FROM program WHERE lower(name) = lower('Architecture'));

