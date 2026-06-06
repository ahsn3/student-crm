-- V49: add 610 programs to approach portal total (4949).
-- Priority: OCR gaps, Cyprus PhD bilingual, Diploma/PhD variants.


-- Altınbaş University: 21 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Anesthesia', 'Diploma', 'English', 2500, 2, true, 'Anesthesia', 2750, 2350),
  ('Audiometry', 'Diploma', 'English', 2500, 2, true, 'Audiometry', 2750, 2350),
  ('First Aid And Emergency (Evening Class)', 'Diploma', 'English', 2500, 2, true, 'First Aid And Emergency (Evening Class)', 2750, 2350),
  ('First And Emergency Aid', 'Diploma', 'English', 2500, 2, true, 'First And Emergency Aid', 2750, 2350),
  ('Medical Documentation And Secretariat (Even', 'Diploma', 'English', 2500, 2, true, 'Medical Documentation And Secretariat (Even', 2750, 2350),
  ('Medical Imaging Techniques', 'Diploma', 'English', 2500, 2, true, 'Medical Imaging Techniques', 2750, 2350),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 2500, 2, true, 'Medical Laboratory Techniques', 2750, 2350),
  ('Operation Room Services (Evening Class)', 'Diploma', 'English', 2500, 2, true, 'Operation Room Services (Evening Class)', 2750, 2350),
  ('Opticianry', 'Diploma', 'English', 2500, 2, true, 'Opticianry', 2750, 2350),
  ('Oral And Dental Health', 'Diploma', 'English', 2500, 2, true, 'Oral And Dental Health', 2750, 2350),
  ('Pharmacy Services', 'Diploma', 'English', 2500, 2, true, 'Pharmacy Services', 2750, NULL::numeric),
  ('Physiotherapy', 'Diploma', 'English', 2500, 2, true, 'Physiotherapy', 2750, 2350),
  ('Radiotherapy', 'Diploma', 'English', 2500, 2, true, 'Radiotherapy', 2750, 2350),
  ('Electrical And Computer Engineering', 'PhD', 'English', 9900, 4, true, 'Electrical And Computer Engineering', 19800, 8910),
  ('Healthcare Management', 'PhD', 'English', 9900, 4, true, 'Healthcare Management', 19800, 8910),
  ('Orthodontics', 'PhD', 'English', 25000, 4, true, 'Orthodontics', 25000, 2026),
  ('Periodontology', 'PhD', 'Turkish', 19800, 4, true, 'Periodontology', 19800, 2026),
  ('Pharmaceutical Sciences', 'PhD', 'English', 19800, 4, true, 'Pharmaceutical Sciences', 19800, 2026),
  ('Private Law', 'PhD', 'English', 9900, 4, true, 'Private Law', 19800, 8910),
  ('Prothetic Dental Treatment', 'PhD', 'English', 19800, 4, true, 'Prothetic Dental Treatment', 19800, 2026),
  ('Public Law', 'PhD', 'English', 9900, 4, true, 'Public Law', 19800, 8910)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Altınbaş University'))
  AND p.id IS NULL;


-- Arel University: 8 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'PhD', 'English', 9000, 4, true, 'Architecture', 9000, 1800),
  ('Business Administration', 'PhD', 'English', 9000, 4, false, 'Business Administration', 9000, 1800),
  ('Civil Engineering', 'PhD', 'English', 9000, 4, true, 'Civil Engineering', 9000, 1800),
  ('Electrical And Electronic Engineering', 'PhD', 'English', 9000, 4, true, 'Electrical And Electronic Engineering', 9000, 1800),
  ('Graphic Design', 'PhD', 'English', 9000, 4, true, 'Graphic Design', 9000, 1800),
  ('Mechanical Engineering', 'PhD', 'English', 9000, 4, true, 'Mechanical Engineering', 9000, 1800),
  ('Political Science And Public Administration', 'PhD', 'English', 9000, 4, false, 'Political Science And Public Administration', 9000, 1800),
  ('Psychology', 'PhD', 'English', 9000, 4, true, 'Psychology', 9000, 1800)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Arel University'))
  AND p.id IS NULL;


-- Atılım University: 12 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'PhD', 'English', 16500, 4, true, 'Architecture', 16500, NULL::numeric),
  ('Chemistry', 'PhD', 'Turkish', 22000, 4, true, 'Chemistry', 22000, NULL::numeric),
  ('Civil Engineering', 'PhD', 'Turkish', 22000, 4, true, 'Civil Engineering', 22000, NULL::numeric),
  ('Electrical And Computer Engineering', 'PhD', 'Turkish', 22000, 4, true, 'Electrical And Computer Engineering', 22000, NULL::numeric),
  ('Mathematics', 'PhD', 'Turkish', 22000, 4, true, 'Mathematics', 22000, NULL::numeric),
  ('Mechanical Engineering', 'PhD', 'Turkish', 22000, 4, true, 'Mechanical Engineering', 22000, NULL::numeric),
  ('Modeling and Design of Engineering Systems', 'PhD', 'Turkish', 22000, 4, true, 'Modeling and Design of Engineering Systems', 22000, NULL::numeric),
  ('Political Economy', 'PhD', 'English', 20500, 4, true, 'Political Economy', 20500, NULL::numeric),
  ('Political Science And Public Administration', 'PhD', 'English', 20500, 4, true, 'Political Science And Public Administration', 20500, NULL::numeric),
  ('Private Law', 'PhD', 'English', 20500, 4, true, 'Private Law', 20500, NULL::numeric),
  ('Public Law', 'PhD', 'English', 20500, 4, true, 'Public Law', 20500, NULL::numeric),
  ('Software Engineering', 'PhD', 'Turkish', 22000, 4, true, 'Software Engineering', 22000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Atılım University'))
  AND p.id IS NULL;


-- Aydın University: 118 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Accounting And Auditing', 'CombinedPhD', 'English', 15000, 4, true, 'Accounting And Auditing', 15000, NULL::numeric),
  ('Administration', 'CombinedPhD', 'English', 12500, 4, true, 'Administration', 12500, 2026),
  ('Applied Psychology', 'CombinedPhD', 'English', 15000, 5, true, 'Applied Psychology', 15000, 14250),
  ('Architecture', 'CombinedPhD', 'English', 15000, 5, true, 'Architecture', 15000, 14250),
  ('Audiology', 'CombinedPhD', 'English', 15000, 5, true, 'Audiology', 15000, 14250),
  ('Chemistry', 'CombinedPhD', 'Turkish', 12500, 4, true, 'Chemistry', 12500, 2026),
  ('Child Development', 'CombinedPhD', 'English', 15000, 5, true, 'Child Development', 15000, 14250),
  ('Civil Engineering', 'CombinedPhD', 'English', 15000, 5, true, 'Civil Engineering', 15000, 14250),
  ('Clinical Psychology', 'CombinedPhD', 'English', 15000, 5, true, 'Clinical Psychology', 15000, 14250),
  ('Computer Engineering', 'CombinedPhD', 'English', 15000, 4, true, 'Computer Engineering', 15000, 7500),
  ('Electrical And Electronic Engineering', 'CombinedPhD', 'Turkish', 20000, 5, true, 'Electrical And Electronic Engineering', 20000, 10000),
  ('English Language And Literature', 'CombinedPhD', 'Turkish', 20000, 4, true, 'English Language And Literature', 20000, 10000),
  ('English Language Teaching', 'CombinedPhD', 'Turkish', 20000, 4, true, 'English Language Teaching', 20000, 10000),
  ('Food Engineering', 'CombinedPhD', 'English', 15000, 5, true, 'Food Engineering', 15000, 14250),
  ('Food Safety', 'CombinedPhD', 'English', 15000, 5, true, 'Food Safety', 15000, 14250),
  ('Graphic Design Art Qualification', 'CombinedPhD', 'English', 15000, 5, true, 'Graphic Design Art Qualification', 15000, 14250),
  ('Medical Microbiology', 'CombinedPhD', 'English', 15000, 5, true, 'Medical Microbiology', 15000, 7500),
  ('Nutrition And Dietetics', 'CombinedPhD', 'English', 15000, 5, true, 'Nutrition And Dietetics', 15000, 14250),
  ('Occupational Health And Safety', 'CombinedPhD', 'English', 15000, 5, true, 'Occupational Health And Safety', 15000, 14250),
  ('Physical Education And Sports', 'CombinedPhD', 'English', 15000, 5, true, 'Physical Education And Sports', 15000, 14250),
  ('Physiotherapy And Rehabilitation', 'CombinedPhD', 'English', 15000, 5, true, 'Physiotherapy And Rehabilitation', 15000, 14250),
  ('Political Science And International Relations', 'CombinedPhD', 'Turkish', 20000, 4, true, 'Political Science And International Relations', 20000, 10000),
  ('Preschool Education', 'CombinedPhD', 'English', 15000, 5, true, 'Preschool Education', 15000, 7500),
  ('Private Law', 'CombinedPhD', 'English', 15000, 4, true, 'Private Law', 15000, 14250),
  ('Public Law', 'CombinedPhD', 'English', 15000, 5, true, 'Public Law', 15000, 7500),
  ('Public Relations And Publicity', 'CombinedPhD', 'English', 15000, 5, true, 'Public Relations And Publicity', 15000, 14250),
  ('Television And Cinema', 'CombinedPhD', 'English', 15000, 5, true, 'Television And Cinema', 15000, 14250),
  ('Turkish Language And Literature', 'CombinedPhD', 'English', 15000, 5, true, 'Turkish Language And Literature', 15000, 7500),
  ('Accounting And Tax Applications', 'Diploma', 'English', 3000, 2, true, 'Accounting And Tax Applications', 3000, 2700),
  ('Air Logistics', 'Diploma', 'English', 3000, 2, true, 'Air Logistics', 3000, 2700),
  ('Aircraft Technology', 'Diploma', 'English', 3000, 2, true, 'Aircraft Technology', 3000, 2700),
  ('Anesthesia', 'Diploma', 'English', 3000, 2, true, 'Anesthesia', 3000, 2700),
  ('Audiometry', 'Diploma', 'English', 3000, 2, true, 'Audiometry', 3000, 2700),
  ('Automotive Technology', 'Diploma', 'English', 3000, 2, true, 'Automotive Technology', 3000, 2700),
  ('Banking And Insurance', 'Diploma', 'English', 3000, 2, true, 'Banking And Insurance', 3000, 2700),
  ('Biomedical Equipment Technology', 'Diploma', 'English', 3000, 2, true, 'Biomedical Equipment Technology', 3000, 2700),
  ('Child Development', 'Diploma', 'English', 3000, 2, true, 'Child Development', 3000, 2700),
  ('Civil Aviation And Cabin Services', 'Diploma', 'English', 3000, 2, true, 'Civil Aviation And Cabin Services', 3000, 2700),
  ('Civil Aviation Cabin Services', 'Diploma', 'English', 2600, 2, true, 'Civil Aviation Cabin Services', 10600, NULL::numeric),
  ('Computer Aided Design And Animation', 'Diploma', 'English', 3000, 2, true, 'Computer Aided Design And Animation', 3000, 2700),
  ('Construction Inspection', 'Diploma', 'English', 3000, 2, true, 'Construction Inspection', 3000, 2700),
  ('Construction Technology', 'Diploma', 'English', 3000, 2, true, 'Construction Technology', 3000, 2700),
  ('Cooking', 'Diploma', 'English', 3000, 2, true, 'Cooking', 3000, 2700),
  ('Culinary Arts', 'Diploma', 'English', 2600, 2, true, 'Culinary Arts', 10600, NULL::numeric),
  ('Cyber Security', 'Diploma', 'English', 3000, 2, true, 'Cyber Security', 3000, 2700),
  ('Dental Prosthesis', 'Diploma', 'English', 3000, 2, true, 'Dental Prosthesis', 3000, 2700),
  ('Dialysis', 'Diploma', 'English', 3000, 2, true, 'Dialysis', 3000, 2700),
  ('Electric', 'Diploma', 'English', 3000, 2, true, 'Electric', 3000, 2700),
  ('Electroneurophysiology', 'Diploma', 'English', 3000, 2, true, 'Electroneurophysiology', 3000, 2700),
  ('Electronic Technology', 'Diploma', 'English', 3000, 2, true, 'Electronic Technology', 3000, 2700),
  ('Fashion Design', 'Diploma', 'English', 3000, 2, true, 'Fashion Design', 3000, 2700),
  ('First And Emergency Aid', 'Diploma', 'English', 3000, 2, true, 'First And Emergency Aid', 3000, 2700),
  ('Flight Operations Management', 'Diploma', 'English', 3000, 2, true, 'Flight Operations Management', 3000, 2700),
  ('Food Technologies', 'Diploma', 'English', 3000, 2, true, 'Food Technologies', 3000, 2700),
  ('Graphic Design', 'Diploma', 'English', 3000, 2, true, 'Graphic Design', 3000, 2700),
  ('Hair Care And Beauty Services', 'Diploma', 'English', 3000, 2, true, 'Hair Care And Beauty Services', 3000, 2700),
  ('Human Resources Management', 'Diploma', 'English', 3000, 2, true, 'Human Resources Management', 3000, 2700),
  ('Internet And Network Technology', 'Diploma', 'Turkish', 3000, 2, true, 'Internet And Network Technology', 3000, 2700),
  ('Jewelry Design', 'Diploma', 'English', 3000, 2, true, 'Jewelry Design', 3000, 2700),
  ('Justice', 'Diploma', 'English', 2600, 2, true, 'Justice', 10600, NULL::numeric),
  ('Local Administrations', 'Diploma', 'English', 3000, 2, true, 'Local Administrations', 3000, 2700),
  ('Logistics', 'Diploma', 'English', 3000, 2, true, 'Logistics', 3000, 3000),
  ('Machinery', 'Diploma', 'English', 3000, 2, true, 'Machinery', 3000, 2700),
  ('Marketing', 'Diploma', 'English', 3000, 2, true, 'Marketing', 3000, 2700),
  ('Medical Documentation And Secretarial', 'Diploma', 'English', 3000, 2, true, 'Medical Documentation And Secretarial', 3000, 2700),
  ('Medical Imaging Techniques', 'Diploma', 'English', 3000, 2, true, 'Medical Imaging Techniques', 3000, 3000),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 3000, 2, true, 'Medical Laboratory Techniques', 3000, 2700),
  ('Office Management And Executive Assistance', 'Diploma', 'English', 3000, 2, true, 'Office Management And Executive Assistance', 3000, 2700),
  ('Operating Room Services', 'Diploma', 'English', 3000, 2, true, 'Operating Room Services', 3000, 2700),
  ('Opticianry', 'Diploma', 'English', 3000, 2, true, 'Opticianry', 3000, 2700),
  ('Opticiany', 'Diploma', 'English', 2600, 2, true, 'Opticiany', 10600, NULL::numeric),
  ('Oral And Dental Health', 'Diploma', 'English', 3000, 2, true, 'Oral And Dental Health', 3000, 2700),
  ('Orthopedic Prosthesis And Orhotics', 'Diploma', 'English', 3000, 2, true, 'Orthopedic Prosthesis And Orhotics', 3000, 2700),
  ('Pathology Laboratory Techniques', 'Diploma', 'English', 3000, 2, true, 'Pathology Laboratory Techniques', 3000, 2700),
  ('Perfusion Techniques', 'Diploma', 'English', 3000, 2, true, 'Perfusion Techniques', 3000, 2700),
  ('Physiotherapy', 'Diploma', 'English', 3000, 2, true, 'Physiotherapy', 3000, 2700),
  ('Printing And Publication Technologies', 'Diploma', 'English', 3000, 2, true, 'Printing And Publication Technologies', 3000, 2700),
  ('Public Relations And Presentation', 'Diploma', 'English', 3000, 2, true, 'Public Relations And Presentation', 3000, 2700),
  ('Radiotherapy', 'Diploma', 'English', 3000, 2, true, 'Radiotherapy', 3000, 2700),
  ('Social Services', 'Diploma', 'English', 3000, 2, true, 'Social Services', 3000, 3000),
  ('Tourism And Hotel Management', 'Diploma', 'English', 3000, 2, true, 'Tourism And Hotel Management', 3000, 2700),
  ('Uav Technologies And Operations', 'Diploma', 'English', 3000, 2, true, 'Uav Technologies And Operations', 3000, 2700),
  ('Work Health And Safety', 'Diploma', 'English', 3000, 2, true, 'Work Health And Safety', 3000, 2700),
  ('disc', 'Diploma', 'English', 2600, 2, true, 'disc', 10600, NULL::numeric),
  ('Accounting And Auditing', 'PhD', 'English', 12000, 4, true, 'Accounting And Auditing', 12000, 10800),
  ('Applied Psychology', 'PhD', 'English', 12000, 4, true, 'Applied Psychology', 12000, 10800),
  ('Arabic Language & Teaching', 'PhD', 'English', 12000, 4, true, 'Arabic Language & Teaching', 12000, 10800),
  ('Architecture', 'PhD', 'English', 12000, 4, true, 'Architecture', 12000, 10800),
  ('Audiology', 'PhD', 'English', 12000, 4, true, 'Audiology', 12000, 10800),
  ('Aydin UniversitYurkey', 'PhD', 'English', 20000, 4, true, 'Aydin UniversitYurkey', 20000, 10000),
  ('Business Administration', 'PhD', 'Turkish', 7800, 4, true, 'Business Administration', 12600, NULL::numeric),
  ('Child Development', 'PhD', 'English', 12000, 4, true, 'Child Development', 12000, 10800),
  ('Clinical Psychology', 'PhD', 'English', 15000, 4, true, 'Clinical Psychology', 15000, 13500),
  ('Electrical And Electronic Engineering', 'PhD', 'Turkish', 15000, 4, true, 'Electrical And Electronic Engineering', 15000, 13500),
  ('Endodontics', 'PhD', 'English', 20000, 4, true, 'Endodontics', 20000, 10000),
  ('English Language And Literature', 'PhD', 'Turkish', 15000, 4, true, 'English Language And Literature', 15000, 13500),
  ('English Language Teaching', 'PhD', 'Turkish', 15000, 4, true, 'English Language Teaching', 15000, 13500),
  ('Food Engineering', 'PhD', 'English', 12000, 4, true, 'Food Engineering', 12000, 10800),
  ('Food Safety', 'PhD', 'English', 12000, 4, true, 'Food Safety', 12000, 10800),
  ('Graphic Design Art Qualification', 'PhD', 'English', 12000, 4, true, 'Graphic Design Art Qualification', 12000, 6000),
  ('Medical Microbiology', 'PhD', 'English', 12000, 4, true, 'Medical Microbiology', 12000, 10800),
  ('Molecular Biology And Genetics', 'PhD', 'English', 12000, 4, true, 'Molecular Biology And Genetics', 12000, 10800),
  ('Mouth, Teeth And Jaw Surgery', 'PhD', 'English', 20000, 4, true, 'Mouth, Teeth And Jaw Surgery', 20000, 18000),
  ('Nursing', 'PhD', 'English', 7800, 4, true, 'Nursing', 12600, NULL::numeric),
  ('Nutrition And Dietetics', 'PhD', 'English', 12000, 4, true, 'Nutrition And Dietetics', 12000, 10800),
  ('Occupational Health And Safety', 'PhD', 'English', 12000, 4, true, 'Occupational Health And Safety', 12000, 10800),
  ('Orthodontics', 'PhD', 'English', 20000, 4, true, 'Orthodontics', 20000, 18000),
  ('Pedodontics', 'PhD', 'English', 20000, 4, true, 'Pedodontics', 20000, 18000),
  ('Periodontology', 'PhD', 'English', 20000, 4, true, 'Periodontology', 20000, 18000),
  ('Physical Education And Sports', 'PhD', 'English', 12000, 4, true, 'Physical Education And Sports', 12000, 6000),
  ('Physiotherapy And Rehabilitation', 'PhD', 'English', 12000, 4, true, 'Physiotherapy And Rehabilitation', 12000, 10800),
  ('Political Science And International Relations', 'PhD', 'Turkish', 15000, 4, true, 'Political Science And International Relations', 15000, 7500),
  ('Preschool Education', 'PhD', 'English', 12000, 4, true, 'Preschool Education', 12000, 10800),
  ('Private Law', 'PhD', 'English', 12000, 4, true, 'Private Law', 12000, 10800),
  ('Prosthodontics', 'PhD', 'English', 20000, 4, true, 'Prosthodontics', 20000, 10000),
  ('Psychological Counselling And Guidance', 'PhD', 'English', 7800, 4, true, 'Psychological Counselling And Guidance', 12600, NULL::numeric),
  ('Television And Cinema', 'PhD', 'English', 12000, 4, true, 'Television And Cinema', 12000, 10800),
  ('Tourism Management', 'PhD', 'English', 7800, 4, true, 'Tourism Management', 12600, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Aydın University'))
  AND p.id IS NULL;


-- Bahçeşehir University: 5 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Electrical And Electronic Engineering', 'PhD', 'Turkish', 40000, 4, true, 'Electrical And Electronic Engineering', 40000, 8500),
  ('English Language Education', 'PhD', 'Turkish', 40000, 4, true, 'English Language Education', 40000, 8500),
  ('Guidance And Counseling', 'PhD', 'English', 40000, 4, true, 'Guidance And Counseling', 40000, 3500),
  ('Management Engineering', 'PhD', 'English', 40000, 4, true, 'Management Engineering', 40000, 8500),
  ('Public Relations And Advertising', 'PhD', 'English', 40000, 4, true, 'Public Relations And Advertising', 40000, 3500)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Bahçeşehir University'))
  AND p.id IS NULL;


-- Beykent University: 57 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Anesthesia', 'Diploma', 'English', 1900, 2, true, 'Anesthesia', 2613, 1600),
  ('Applied English And Translation', 'Diploma', 'English', 1600, 2, false, 'Applied English And Translation', 2200, 1600),
  ('Architectural Restoration', 'Diploma', 'Turkish', 1600, 2, true, 'Architectural Restoration', 2200, 1600),
  ('Audiometry', 'Diploma', 'English', 1900, 2, true, 'Audiometry', 2613, 1600),
  ('Banking And Insurance', 'Diploma', 'English', 1900, 2, false, 'Banking And Insurance', 2613, 1600),
  ('Biomedical Device Technologies', 'Diploma', 'English', 1900, 2, true, 'Biomedical Device Technologies', 2613, 1600),
  ('Business Administration', 'Diploma', 'English', 1900, 2, true, 'Business Administration', 2613, 1600),
  ('Child Development', 'Diploma', 'English', 1900, 2, true, 'Child Development', 2613, 1600),
  ('Civil Aviation Cabin Services', 'Diploma', 'English', 1600, 2, true, 'Civil Aviation Cabin Services', 2200, 1600),
  ('Civil Aviation Transportation Management', 'Diploma', 'English', 1600, 2, true, 'Civil Aviation Transportation Management', 2200, 1600),
  ('Computer Programming', 'Diploma', 'English', 1900, 2, true, 'Computer Programming', 2613, 1600),
  ('Construction Technology', 'Diploma', 'English', 1600, 2, true, 'Construction Technology', 2200, 1600),
  ('Cooking', 'Diploma', 'English', 1600, 2, true, 'Cooking', 2200, 1600),
  ('Court And Office Management', 'Diploma', 'English', 1600, 2, true, 'Court And Office Management', 2200, 1600),
  ('Dental Prosthesis', 'Diploma', 'English', 1900, 2, true, 'Dental Prosthesis', 2613, 1600),
  ('Dialysis', 'Diploma', 'English', 1900, 2, true, 'Dialysis', 2613, 1600),
  ('Electric', 'Diploma', 'English', 1600, 2, true, 'Electric', 2200, 1600),
  ('Electro Neurophysiology', 'Diploma', 'English', 1900, 2, true, 'Electro Neurophysiology', 2613, 1600),
  ('Fashion Design', 'Diploma', 'English', 1600, 2, true, 'Fashion Design', 2200, 1600),
  ('First And Emergency Aid', 'Diploma', 'English', 1900, 2, true, 'First And Emergency Aid', 2613, 1600),
  ('Foreign Trade', 'Diploma', 'English', 1900, 2, true, 'Foreign Trade', 2613, 1600),
  ('Game Development and Programming', 'Diploma', 'English', 1600, 2, true, 'Game Development and Programming', 2200, 1600),
  ('Graphic Design', 'Diploma', 'English', 1600, 2, true, 'Graphic Design', 2200, 1600),
  ('Green And Ecological Building Technician', 'Diploma', 'English', 1600, 2, true, 'Green And Ecological Building Technician', 2200, 1600),
  ('Human Resources Management', 'Diploma', 'English', 1600, 2, true, 'Human Resources Management', 2200, 1600),
  ('Hybrid And Electric Vehicle Technology', 'Diploma', 'English', 1600, 2, true, 'Hybrid And Electric Vehicle Technology', 2200, 1600),
  ('Industrial Product Design', 'Diploma', 'English', 1600, 2, true, 'Industrial Product Design', 2200, 1600),
  ('Information Security Technologies', 'Diploma', 'English', 1600, 2, true, 'Information Security Technologies', 2200, 1600),
  ('Interior Design', 'Diploma', 'English', 1600, 2, true, 'Interior Design', 2200, 1600),
  ('Logistics', 'Diploma', 'English', 1600, 2, true, 'Logistics', 2200, 1600),
  ('Machinery', 'Diploma', 'English', 1600, 2, true, 'Machinery', 2200, 1600),
  ('Mechatronics', 'Diploma', 'English', 1600, 2, true, 'Mechatronics', 2200, 1600),
  ('Medical Documentation And Secretarial', 'Diploma', 'English', 1900, 2, true, 'Medical Documentation And Secretarial', 2613, 1900),
  ('Medical Imaging Techniques', 'Diploma', 'English', 1900, 2, true, 'Medical Imaging Techniques', 2613, 1900),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 1900, 2, true, 'Medical Laboratory Techniques', 2613, 1900),
  ('Natural Gas and Installation Technology', 'Diploma', 'English', 1600, 2, true, 'Natural Gas and Installation Technology', 2200, 1600),
  ('Occupational Health And Safety', 'Diploma', 'English', 1600, 2, true, 'Occupational Health And Safety', 2200, 1600),
  ('Operation Room Services (Evening Class)', 'Diploma', 'English', 1900, 2, true, 'Operation Room Services (Evening Class)', 2613, 1600),
  ('Opticianry', 'Diploma', 'English', 1900, 2, true, 'Opticianry', 2613, 1600),
  ('Oral And Dental Health', 'Diploma', 'English', 1900, 2, true, 'Oral And Dental Health', 2613, 1600),
  ('Orthopedic Prosthesis And Orhotics', 'Diploma', 'English', 1900, 2, true, 'Orthopedic Prosthesis And Orhotics', 2613, 1600),
  ('Pathology Laboratory Techniques', 'Diploma', 'English', 1900, 2, true, 'Pathology Laboratory Techniques', 2613, 1600),
  ('Pharmacy Services', 'Diploma', 'English', 1900, 2, true, 'Pharmacy Services', 2613, 1600),
  ('Physiotherapy', 'Diploma', 'English', 1900, 2, true, 'Physiotherapy', 2613, 1600),
  ('Public Relations And Advertising', 'Diploma', 'English', 1600, 2, true, 'Public Relations And Advertising', 2200, 1600),
  ('Radiotherapy', 'Diploma', 'English', 1900, 2, true, 'Radiotherapy', 2613, 1600),
  ('Tourism And Travel Services', 'Diploma', 'English', 1600, 2, true, 'Tourism And Travel Services', 2200, 1600),
  ('Water and Waste Management Technician', 'Diploma', 'English', 1600, 2, true, 'Water and Waste Management Technician', 2200, 1600),
  ('energy facilites management', 'Diploma', 'English', 1600, 2, true, 'energy facilites management', 2200, 1600),
  ('Architecture', 'PhD', 'English', 4500, 4, true, 'Architecture', 6200, 1600),
  ('Business Administration', 'PhD', 'English', 4500, 4, true, 'Business Administration', 6200, 1600),
  ('Computer Engineering', 'PhD', 'English', 4500, 4, true, 'Computer Engineering', 6200, 1600),
  ('Mathematics', 'PhD', 'English', 4500, 4, true, 'Mathematics', 6200, 1600),
  ('Media And Communication Studies', 'PhD', 'English', 4500, 4, true, 'Media And Communication Studies', 6200, 1600),
  ('Political Science And International Relations', 'PhD', 'English', 4500, 4, true, 'Political Science And International Relations', 6200, 1600),
  ('Sociology', 'PhD', 'English', 4500, 4, true, 'Sociology', 6200, 1600),
  ('Television And Cinema', 'PhD', 'English', 4500, 4, true, 'Television And Cinema', 6200, 1600)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Beykent University'))
  AND p.id IS NULL;


-- Biruni University: 28 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Anesthesia', 'Diploma', 'English', 5000, 2, true, 'Anesthesia', 5000, 4500),
  ('Biomedical Equipment Technology', 'Diploma', 'English', 5000, 2, true, 'Biomedical Equipment Technology', 5000, 4500),
  ('Child Development ( Evening Class)', 'Diploma', 'English', 5000, 2, true, 'Child Development ( Evening Class)', 5000, 4500),
  ('Computer Programming', 'Diploma', 'English', 5000, 2, true, 'Computer Programming', 5000, 4500),
  ('Dialysis', 'Diploma', 'English', 5000, 2, true, 'Dialysis', 5000, 4500),
  ('Electro Neurophysiology', 'Diploma', 'English', 5000, 2, true, 'Electro Neurophysiology', 5000, 4500),
  ('Emergency And Help Management', 'Diploma', 'English', 5000, 2, true, 'Emergency And Help Management', 5000, 4500),
  ('First And Emergency Aid', 'Diploma', 'English', 5000, 2, true, 'First And Emergency Aid', 5000, 4500),
  ('Medical Imaging Techniques', 'Diploma', 'English', 5000, 2, true, 'Medical Imaging Techniques', 5000, 4500),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 5000, 2, true, 'Medical Laboratory Techniques', 5000, 4500),
  ('Occupational Therapy', 'Diploma', 'English', 5000, 2, false, 'Occupational Therapy', 5000, 4500),
  ('Operation Room Services (Evening Class)', 'Diploma', 'English', 5000, 2, true, 'Operation Room Services (Evening Class)', 5000, 4500),
  ('Opticianry', 'Diploma', 'English', 5000, 2, true, 'Opticianry', 5000, 4500),
  ('Oral And Dental Health', 'Diploma', 'English', 5000, 2, true, 'Oral And Dental Health', 5000, 4500),
  ('Patalogical Laboratory Techniques', 'Diploma', 'English', 5000, 2, true, 'Patalogical Laboratory Techniques', 5000, 4500),
  ('Pharmacy Services', 'Diploma', 'English', 5000, 2, true, 'Pharmacy Services', 5000, 4500),
  ('Physiotherapy', 'Diploma', 'English', 5000, 2, true, 'Physiotherapy', 5000, 4500),
  ('Radiotherapy', 'Diploma', 'English', 5000, 2, true, 'Radiotherapy', 5000, 2026),
  ('Robotics and Artificial Intelligence', 'Diploma', 'English', 5000, 2, true, 'Robotics and Artificial Intelligence', 5000, 4500),
  ('Drug Design and Development', 'PhD', 'English', 4500, 4, true, 'Drug Design and Development', 5000, NULL::numeric),
  ('Endodontics', 'PhD', 'English', 4500, 4, true, 'Endodontics', 5000, NULL::numeric),
  ('Ergotherapy', 'PhD', 'English', 4500, 4, true, 'Ergotherapy', 5000, NULL::numeric),
  ('Molecular Biology And Genetics', 'PhD', 'English', 4500, 4, true, 'Molecular Biology And Genetics', 5000, NULL::numeric),
  ('Obstetrics And Gynecologic Nursing', 'PhD', 'English', 4500, 4, true, 'Obstetrics And Gynecologic Nursing', 5000, NULL::numeric),
  ('Orthodontics', 'PhD', 'English', 13500, 4, true, 'Orthodontics', 15000, NULL::numeric),
  ('Periodontology', 'PhD', 'English', 10800, 4, true, 'Periodontology', 12000, NULL::numeric),
  ('Physiotherapy And Rehabilitation', 'PhD', 'English', 4500, 4, true, 'Physiotherapy And Rehabilitation', 5000, NULL::numeric),
  ('Prosthetic Dentistry', 'PhD', 'English', 10800, 4, true, 'Prosthetic Dentistry', 12000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Biruni University'))
  AND p.id IS NULL;


-- Fatih Sultan Mehmet University: 10 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'PhD', 'English', 6500, 4, true, 'Architecture', 11000, NULL::numeric),
  ('Clinical Psychology', 'PhD', 'English', 6500, 4, true, 'Clinical Psychology', 11000, NULL::numeric),
  ('Computer Engineering', 'PhD', 'English', 6500, 4, true, 'Computer Engineering', 11000, NULL::numeric),
  ('Graphic Design', 'PhD', 'English', 4500, 4, true, 'Graphic Design', 9000, NULL::numeric),
  ('History', 'PhD', 'English', 4500, 4, true, 'History', 9000, NULL::numeric),
  ('History Of Islamic Science', 'PhD', 'English', 4500, 4, true, 'History Of Islamic Science', 9000, NULL::numeric),
  ('Interior Architecture', 'PhD', 'English', 4500, 4, true, 'Interior Architecture', 9000, NULL::numeric),
  ('Preschool Education', 'PhD', 'English', 4500, 4, true, 'Preschool Education', 9000, NULL::numeric),
  ('Psychological Counselling And Guidance', 'PhD', 'English', 4500, 4, true, 'Psychological Counselling And Guidance', 9000, NULL::numeric),
  ('Turkish Language And Literature', 'PhD', 'English', 4500, 4, true, 'Turkish Language And Literature', 9000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Fatih Sultan Mehmet University'))
  AND p.id IS NULL;


-- Fenerbahçe University: 15 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Anesthesia', 'Diploma', 'English', 2400, 2, true, 'Anesthesia', 4800, 2160),
  ('Dent Prosthesis', 'Diploma', 'English', 2400, 2, true, 'Dent Prosthesis', 4800, 2160),
  ('Dialysis', 'Diploma', 'English', 2400, 2, true, 'Dialysis', 4800, 2160),
  ('First And Emergency Aid', 'Diploma', 'English', 2400, 2, true, 'First And Emergency Aid', 4800, 2160),
  ('Medical Data Processing Technician', 'Diploma', 'English', 2400, 2, true, 'Medical Data Processing Technician', 4800, 2160),
  ('Medical Imaging Techniques', 'Diploma', 'English', 2400, 2, true, 'Medical Imaging Techniques', 4800, 2160),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 2400, 2, true, 'Medical Laboratory Techniques', 4800, 2160),
  ('Operating Room Services', 'Diploma', 'English', 2400, 2, true, 'Operating Room Services', 4800, 2160),
  ('Oral And Dental Health', 'Diploma', 'English', 2400, 2, true, 'Oral And Dental Health', 4800, 2160),
  ('Orthopedic Prosthesis And Orhotics', 'Diploma', 'English', 2400, 2, true, 'Orthopedic Prosthesis And Orhotics', 4800, 2160),
  ('Pathology Laboratory Techniques', 'Diploma', 'English', 2400, 2, true, 'Pathology Laboratory Techniques', 4800, 2160),
  ('Pharmacy Services', 'Diploma', 'English', 2400, 2, true, 'Pharmacy Services', 4800, 2160),
  ('Radiation Therapy', 'Diploma', 'English', 2400, 2, true, 'Radiation Therapy', 4800, 2160),
  ('Business Administration', 'PhD', 'English', 7500, 4, true, 'Business Administration', 15000, NULL::numeric),
  ('Sports Sciences', 'PhD', 'English', 7500, 4, true, 'Sports Sciences', 15000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND p.id IS NULL;


-- KSTU University: 9 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Oral And Dental Health', 'Diploma', 'English', 2000, 2, true, 'Oral And Dental Health', 2000, 2026),
  ('Clinical Psychology', 'PhD', 'English', 12000, 4, true, 'Clinical Psychology', 12000, 2026),
  ('Education Management And Planning', 'PhD', 'English', 8000, 4, true, 'Education Management And Planning', 8000, 2026),
  ('KSTU UniversitiZyprus', 'PhD', 'Turkish', 60000, 4, true, 'KSTU UniversitiZyprus', 60000, NULL::numeric),
  ('Oral And Maxillofacial Surgery', 'PhD', 'Turkish', 60000, 4, true, 'Oral And Maxillofacial Surgery', 60000, 2026),
  ('Pedodontics', 'PhD', 'English', 32000, 4, true, 'Pedodontics', 32000, 2026),
  ('Periodontology', 'PhD', 'English', 32000, 4, true, 'Periodontology', 32000, 2026),
  ('Physiotherapy And Rehabilitation', 'PhD', 'English', 8000, 4, true, 'Physiotherapy And Rehabilitation', 8000, NULL::numeric),
  ('Prosthodontic Treatment', 'PhD', 'English', 32000, 4, true, 'Prosthodontic Treatment', 32000, 2026)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND p.id IS NULL;


-- Kent University: 5 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Business Administration', 'PhD', 'English', 7000, 4, true, 'Business Administration', 7000, 1080),
  ('Gastronomy And Culinary Arts', 'PhD', 'English', 4000, 4, true, 'Gastronomy And Culinary Arts', 6000, 1080),
  ('Oral, Dental And Maxillofacial Surgery', 'PhD', 'English', 29750, 4, true, 'Oral, Dental And Maxillofacial Surgery', 35000, 1080),
  ('Orthodontics', 'PhD', 'English', 20000, 4, true, 'Orthodontics', 25000, 1080),
  ('Restorative Dentistry', 'PhD', 'English', 20000, 4, true, 'Restorative Dentistry', 25000, 1080)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Kent University'))
  AND p.id IS NULL;


-- Kyrenia University: 1 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Allergy And Immunology', 'PhD', 'Turkish', 1510, 4, true, 'Allergy And Immunology', 1510, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND p.id IS NULL;


-- Medipol University: 37 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Accounting And Tax Applications', 'Diploma', 'English', 3250, 2, true, 'Accounting And Tax Applications', 3250, 2925),
  ('Applied English And Translation', 'Diploma', 'English', 3250, 2, true, 'Applied English And Translation', 3250, 2925),
  ('Architectural Restoration', 'Diploma', 'English', 3250, 2, true, 'Architectural Restoration', 3250, 2925),
  ('Audiometry', 'Diploma', 'English', 3250, 2, true, 'Audiometry', 3250, 2925),
  ('Banking And Insurance', 'Diploma', 'English', 3250, 2, true, 'Banking And Insurance', 3250, 2925),
  ('Biomedical Device Technologies', 'Diploma', 'English', 3250, 2, true, 'Biomedical Device Technologies', 3250, 2925),
  ('Business Administration', 'Diploma', 'English', 3250, 2, true, 'Business Administration', 3250, 1390),
  ('Child Development', 'Diploma', 'English', 3250, 2, true, 'Child Development', 3250, 1390),
  ('Civil Aviation Cabin Services', 'Diploma', 'English', 3250, 2, true, 'Civil Aviation Cabin Services', 3250, 1390),
  ('Civil Aviation Transportation Management', 'Diploma', 'English', 3250, 2, true, 'Civil Aviation Transportation Management', 3250, 1390),
  ('Construction Technology', 'Diploma', 'English', 3250, 2, true, 'Construction Technology', 3250, 1390),
  ('Cyber Secunty', 'Diploma', 'Turkish', 3500, 2, true, 'Cyber Secunty', 3500, 3150),
  ('Dialysis', 'Diploma', 'English', 3250, 2, true, 'Dialysis', 3250, 2925),
  ('Electroneurophysiology', 'Diploma', 'English', 3250, 2, true, 'Electroneurophysiology', 3250, 1390),
  ('Finance', 'Diploma', 'English', 3250, 2, true, 'Finance', 3250, 2925),
  ('Foreign Trade', 'Diploma', 'English', 3250, 2, true, 'Foreign Trade', 3250, 2925),
  ('Human Resources Management', 'Diploma', 'English', 3250, 2, true, 'Human Resources Management', 3250, 2925),
  ('Interior Design', 'Diploma', 'English', 3250, 2, true, 'Interior Design', 3250, 2925),
  ('Justice', 'Diploma', 'English', 3250, 2, true, 'Justice', 3250, 2925),
  ('Logistics', 'Diploma', 'English', 3250, 2, true, 'Logistics', 3250, 2925),
  ('Management Of Health Lnstitutions', 'Diploma', 'English', 3250, 2, true, 'Management Of Health Lnstitutions', 3250, 2925),
  ('Medical Documentation And Secretarial', 'Diploma', 'English', 3250, 2, true, 'Medical Documentation And Secretarial', 3250, 2925),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 3250, 2, true, 'Medical Laboratory Techniques', 3250, 1390),
  ('Medipol Universit yurkey', 'Diploma', 'Turkish', 3500, 2, true, 'Medipol Universit yurkey', 3500, 3150),
  ('Occupational Health And Safety', 'Diploma', 'English', 3250, 2, true, 'Occupational Health And Safety', 3250, 2925),
  ('Operating Room Services', 'Diploma', 'English', 3250, 2, true, 'Operating Room Services', 3250, 2925),
  ('Opticiany', 'Diploma', 'English', 3250, 2, true, 'Opticiany', 3250, 2925),
  ('Oral And Dental Health', 'Diploma', 'English', 3250, 2, true, 'Oral And Dental Health', 3250, 2925),
  ('Pathology Laboratory Techniques', 'Diploma', 'English', 3250, 2, true, 'Pathology Laboratory Techniques', 3250, 2925),
  ('Pharmacy Services', 'Diploma', 'English', 3250, 2, true, 'Pharmacy Services', 3250, 1390),
  ('Physiotherapy', 'Diploma', 'English', 3500, 2, true, 'Physiotherapy', 3500, 3150),
  ('Public Relations And Publicity', 'Diploma', 'English', 3250, 2, true, 'Public Relations And Publicity', 3250, 2925),
  ('Radio And Television Programming', 'Diploma', 'English', 3250, 2, true, 'Radio And Television Programming', 3250, 2925),
  ('Radiotherapy', 'Diploma', 'English', 3250, 2, true, 'Radiotherapy', 3250, 2925),
  ('Robotics and Artificial Intelligence', 'Diploma', 'Turkish', 3500, 2, true, 'Robotics and Artificial Intelligence', 3500, 3150),
  ('Social Services', 'Diploma', 'English', 3250, 2, true, 'Social Services', 3250, 2925),
  ('Sports Management', 'Diploma', 'English', 3250, 2, true, 'Sports Management', 3250, 2925)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Medipol University'))
  AND p.id IS NULL;


-- Near East University: 65 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Allergy And Immunology', 'PhD', 'Turkish', 62377, 4, true, 'Allergy And Immunology', 2377, 2026),
  ('Animal Nutrition And Nutritional Diseases', 'PhD', 'Turkish', 2377, 4, true, 'Animal Nutrition And Nutritional Diseases', 2377, NULL::numeric),
  ('Arts And Design', 'PhD', 'English', 1510, 4, true, 'Arts And Design', 1510, NULL::numeric),
  ('Banking And Finance', 'PhD', 'Turkish', 1510, 4, true, 'Banking And Finance', 1510, NULL::numeric),
  ('Biochemistry', 'PhD', 'English', 1510, 4, true, 'Biochemistry', 1510, NULL::numeric),
  ('Biomedical Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Biomedical Engineering', 1510, NULL::numeric),
  ('Business Administration', 'PhD', 'Turkish', 1510, 4, true, 'Business Administration', 1510, NULL::numeric),
  ('Child Health And Diseases Nursing', 'PhD', 'English', 1510, 4, true, 'Child Health And Diseases Nursing', 1510, NULL::numeric),
  ('Civil Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Civil Engineering', 1510, NULL::numeric),
  ('Computer Information Systems', 'PhD', 'Turkish', 1510, 4, true, 'Computer Information Systems', 1510, NULL::numeric),
  ('Department of Surgery', 'PhD', 'Turkish', 62377, 4, true, 'Department of Surgery', 2377, NULL::numeric),
  ('Economics', 'PhD', 'Turkish', 1510, 4, true, 'Economics', 1510, NULL::numeric),
  ('Educational Administration, Supervision And Planning', 'PhD', 'English', 1510, 4, true, 'Educational Administration, Supervision And Planning', 1510, NULL::numeric),
  ('Electrical And Electronic Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Electrical And Electronic Engineering', 1510, NULL::numeric),
  ('Endodontics', 'PhD', 'English', 2377, 4, true, 'Endodontics', 2377, NULL::numeric),
  ('English Language Teaching', 'PhD', 'Turkish', 1510, 4, true, 'English Language Teaching', 1510, NULL::numeric),
  ('Folklore Education', 'PhD', 'English', 1510, 4, true, 'Folklore Education', 1510, NULL::numeric),
  ('Food Hygiene And Technology', 'PhD', 'Turkish', 2377, 4, true, 'Food Hygiene And Technology', 2377, NULL::numeric),
  ('Fundamentals Of Nursing And Nursing Adminis', 'PhD', 'English', 1510, 4, true, 'Fundamentals Of Nursing And Nursing Adminis', 1510, NULL::numeric),
  ('Graphic Design', 'PhD', 'English', 1510, 4, true, 'Graphic Design', 1510, NULL::numeric),
  ('Health Institutions Management', 'PhD', 'English', 1510, 4, true, 'Health Institutions Management', 1510, NULL::numeric),
  ('Histology And Embryology', 'PhD', 'English', 2377, 4, true, 'Histology And Embryology', 2377, NULL::numeric),
  ('History Teaching', 'PhD', 'English', 1510, 4, true, 'History Teaching', 1510, NULL::numeric),
  ('Information Systems Engineering', 'PhD', 'English', 1510, 4, true, 'Information Systems Engineering', 1510, NULL::numeric),
  ('Innovation And Knowledge Management', 'PhD', 'Turkish', 1510, 4, true, 'Innovation And Knowledge Management', 1510, 2026),
  ('Interior Architecture', 'PhD', 'Turkish', 1510, 4, true, 'Interior Architecture', 1510, NULL::numeric),
  ('Internal Medicine Nursing', 'PhD', 'English', 1510, 4, true, 'Internal Medicine Nursing', 1510, NULL::numeric),
  ('International Law', 'PhD', 'Turkish', 1510, 4, true, 'International Law', 1510, NULL::numeric),
  ('Mathematics', 'PhD', 'Turkish', 1510, 4, true, 'Mathematics', 1510, NULL::numeric),
  ('Mechanical Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Mechanical Engineering', 1510, NULL::numeric),
  ('Media And Communication Studies', 'PhD', 'English', 1510, 4, true, 'Media And Communication Studies', 1510, NULL::numeric),
  ('Medical Biochemistry', 'PhD', 'Turkish', 1510, 4, true, 'Medical Biochemistry', 1510, NULL::numeric),
  ('Medical Biology And Genetics', 'PhD', 'Turkish', 2377, 4, true, 'Medical Biology And Genetics', 2377, NULL::numeric),
  ('Medical Microbiology And Clinical Microbiolog!', 'PhD', 'Turkish', 2377, 4, true, 'Medical Microbiology And Clinical Microbiolog!', 2377, NULL::numeric),
  ('Medical Microbiology And Clinical Microbiology', 'PhD', 'Turkish', 2377, 4, true, 'Medical Microbiology And Clinical Microbiology', 2377, NULL::numeric),
  ('Molecular Biology And Genetics', 'PhD', 'Turkish', 2377, 4, true, 'Molecular Biology And Genetics', 2377, NULL::numeric),
  ('Music', 'PhD', 'English', 1510, 4, true, 'Music', 1510, 2026),
  ('Near East UniversitE yprus', 'PhD', 'English', 1510, 4, true, 'Near East UniversitE yprus', 1510, NULL::numeric),
  ('Near East UniversitEyprus', 'PhD', 'English', 2377, 4, true, 'Near East UniversitEyprus', 2377, NULL::numeric),
  ('Near East UniversitiZyprus', 'PhD', 'English', 2377, 4, true, 'Near East UniversitiZyprus', 2377, NULL::numeric),
  ('Nutrition And Dietetics', 'PhD', 'English', 1510, 4, true, 'Nutrition And Dietetics', 1510, NULL::numeric),
  ('Obstetrics And Gynecologic Nursing', 'PhD', 'English', 1510, 4, true, 'Obstetrics And Gynecologic Nursing', 1510, NULL::numeric),
  ('Obstetrics And Gynecology', 'PhD', 'Turkish', 2377, 4, true, 'Obstetrics And Gynecology', 2377, NULL::numeric),
  ('Oral And Maxillofacial Radiology', 'PhD', 'English', 2377, 4, true, 'Oral And Maxillofacial Radiology', 2377, NULL::numeric),
  ('Oral And Maxillofacial Surgery', 'PhD', 'English', 2377, 4, true, 'Oral And Maxillofacial Surgery', 2377, NULL::numeric),
  ('Orthodontics', 'PhD', 'English', 2377, 4, true, 'Orthodontics', 2377, NULL::numeric),
  ('Pedodontics', 'PhD', 'English', 62377, 4, true, 'Pedodontics', 2377, NULL::numeric),
  ('Periodontology', 'PhD', 'English', 2377, 4, true, 'Periodontology', 2377, NULL::numeric),
  ('Petrol And Natural Gas Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Petrol And Natural Gas Engineering', 1510, NULL::numeric),
  ('Pharmaceutical Botany', 'PhD', 'Turkish', 2377, 4, true, 'Pharmaceutical Botany', 2377, NULL::numeric),
  ('Pharmaceutical Chimistry', 'PhD', 'Turkish', 2377, 4, true, 'Pharmaceutical Chimistry', 2377, NULL::numeric),
  ('Physical Education And Sports', 'PhD', 'English', 1510, 4, true, 'Physical Education And Sports', 1510, NULL::numeric),
  ('Physics Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Physics Engineering', 1510, NULL::numeric),
  ('Physiology', 'PhD', 'English', 2377, 4, true, 'Physiology', 2377, NULL::numeric),
  ('Physiotherapy And Rehabilitation', 'PhD', 'English', 1510, 4, true, 'Physiotherapy And Rehabilitation', 1510, NULL::numeric),
  ('Phytotherapy', 'PhD', 'Turkish', 2377, 4, true, 'Phytotherapy', 2377, NULL::numeric),
  ('Political Science And International Relations', 'PhD', 'Turkish', 1510, 4, true, 'Political Science And International Relations', 1510, NULL::numeric),
  ('Private Law', 'PhD', 'English', 1510, 4, true, 'Private Law', 1510, NULL::numeric),
  ('Prosthodontics', 'PhD', 'English', 2377, 4, true, 'Prosthodontics', 2377, NULL::numeric),
  ('Restorative Dentistry', 'PhD', 'English', 2377, 4, true, 'Restorative Dentistry', 2377, NULL::numeric),
  ('Software Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Software Engineering', 1510, NULL::numeric),
  ('Surgical Nursing', 'PhD', 'English', 1510, 4, true, 'Surgical Nursing', 1510, NULL::numeric),
  ('Veterinary Internal Medicine', 'PhD', 'Turkish', 2377, 4, true, 'Veterinary Internal Medicine', 62377, NULL::numeric),
  ('Veterinary Microbiology', 'PhD', 'Turkish', 2377, 4, true, 'Veterinary Microbiology', 2377, NULL::numeric),
  ('Zoo Techniques', 'PhD', 'English', 2377, 4, true, 'Zoo Techniques', 2377, 2026)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Near East University'))
  AND p.id IS NULL;


-- Nişantaşı University: 56 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Accounting And Tax Applications', 'Diploma', 'English', 1600, 2, true, 'Accounting And Tax Applications', 1600, 1800),
  ('Aircraft Technology', 'Diploma', 'English', 1600, 2, true, 'Aircraft Technology', 1600, 1800),
  ('Anesthesia', 'Diploma', 'English', 1950, 2, true, 'Anesthesia', 1950, 1800),
  ('Audiometry', 'Diploma', 'English', 1950, 2, true, 'Audiometry', 1950, 1800),
  ('Automotive Technology', 'Diploma', 'English', 1600, 2, true, 'Automotive Technology', 1600, 1800),
  ('Banking And Insurance', 'Diploma', 'English', 1600, 2, true, 'Banking And Insurance', 1600, 1800),
  ('Biomedical Device Technologies', 'Diploma', 'English', 1950, 2, true, 'Biomedical Device Technologies', 1950, 1800),
  ('Business Administration', 'Diploma', 'English', 1950, 2, true, 'Business Administration', 1950, 1800),
  ('Child Development', 'Diploma', 'English', 1950, 2, true, 'Child Development', 1950, 1800),
  ('Civil Aviation Cabin Services', 'Diploma', 'English', 1950, 2, true, 'Civil Aviation Cabin Services', 1950, 1800),
  ('Civil Aviation Management', 'Diploma', 'English', 1950, 2, true, 'Civil Aviation Management', 1950, 1800),
  ('Computer Programming', 'Diploma', 'English', 1950, 2, true, 'Computer Programming', 1950, 1800),
  ('Construction Technology', 'Diploma', 'English', 1600, 2, true, 'Construction Technology', 1600, 1800),
  ('Court Office Services:', 'Diploma', 'English', 1600, 2, true, 'Court Office Services:', 1600, 1800),
  ('Dental Prosthesis', 'Diploma', 'English', 1950, 2, true, 'Dental Prosthesis', 1950, 1800),
  ('Dialysis', 'Diploma', 'English', 1950, 2, true, 'Dialysis', 1950, 1800),
  ('Digital Health Services Technician', 'Diploma', 'English', 1950, 2, true, 'Digital Health Services Technician', 1950, 1800),
  ('Electric', 'Diploma', 'English', 1600, 2, true, 'Electric', 1600, 1800),
  ('Electro Neurophysiology', 'Diploma', 'English', 1950, 2, true, 'Electro Neurophysiology', 1950, 1800),
  ('Electronics technology', 'Diploma', 'English', 1600, 2, true, 'Electronics technology', 1600, 1800),
  ('Fashion Design', 'Diploma', 'English', 1950, 2, true, 'Fashion Design', 1950, 1800),
  ('First And Emergency Aid', 'Diploma', 'English', 1950, 2, true, 'First And Emergency Aid', 1950, 1800),
  ('Foreign Trade', 'Diploma', 'English', 1950, 2, true, 'Foreign Trade', 1950, 1800),
  ('Green And Ecological Building Technician', 'Diploma', 'English', 1600, 2, true, 'Green And Ecological Building Technician', 1600, 1800),
  ('Interior Design', 'Diploma', 'English', 1950, 2, true, 'Interior Design', 1950, 1800),
  ('Internet And Network Technology', 'Diploma', 'English', 1950, 2, true, 'Internet And Network Technology', 1950, 1800),
  ('Justice', 'Diploma', 'English', 1900, 2, true, 'Justice', 1900, 1800),
  ('Logistics', 'Diploma', 'English', 1950, 2, true, 'Logistics', 1950, 1800),
  ('Machinery', 'Diploma', 'English', 1600, 2, true, 'Machinery', 1600, 1800),
  ('Marina And Yacht Management', 'Diploma', 'English', 1600, 2, true, 'Marina And Yacht Management', 1600, 1800),
  ('Maritime Transport And Business', 'Diploma', 'English', 1600, 2, true, 'Maritime Transport And Business', 1600, 1800),
  ('Maritime Transportation Management', 'Diploma', 'English', 1600, 2, true, 'Maritime Transportation Management', 1600, 1800),
  ('Mechatronics', 'Diploma', 'English', 1600, 2, true, 'Mechatronics', 1600, 1800),
  ('Medical Data Processing Technician', 'Diploma', 'English', 1950, 2, true, 'Medical Data Processing Technician', 1950, 1800),
  ('Medical Documentation And Secretariat', 'Diploma', 'English', 1950, 2, true, 'Medical Documentation And Secretariat', 1950, 1800),
  ('Medical Imaging Techniques', 'Diploma', 'English', 1950, 2, true, 'Medical Imaging Techniques', 1950, 1800),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 1950, 2, true, 'Medical Laboratory Techniques', 1950, 1800),
  ('Occupational Health And Safety', 'Diploma', 'English', 1950, 2, true, 'Occupational Health And Safety', 1950, 1800),
  ('Opticianry', 'Diploma', 'English', 1950, 2, true, 'Opticianry', 1950, 1800),
  ('Oral And Dental Health', 'Diploma', 'English', 1950, 2, true, 'Oral And Dental Health', 1950, 1800),
  ('Orthopedic Prosthesis And Orhotics', 'Diploma', 'English', 1950, 2, true, 'Orthopedic Prosthesis And Orhotics', 1950, 1800),
  ('Pharmacy Services', 'Diploma', 'English', 1950, 2, true, 'Pharmacy Services', 1950, 1800),
  ('Photography And Cameraman Ship', 'Diploma', 'English', 1600, 2, true, 'Photography And Cameraman Ship', 1600, 1800),
  ('Physiotherapy', 'Diploma', 'English', 1950, 2, true, 'Physiotherapy', 1950, 1800),
  ('Public Relations And Promotion', 'Diploma', 'English', 1950, 2, true, 'Public Relations And Promotion', 1950, 1800),
  ('Radiotherapy', 'Diploma', 'English', 1950, 2, true, 'Radiotherapy', 1950, 1800),
  ('Social Services', 'Diploma', 'English', 1950, 2, true, 'Social Services', 1950, 1800),
  ('Software Development', 'Diploma', 'English', 1950, 2, true, 'Software Development', 1950, 1800),
  ('Tour Guide Training', 'Diploma', 'English', 1950, 2, true, 'Tour Guide Training', 1950, 1800),
  ('Tourism And Hotel Management', 'Diploma', 'English', 1950, 2, true, 'Tourism And Hotel Management', 1950, 1800),
  ('Unmanned Aerial Vehicle Technology', 'Diploma', 'English', 1950, 2, true, 'Unmanned Aerial Vehicle Technology', 1950, 1800),
  ('Business Administration', 'PhD', 'Turkish', 6000, 4, true, 'Business Administration', 6000, NULL::numeric),
  ('Business Management', 'PhD', 'English', 6000, 4, true, 'Business Management', 6000, NULL::numeric),
  ('Finance And Banking', 'PhD', 'English', 6000, 4, true, 'Finance And Banking', 6000, NULL::numeric),
  ('Movement And Exercise Sciences', 'PhD', 'English', 6000, 4, true, 'Movement And Exercise Sciences', 6000, NULL::numeric),
  ('Political Science And International Relations', 'PhD', 'Turkish', 6000, 4, true, 'Political Science And International Relations', 6000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND p.id IS NULL;


-- Okan University: 64 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'CombinedPhD', 'English', 15000, 4, true, 'Architecture', 15000, NULL::numeric),
  ('Business', 'CombinedPhD', 'English', 15000, 5, true, 'Business', 15000, 14250),
  ('Accounting And Tax Applications', 'Diploma', 'English', 2250, 2, true, 'Accounting And Tax Applications', 2250, 2137),
  ('Architectural Restoration', 'Diploma', 'English', 2250, 2, true, 'Architectural Restoration', 2250, 2137),
  ('Artificial Intelligence Operation', 'Diploma', 'English', 2250, 2, true, 'Artificial Intelligence Operation', 2250, 2137),
  ('Banking And Insurance', 'Diploma', 'English', 2250, 2, true, 'Banking And Insurance', 2250, 2137),
  ('Business Administration', 'Diploma', 'English', 2250, 2, true, 'Business Administration', 2250, 2137),
  ('Child Development', 'Diploma', 'English', 2250, 2, true, 'Child Development', 2250, 2137),
  ('Civil Aviation Cabin Services', 'Diploma', 'English', 2250, 2, true, 'Civil Aviation Cabin Services', 2250, 2137),
  ('Cloud Computing Operation', 'Diploma', 'English', 2250, 2, true, 'Cloud Computing Operation', 2250, 2137),
  ('Computer Aided Design And Animation', 'Diploma', 'English', 2250, 2, false, 'Computer Aided Design And Animation', 2250, 2137),
  ('Computer Programming', 'Diploma', 'English', 2250, 2, true, 'Computer Programming', 2250, 2137),
  ('Construction Equipment Operations', 'Diploma', 'English', 2250, 2, true, 'Construction Equipment Operations', 2250, 2137),
  ('Construction Technology', 'Diploma', 'English', 2250, 2, true, 'Construction Technology', 2250, 2137),
  ('Control and Automation Technology', 'Diploma', 'English', 2250, 2, false, 'Control and Automation Technology', 2250, 2137),
  ('Court And Office Management', 'Diploma', 'English', 2250, 2, false, 'Court And Office Management', 2250, 2137),
  ('Dialysis', 'Diploma', 'English', 2250, 2, true, 'Dialysis', 2250, 2137),
  ('Digital Health Services Technician', 'Diploma', 'English', 2250, 2, false, 'Digital Health Services Technician', 2250, 2137),
  ('Digital Transformation Electronics', 'Diploma', 'English', 2250, 2, true, 'Digital Transformation Electronics', 2250, 2137),
  ('E-Commerce And Marketing', 'Diploma', 'English', 2250, 2, true, 'E-Commerce And Marketing', 2250, 2137),
  ('Elderly Care Services', 'Diploma', 'English', 2250, 2, true, 'Elderly Care Services', 2250, 2137),
  ('Electric', 'Diploma', 'English', 2250, 2, true, 'Electric', 2250, 2137),
  ('Electroneurophysiology', 'Diploma', 'English', 2250, 2, true, 'Electroneurophysiology', 2250, 2137),
  ('Electronic Technology', 'Diploma', 'English', 2250, 2, true, 'Electronic Technology', 2250, 2137),
  ('First And Emergency Aid', 'Diploma', 'English', 2250, 2, true, 'First And Emergency Aid', 2250, 2137),
  ('Flight Operations Management', 'Diploma', 'English', 2250, 2, true, 'Flight Operations Management', 2250, 2137),
  ('Human Resources Management', 'Diploma', 'English', 2250, 2, false, 'Human Resources Management', 2250, 2137),
  ('Interior Design', 'Diploma', 'English', 2250, 2, true, 'Interior Design', 2250, 2137),
  ('Logistics', 'Diploma', 'English', 2250, 2, true, 'Logistics', 2250, 2137),
  ('Machinery', 'Diploma', 'English', 2250, 2, true, 'Machinery', 2250, 2137),
  ('Mechatronics', 'Diploma', 'English', 2250, 2, true, 'Mechatronics', 2250, 2137),
  ('Medical Imaging Techniques', 'Diploma', 'English', 2250, 2, true, 'Medical Imaging Techniques', 2250, 2137),
  ('Medical Laboratory Techniques', 'Diploma', 'English', 2250, 2, true, 'Medical Laboratory Techniques', 2250, 2137),
  ('Mobile Technologies', 'Diploma', 'English', 2250, 2, true, 'Mobile Technologies', 2250, 2137),
  ('Natural Gas and Installation Technology', 'Diploma', 'English', 2250, 2, true, 'Natural Gas and Installation Technology', 2250, 2137),
  ('Occupational Health And Safety', 'Diploma', 'English', 2250, 2, true, 'Occupational Health And Safety', 2250, 2137),
  ('Occupational Health And Safety ( Evening Clas', 'Diploma', 'English', 2250, 2, false, 'Occupational Health And Safety ( Evening Clas', 2250, 2137),
  ('Operating Room Services', 'Diploma', 'English', 2137, 2, true, 'Operating Room Services', 2250, NULL::numeric),
  ('Opticianry', 'Diploma', 'English', 2250, 2, true, 'Opticianry', 2250, 2137),
  ('Oral And Dental Health', 'Diploma', 'English', 2250, 2, true, 'Oral And Dental Health', 2250, 2137),
  ('Pathology Laboratory Techniques', 'Diploma', 'English', 2250, 2, true, 'Pathology Laboratory Techniques', 2250, 2137),
  ('Radiotherapy', 'Diploma', 'English', 2250, 2, true, 'Radiotherapy', 2250, 2137),
  ('Sports Management', 'Diploma', 'English', 2250, 2, true, 'Sports Management', 2250, 2137),
  ('Surgery Services', 'Diploma', 'English', 2250, 2, true, 'Surgery Services', 2250, 2137),
  ('Web Design And Development', 'Diploma', 'English', 2250, 2, true, 'Web Design And Development', 2250, 2137),
  ('Accounting And Auditing', 'PhD', 'English', 7000, 4, true, 'Accounting And Auditing', 7000, 6650),
  ('Applied Psychology', 'PhD', 'English', 7000, 4, true, 'Applied Psychology', 7000, 6650),
  ('Banking', 'PhD', 'English', 7000, 4, true, 'Banking', 7000, 6650),
  ('Computer Engineering', 'PhD', 'English', 7000, 4, true, 'Computer Engineering', 7000, 6650),
  ('Educational Administration, Supervision And Pl', 'PhD', 'English', 7000, 4, true, 'Educational Administration, Supervision And Pl', 7000, 6650),
  ('Educational Administration, Supervision And Planning', 'PhD', 'English', 7000, 4, true, 'Educational Administration, Supervision And Planning', 7000, 6650),
  ('Endodontics', 'PhD', 'English', 15000, 4, true, 'Endodontics', 15000, 2500),
  ('Health Management', 'PhD', 'English', 7000, 4, true, 'Health Management', 7000, 6650),
  ('Land Planning and Management', 'PhD', 'English', 7000, 4, true, 'Land Planning and Management', 7000, 6650),
  ('Mechatronics Engineering', 'PhD', 'Turkish', 9000, 4, true, 'Mechatronics Engineering', 9000, 8550),
  ('Music', 'PhD', 'English', 7000, 4, true, 'Music', 7000, 6650),
  ('Nursing', 'PhD', 'English', 7000, 4, true, 'Nursing', 7000, 2500),
  ('Nutnition And Dietetics', 'PhD', 'English', 7000, 4, true, 'Nutnition And Dietetics', 7000, 6650),
  ('Nutrition And Dietetics', 'PhD', 'English', 7000, 4, true, 'Nutrition And Dietetics', 7000, 6650),
  ('Orthodontics', 'PhD', 'English', 15000, 4, true, 'Orthodontics', 15000, 2500),
  ('Periodontology', 'PhD', 'English', 15000, 4, true, 'Periodontology', 15000, 2500),
  ('Private Law', 'PhD', 'English', 7000, 4, true, 'Private Law', 7000, 6650),
  ('Public Law', 'PhD', 'English', 7000, 4, true, 'Public Law', 7000, 6650),
  ('Television And Cinema', 'PhD', 'English', 7000, 4, true, 'Television And Cinema', 7000, 6650)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Okan University'))
  AND p.id IS NULL;


-- Üsküdar University: 35 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Anesthesia', 'Diploma', 'English', 2800, 2, true, 'Anesthesia', 2800, 2660),
  ('Audiometry', 'Diploma', 'English', 2800, 2, true, 'Audiometry', 2800, 2660),
  ('Autopsy Assistantship', 'Diploma', 'English', 2800, 2, true, 'Autopsy Assistantship', 2800, 2660),
  ('Biomedical Device Technologies', 'Diploma', 'English', 2800, 2, true, 'Biomedical Device Technologies', 2800, 2660),
  ('Care And Rehabilitation Of People With Disabil', 'Diploma', 'English', 2800, 2, true, 'Care And Rehabilitation Of People With Disabil', 2800, 2660),
  ('Child Development', 'Diploma', 'English', 3500, 2, true, 'Child Development', 3500, 3500),
  ('Clinical Anatomy', 'PhD', 'English', 9000, 4, true, 'Clinical Anatomy', 9000, 8100),
  ('Clinical Psychology', 'PhD', 'English', 12000, 4, true, 'Clinical Psychology', 12000, 2026),
  ('Education Management And Planning', 'PhD', 'English', 8000, 4, true, 'Education Management And Planning', 8000, 2026),
  ('Electrical And Electronic Engineering', 'PhD', 'Turkish', 40000, 4, true, 'Electrical And Electronic Engineering', 40000, 8500),
  ('English Language Education', 'PhD', 'Turkish', 40000, 4, true, 'English Language Education', 40000, 8500),
  ('Forensic Science', 'PhD', 'English', 7800, 4, true, 'Forensic Science', 7800, 7020),
  ('Guidance And Counseling', 'PhD', 'English', 40000, 4, true, 'Guidance And Counseling', 40000, 3500),
  ('Health Management', 'PhD', 'English', 7800, 4, true, 'Health Management', 7800, 7020),
  ('International Relations', 'PhD', 'English', 7800, 4, true, 'International Relations', 7800, 7020),
  ('Management Engineering', 'PhD', 'English', 40000, 4, true, 'Management Engineering', 40000, 8500),
  ('Medical Genetics', 'PhD', 'English', 9000, 4, true, 'Medical Genetics', 9000, 8100),
  ('Neuroscience', 'PhD', 'English', 9000, 4, true, 'Neuroscience', 9000, 8100),
  ('New Media And Communication', 'PhD', 'English', 7800, 4, true, 'New Media And Communication', 7800, 7020),
  ('Nursing', 'PhD', 'English', 9000, 4, true, 'Nursing', 9000, 8100),
  ('Occupational Health And Safety', 'PhD', 'English', 7800, 4, true, 'Occupational Health And Safety', 7800, 7020),
  ('Oral And Maxillofacial Surgery', 'PhD', 'Turkish', 60000, 4, true, 'Oral And Maxillofacial Surgery', 60000, 2026),
  ('Pedodontics', 'PhD', 'English', 32000, 4, true, 'Pedodontics', 32000, 2026),
  ('Periodontology', 'PhD', 'English', 32000, 4, true, 'Periodontology', 32000, 2026),
  ('Physiology', 'PhD', 'English', 9000, 4, true, 'Physiology', 9000, 8100),
  ('Physiotherapy And Rehabilitation', 'PhD', 'English', 8000, 4, true, 'Physiotherapy And Rehabilitation', 8000, NULL::numeric),
  ('Prosthodontic Treatment', 'PhD', 'English', 32000, 4, true, 'Prosthodontic Treatment', 32000, 2026),
  ('Psychology', 'PhD', 'English', 19100, 4, true, 'Psychology', 19100, 17190),
  ('Public Relations And Advertising', 'PhD', 'English', 40000, 4, true, 'Public Relations And Advertising', 40000, 3500),
  ('Speech And Language Therapy', 'PhD', 'English', 9000, 4, true, 'Speech And Language Therapy', 9000, 8100),
  ('The Though, History, And Literature Of Islamic', 'PhD', 'English', 13300, 4, true, 'The Though, History, And Literature Of Islamic', 13300, 11970),
  ('The Though, History, And Literature Of Islamic Civilization', 'PhD', 'English', 13300, 4, true, 'The Though, History, And Literature Of Islamic Civilization', 13300, 11970),
  ('The Thought, History, And Literature Of Islamic Civilization', 'PhD', 'English', 13300, 4, true, 'The Thought, History, And Literature Of Islamic Civilization', 13300, 11970),
  ('Visual Communication Design', 'PhD', 'English', 7800, 4, true, 'Visual Communication Design', 7800, 7020),
  ('Whacill ple', 'PhD', 'English', 9000, 4, true, 'Whacill ple', 9000, 8100)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND p.id IS NULL;


-- İstanbul Kültür University: 12 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'PhD', 'English', 7800, 4, true, 'Architecture', 9000, 2026),
  ('Computer Engineering', 'PhD', 'English', 7800, 4, true, 'Computer Engineering', 9000, 2026),
  ('Economics', 'PhD', 'English', 7800, 4, true, 'Economics', 9000, 2026),
  ('Geomatics Engineering', 'PhD', 'English', 7800, 4, true, 'Geomatics Engineering', 9000, 2026),
  ('Geotechnical', 'PhD', 'English', 7800, 4, true, 'Geotechnical', 9000, 2026),
  ('Industrial Engineering', 'PhD', 'Turkish', 7800, 4, true, 'Industrial Engineering', 9000, 2026),
  ('Mathematics', 'PhD', 'English', 7800, 4, true, 'Mathematics', 9000, 2026),
  ('Molecular Biology And Genetics', 'PhD', 'English', 7800, 4, true, 'Molecular Biology And Genetics', 9000, 2026),
  ('Private Law', 'PhD', 'English', 7800, 4, true, 'Private Law', 9000, 2026),
  ('Project Management', 'PhD', 'English', 7800, 4, true, 'Project Management', 9000, 2026),
  ('Structure', 'PhD', 'English', 7800, 4, true, 'Structure', 9000, 2026),
  ('Turkish Language And Literature', 'PhD', 'Turkish', 7800, 4, true, 'Turkish Language And Literature', 9000, 2026)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('İstanbul Kültür University'))
  AND p.id IS NULL;


-- İstanbul Sabahattin Zaim University: 14 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Clinical Psychology', 'PhD', 'English', 16000, 4, true, 'Clinical Psychology', 16000, NULL::numeric),
  ('Computer Science And Engineering', 'PhD', 'English', 12000, 4, true, 'Computer Science And Engineering', 12000, NULL::numeric),
  ('Education Management', 'PhD', 'English', 12000, 4, true, 'Education Management', 12000, NULL::numeric),
  ('Family Counseling And Education', 'PhD', 'English', 12000, 4, true, 'Family Counseling And Education', 12000, NULL::numeric),
  ('Food Engineering', 'PhD', 'English', 12000, 4, true, 'Food Engineering', 12000, NULL::numeric),
  ('History And Civilization Studies', 'PhD', 'English', 12000, 4, true, 'History And Civilization Studies', 12000, NULL::numeric),
  ('Internal Medicine Nursing', 'PhD', 'English', 12000, 4, true, 'Internal Medicine Nursing', 12000, NULL::numeric),
  ('Philosophy And Religious Studies', 'PhD', 'English', 12000, 4, true, 'Philosophy And Religious Studies', 12000, NULL::numeric),
  ('Private Law', 'PhD', 'English', 12000, 4, true, 'Private Law', 12000, NULL::numeric),
  ('Psychology', 'PhD', 'English', 12000, 4, true, 'Psychology', 12000, NULL::numeric),
  ('Public Law', 'PhD', 'English', 12000, 4, true, 'Public Law', 12000, NULL::numeric),
  ('Social Work', 'PhD', 'English', 12000, 4, true, 'Social Work', 12000, NULL::numeric),
  ('Sociology', 'PhD', 'English', 12000, 4, true, 'Sociology', 12000, NULL::numeric),
  ('Urbanism And Urban Transformation', 'PhD', 'English', 12000, 4, true, 'Urbanism And Urban Transformation', 12000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('İstanbul Sabahattin Zaim University'))
  AND p.id IS NULL;


-- İstinye University: 38 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Business Administration', 'CombinedPhD', 'English', 15000, 5, true, 'Business Administration', 15000, 3000),
  ('Chemistry', 'CombinedPhD', 'Turkish', 15000, 5, true, 'Chemistry', 15000, 8000),
  ('Communications Sciences', 'CombinedPhD', 'English', 15000, 5, true, 'Communications Sciences', 15000, 3000),
  ('Health Management', 'CombinedPhD', 'English', 15000, 5, true, 'Health Management', 15000, 3000),
  ('Histology And Embryology', 'CombinedPhD', 'English', 15000, 5, true, 'Histology And Embryology', 15000, 3000),
  ('Medical Biology And Genetics', 'CombinedPhD', 'English', 15000, 5, true, 'Medical Biology And Genetics', 15000, 3000),
  ('Midwifery', 'CombinedPhD', 'English', 15000, 5, true, 'Midwifery', 15000, 3000),
  ('Molecular Oncology', 'CombinedPhD', 'English', 15000, 5, true, 'Molecular Oncology', 15000, 3000),
  ('Neuroscience', 'CombinedPhD', 'English', 15000, 5, true, 'Neuroscience', 15000, 3000),
  ('Nutrition And Dietetics', 'CombinedPhD', 'English', 15000, 5, true, 'Nutrition And Dietetics', 15000, 3000),
  ('Obstetrics And Gynecology', 'CombinedPhD', 'English', 15000, 5, true, 'Obstetrics And Gynecology', 15000, 3000),
  ('Physics', 'CombinedPhD', 'Turkish', 15000, 5, true, 'Physics', 15000, 8000),
  ('Physiotherapy And Rehabilitation', 'CombinedPhD', 'English', 15000, 5, true, 'Physiotherapy And Rehabilitation', 15000, 3000),
  ('Speech And Language Therapy', 'CombinedPhD', 'English', 15000, 5, true, 'Speech And Language Therapy', 15000, 3000),
  ('Stem Cell And Tissue Engineering', 'CombinedPhD', 'English', 15000, 5, true, 'Stem Cell And Tissue Engineering', 15000, 3000),
  ('Accounting And Auditing', 'PhD', 'English', 7000, 4, true, 'Accounting And Auditing', 7000, 6650),
  ('Architecture', 'PhD', 'English', 12500, 4, true, 'Architecture', 12500, 3000),
  ('Business Administration', 'PhD', 'English', 12500, 4, true, 'Business Administration', 12500, 3000),
  ('Chemistry', 'PhD', 'Turkish', 12500, 4, true, 'Chemistry', 12500, 8000),
  ('Clinical Anatomy', 'PhD', 'English', 12500, 4, true, 'Clinical Anatomy', 12500, 3000),
  ('Clinical Pharmacy', 'PhD', 'Turkish', 2377, 4, true, 'Clinical Pharmacy', 2377, NULL::numeric),
  ('Communications Sciences', 'PhD', 'English', 12500, 4, true, 'Communications Sciences', 12500, 3000),
  ('Computer Engineering', 'PhD', 'English', 7800, 4, true, 'Computer Engineering', 9000, NULL::numeric),
  ('Health Management', 'PhD', 'English', 12500, 4, true, 'Health Management', 12500, 3000),
  ('Histology And Embryology', 'PhD', 'English', 12500, 4, true, 'Histology And Embryology', 12500, 3000),
  ('Lefke Avrupa UniversitE yprus', 'PhD', 'English', 6000, 4, true, 'Lefke Avrupa UniversitE yprus', 9000, NULL::numeric),
  ('Lefke Avrupa UniversitEyprus', 'PhD', 'English', 6000, 4, true, 'Lefke Avrupa UniversitEyprus', 9000, NULL::numeric),
  ('Medical Biology And Genetics', 'PhD', 'English', 12500, 4, true, 'Medical Biology And Genetics', 12500, 3000),
  ('Midwifery', 'PhD', 'English', 12500, 4, true, 'Midwifery', 12500, 3000),
  ('Molecular Oncology', 'PhD', 'English', 12500, 4, true, 'Molecular Oncology', 12500, 3000),
  ('Neuroscience', 'PhD', 'English', 12500, 4, true, 'Neuroscience', 12500, 3000),
  ('Nutrition And Dietetics', 'PhD', 'English', 12500, 4, true, 'Nutrition And Dietetics', 12500, 3000),
  ('Obstetrics And Gynecology', 'PhD', 'English', 12500, 4, true, 'Obstetrics And Gynecology', 12500, 3000),
  ('Pharmacutical Chemistry', 'PhD', 'Turkish', 12500, 4, true, 'Pharmacutical Chemistry', 12500, 8000),
  ('Physics', 'PhD', 'Turkish', 12500, 4, true, 'Physics', 12500, 8000),
  ('Physiotherapy And Rehabilitation', 'PhD', 'English', 12500, 4, true, 'Physiotherapy And Rehabilitation', 12500, 3000),
  ('Speech And Language Therapy', 'PhD', 'English', 12500, 4, true, 'Speech And Language Therapy', 12500, 3000),
  ('Stem Cell And Tissue Engineering', 'PhD', 'English', 12500, 4, false, 'Stem Cell And Tissue Engineering', 12500, 3000)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('İstinye University'))
  AND p.id IS NULL;


UPDATE university u SET programs_count = sub.cnt
FROM (SELECT university_id, COUNT(*) AS cnt FROM program GROUP BY university_id) sub
WHERE u.id = sub.university_id;
