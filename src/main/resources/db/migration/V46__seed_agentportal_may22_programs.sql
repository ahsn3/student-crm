-- Programs from agentportal screenshots (2026-05-22). Idempotent bulk inserts.


-- Atlas University: 7 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Dialysis', 'Diploma', 'Turkish', 2610, 2, true, 'Dialysis', 2900, 2220),
  ('First And Emergency Aid', 'Diploma', 'Turkish', 2610, 2, true, 'First And Emergency Aid', 2900, 2220),
  ('Green And Ecological Building Technician', 'Diploma', 'Turkish', 2610, 2, true, 'Green And Ecological Building Technician', 2900, 2220),
  ('Interior Design', 'Diploma', 'Turkish', 2610, 2, true, 'Interior Design', 2900, 2220),
  ('Medical Laboratory Techniques', 'Diploma', 'Turkish', 2610, 2, true, 'Medical Laboratory Techniques', 2900, 2220),
  ('Surgery Services', 'Diploma', 'Turkish', 2610, 2, true, 'Surgery Services', 2900, 2220),
  ('Telehealth Technician', 'Diploma', 'Turkish', 2610, 2, true, 'Telehealth Technician', 2900, 2220)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Atlas University'))
  AND p.id IS NULL;


-- Beykoz University: 55 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'Bachelor', 'Turkish', 2300, 4, true, 'Architecture', 4600, NULL::numeric),
  ('Aviation Management', 'Bachelor', 'English', 3000, 4, true, 'Aviation Management', 6000, NULL::numeric),
  ('Business Administration', 'Bachelor', 'English', 3000, 4, true, 'Business Administration', 6000, NULL::numeric),
  ('Business Administration', 'Bachelor', 'Turkish', 2300, 4, true, 'Business Administration', 4600, 2026),
  ('Cartoon And Animation', 'Bachelor', 'Turkish', 2300, 4, true, 'Cartoon And Animation', 4600, NULL::numeric),
  ('Communication And Design', 'Bachelor', 'Turkish', 2300, 4, true, 'Communication And Design', 4600, 2026),
  ('Computer Engineering', 'Bachelor', 'English', 3300, 4, true, 'Computer Engineering', 6600, 2026),
  ('Digital Game Design', 'Bachelor', 'Turkish', 2300, 4, true, 'Digital Game Design', 4600, 2026),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'Turkish', 2300, 4, true, 'Gastronomy And Culinary Arts', 4600, 2026),
  ('Graphic Design', 'Bachelor', 'Turkish', 2300, 4, true, 'Graphic Design', 4600, NULL::numeric),
  ('Interior Architecture', 'Bachelor', 'Turkish', 2300, 4, true, 'Interior Architecture', 4600, 2026),
  ('International Trade And Finance', 'Bachelor', 'English', 3000, 4, true, 'International Trade And Finance', 6000, 2026),
  ('Political Science And International Relations', 'Bachelor', 'English', 3000, 4, true, 'Political Science And International Relations', 6000, NULL::numeric),
  ('Psychology', 'Bachelor', 'English', 3000, 4, true, 'Psychology', 6000, 2026),
  ('Psychology', 'Bachelor', 'Turkish', 2300, 4, true, 'Psychology', 4600, NULL::numeric),
  ('Public Relations And Advertising', 'Bachelor', 'Turkish', 2300, 4, true, 'Public Relations And Advertising', 4600, 2026),
  ('Radio Television And Film', 'Bachelor', 'Turkish', 2300, 4, true, 'Radio Television And Film', 4600, NULL::numeric),
  ('Software Engineering', 'Bachelor', 'Turkish', 2300, 4, true, 'Software Engineering', 4600, NULL::numeric),
  ('Big Data Analytics', 'Diploma', 'Turkish', 1700, 2, true, 'Big Data Analytics', 3400, 2026),
  ('Civil Aviation Cabin Services', 'Diploma', 'Turkish', 1700, 2, true, 'Civil Aviation Cabin Services', 3400, 2026),
  ('Computer Programming', 'Diploma', 'Turkish', 1700, 2, true, 'Computer Programming', 3400, 2026),
  ('E-Commerce And Marketing', 'Diploma', 'Turkish', 2026, 2, true, 'E-Commerce And Marketing', 1700, NULL::numeric),
  ('Foreign Trade', 'Diploma', 'Turkish', 1700, 2, true, 'Foreign Trade', 3400, 2026),
  ('Foreign Trade DE', 'Diploma', 'Turkish', 1700, 2, true, 'Foreign Trade DE', 3400, 2026),
  ('Information Security Technologies', 'Diploma', 'Turkish', 1700, 2, true, 'Information Security Technologies', 3400, 2026),
  ('Logistics', 'Diploma', 'Turkish', 1700, 2, true, 'Logistics', 3400, 2026),
  ('Marine And Port Management', 'Diploma', 'Turkish', 1700, 2, true, 'Marine And Port Management', 3400, 2026),
  ('Rail Systems Management', 'Diploma', 'Turkish', 1700, 2, true, 'Rail Systems Management', 3400, 2026),
  ('Accounting And Auditing', 'Master', 'Turkish', 2600, 1, true, 'Accounting And Auditing', 5200, NULL::numeric),
  ('Artifical Intelligence Engineering', 'Master', 'English', 3000, 1, true, 'Artifical Intelligence Engineering', 6000, NULL::numeric),
  ('Artificial Intelligence Engineering With Thesis', 'Master', 'English', 3500, 2, true, 'Artificial Intelligence Engineering With Thesis', 7000, NULL::numeric),
  ('Business Administration', 'Master', 'English', 3000, 1, true, 'Business Administration', 6000, NULL::numeric),
  ('Business Administration', 'Master', 'Turkish', 2600, 1, true, 'Business Administration', 5200, NULL::numeric),
  ('Business Administration (De)', 'Master', 'English', 2100, 1, true, 'Business Administration (De)', 4200, NULL::numeric),
  ('Business Administration (De)', 'Master', 'Turkish', 2100, 1, true, 'Business Administration (De)', 4200, NULL::numeric),
  ('Business Administration With Thesis', 'Master', 'English', 3500, 2, true, 'Business Administration With Thesis', 7000, NULL::numeric),
  ('Business Administration With Thesis', 'Master', 'Turkish', 3000, 2, true, 'Business Administration With Thesis', 6000, NULL::numeric),
  ('Computer Engineering With Thesis', 'Master', 'English', 3500, 2, true, 'Computer Engineering With Thesis', 7000, NULL::numeric),
  ('Entrepreneurship And Innovation Management', 'Master', 'English', 3000, 1, true, 'Entrepreneurship And Innovation Management', 6000, NULL::numeric),
  ('Financial Economics With Thesis', 'Master', 'Turkish', 3000, 2, true, 'Financial Economics With Thesis', 6000, NULL::numeric),
  ('Global Politics And International Relations', 'Master', 'English', 3000, 1, true, 'Global Politics And International Relations', 6000, NULL::numeric),
  ('Global Politics And International Relations Witr', 'Master', 'English', 3500, 1, true, 'Global Politics And International Relations Witr', 7000, NULL::numeric),
  ('Human Resource Management With Thesis', 'Master', 'Turkish', 3000, 2, true, 'Human Resource Management With Thesis', 6000, NULL::numeric),
  ('International Trade And Logistics', 'Master', 'Turkish', 2600, 1, true, 'International Trade And Logistics', 5200, NULL::numeric),
  ('International Trade And Logistics (De)', 'Master', 'Turkish', 2100, 1, true, 'International Trade And Logistics (De)', 4200, NULL::numeric),
  ('International Trade And Logistics With Thesis', 'Master', 'Turkish', 3000, 2, true, 'International Trade And Logistics With Thesis', 6000, NULL::numeric),
  ('Marketing Management', 'Master', 'English', 3000, 1, true, 'Marketing Management', 6000, NULL::numeric),
  ('Marketing Management', 'Master', 'Turkish', 2600, 1, true, 'Marketing Management', 5200, NULL::numeric),
  ('Psychology', 'Master', 'Turkish', 2600, 1, true, 'Psychology', 5200, NULL::numeric),
  ('Psychology With Thesis', 'Master', 'Turkish', 3000, 2, true, 'Psychology With Thesis', 6000, NULL::numeric),
  ('Technology And Inovasion With Thesis', 'Master', 'English', 3500, 2, true, 'Technology And Inovasion With Thesis', 7000, NULL::numeric),
  ('Technology and Innovation Management', 'Master', 'English', 3000, 1, true, 'Technology and Innovation Management', 6000, NULL::numeric),
  ('Visual Arts And Visual Communication Design', 'Master', 'Turkish', 2600, 1, true, 'Visual Arts And Visual Communication Design', 5200, NULL::numeric),
  ('Visual Arts And Visual Communication Design''', 'Master', 'Turkish', 3000, 1, true, 'Visual Arts And Visual Communication Design''', 6000, NULL::numeric),
  ('Work And Organizational Psychology', 'Master', 'Turkish', 2600, 1, true, 'Work And Organizational Psychology', 5200, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Beykoz University'))
  AND p.id IS NULL;


-- Eastern Mediterranean University: 4 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('English Translation And Interpretation', 'Bachelor', 'English', 2900, 4, true, 'English Translation And Interpretation', 2900, NULL::numeric),
  ('Civil Aviation Cabin Services', 'Diploma', 'English', 2500, 2, true, 'Civil Aviation Cabin Services', 2500, NULL::numeric),
  ('Computer Programming And Information Techi', 'Diploma', 'English', 2500, 2, true, 'Computer Programming And Information Techi', 2500, NULL::numeric),
  ('Tourism And Hotel Management', 'Diploma', 'English', 2500, 2, true, 'Tourism And Hotel Management', 2500, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Eastern Mediterranean University'))
  AND p.id IS NULL;


-- Girne American University: 84 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('ATPL Flight Certification', 'Bachelor', 'English', 25000, 4, true, 'ATPL Flight Certification', 25000, NULL::numeric),
  ('American Culture And Literature', 'Bachelor', 'English', 1900, 4, true, 'American Culture And Literature', 1900, NULL::numeric),
  ('Architecture', 'Bachelor', 'English', 1900, 4, true, 'Architecture', 1900, NULL::numeric),
  ('Aviation Management', 'Bachelor', 'English', 1900, 4, true, 'Aviation Management', 1900, NULL::numeric),
  ('Cartoon And Animation', 'Bachelor', 'English', 1900, 4, true, 'Cartoon And Animation', 1900, NULL::numeric),
  ('Common Law', 'Bachelor', 'English', 1900, 4, true, 'Common Law', 1900, NULL::numeric),
  ('Computer Education And Instructional Technol', 'Bachelor', 'English', 1900, 4, true, 'Computer Education And Instructional Technol', 1900, NULL::numeric),
  ('Computer Engineering', 'Bachelor', 'English', 1900, 4, true, 'Computer Engineering', 1900, NULL::numeric),
  ('Digital Media And Marketing', 'Bachelor', 'English', 1900, 4, true, 'Digital Media And Marketing', 1900, NULL::numeric),
  ('Emergency And Disaster Management', 'Bachelor', 'English', 1900, 4, true, 'Emergency And Disaster Management', 1900, NULL::numeric),
  ('English Language Teaching', 'Bachelor', 'English', 1900, 4, true, 'English Language Teaching', 1900, NULL::numeric),
  ('English Translation And Interpretation', 'Bachelor', 'English', 1900, 4, true, 'English Translation And Interpretation', 1900, NULL::numeric),
  ('Girne American UniversitZyprus', 'Bachelor', 'English', 1900, 4, true, 'Girne American UniversitZyprus', 1900, NULL::numeric),
  ('Girne American Universite yprus', 'Bachelor', 'English', 1900, 4, true, 'Girne American Universite yprus', 1900, NULL::numeric),
  ('Graphic Design', 'Bachelor', 'English', 1900, 4, true, 'Graphic Design', 1900, NULL::numeric),
  ('Human Resources Management', 'Bachelor', 'English', 1900, 4, true, 'Human Resources Management', 1900, NULL::numeric),
  ('Interior Architecture', 'Bachelor', 'English', 1900, 4, true, 'Interior Architecture', 1900, NULL::numeric),
  ('International Business Administration', 'Bachelor', 'English', 1900, 4, true, 'International Business Administration', 1900, NULL::numeric),
  ('Management Information Systems', 'Bachelor', 'English', 1900, 4, true, 'Management Information Systems', 1900, NULL::numeric),
  ('Marketing', 'Bachelor', 'English', 1900, 4, true, 'Marketing', 1900, NULL::numeric),
  ('Mechanical Engineering', 'Bachelor', 'English', 1900, 4, true, 'Mechanical Engineering', 1900, NULL::numeric),
  ('Medicine', 'Bachelor', 'English', 5850, 6, true, 'Medicine', 5850, NULL::numeric),
  ('Nursing', 'Bachelor', 'English', 1900, 4, true, 'Nursing', 1900, NULL::numeric),
  ('Nutntion And Dietetics', 'Bachelor', 'English', 1900, 4, true, 'Nutntion And Dietetics', 1900, NULL::numeric),
  ('Occupational Therapy', 'Bachelor', 'English', 1900, 4, true, 'Occupational Therapy', 1900, NULL::numeric),
  ('Pharmacy', 'Bachelor', 'English', 2700, 5, true, 'Pharmacy', 2700, NULL::numeric),
  ('Pilotage', 'Bachelor', 'English', 10000, 4, true, 'Pilotage', 10000, NULL::numeric),
  ('Plastic Arts', 'Bachelor', 'English', 1900, 4, true, 'Plastic Arts', 1900, NULL::numeric),
  ('Political Science And Public Administration', 'Bachelor', 'English', 1900, 4, true, 'Political Science And Public Administration', 1900, NULL::numeric),
  ('Psychology', 'Bachelor', 'English', 1900, 4, true, 'Psychology', 1900, NULL::numeric),
  ('Public Relation', 'Bachelor', 'English', 1900, 4, true, 'Public Relation', 1900, NULL::numeric),
  ('Radio Television And Film', 'Bachelor', 'English', 1900, 4, true, 'Radio Television And Film', 1900, NULL::numeric),
  ('Recreation', 'Bachelor', 'English', 1900, 4, true, 'Recreation', 1900, NULL::numeric),
  ('Sports Management', 'Bachelor', 'English', 1900, 4, true, 'Sports Management', 1900, NULL::numeric),
  ('Tissue Engineering', 'Bachelor', 'English', 1900, 4, true, 'Tissue Engineering', 1900, NULL::numeric),
  ('Tourism And Hotel Management', 'Bachelor', 'English', 1900, 4, true, 'Tourism And Hotel Management', 1900, NULL::numeric),
  ('Translation And Interpretation (Chinese)', 'Bachelor', 'English', 1900, 4, true, 'Translation And Interpretation (Chinese)', 1900, NULL::numeric),
  ('Visual Arts', 'Bachelor', 'English', 1900, 4, true, 'Visual Arts', 1900, NULL::numeric),
  ('Accounting And Tax Applications', 'Diploma', 'English', 1900, 2, true, 'Accounting And Tax Applications', 1900, NULL::numeric),
  ('Business Administration', 'Diploma', 'English', 1900, 2, true, 'Business Administration', 1900, NULL::numeric),
  ('Civil Aviation And Cabin Services', 'Diploma', 'English', 1900, 2, true, 'Civil Aviation And Cabin Services', 1900, NULL::numeric),
  ('Computer Operations', 'Diploma', 'English', 1900, 2, true, 'Computer Operations', 1900, NULL::numeric),
  ('Computer Programming', 'Diploma', 'English', 1900, 2, true, 'Computer Programming', 1900, 2026),
  ('Electronics technology', 'Diploma', 'English', 1900, 2, true, 'Electronics technology', 1900, NULL::numeric),
  ('Gire American UniversitZyprus', 'Diploma', 'English', 1900, 2, true, 'Gire American UniversitZyprus', 1900, 2026),
  ('Girne American UniversitiZyprus', 'Diploma', 'English', 1900, 2, true, 'Girne American UniversitiZyprus', 1900, 2028),
  ('Girne American Universitzyprus', 'Diploma', 'English', 1900, 2, true, 'Girne American Universitzyprus', 1900, 2026),
  ('Graphic Design', 'Diploma', 'English', 1900, 2, true, 'Graphic Design', 1900, 2026),
  ('Marketing', 'Diploma', 'English', 1900, 2, true, 'Marketing', 1900, NULL::numeric),
  ('Public Relations And Advertising', 'Diploma', 'English', 1900, 2, true, 'Public Relations And Advertising', 1900, NULL::numeric),
  ('Architecture With Thesis', 'Master', 'English', 4000, 2, true, 'Architecture With Thesis', 4000, NULL::numeric),
  ('Art & Design With Thesis', 'Master', 'English', 4000, 2, true, 'Art & Design With Thesis', 4000, NULL::numeric),
  ('Business Administration With Thesis', 'Master', 'English', 4000, 2, true, 'Business Administration With Thesis', 4000, NULL::numeric),
  ('Computer Engineering With Thesis', 'Master', 'English', 4000, 2, true, 'Computer Engineering With Thesis', 4000, NULL::numeric),
  ('Construction Management With Thesis', 'Master', 'English', 4000, 2, true, 'Construction Management With Thesis', 4000, NULL::numeric),
  ('Counseling Psychology With Thesis', 'Master', 'English', 4000, 2, true, 'Counseling Psychology With Thesis', 4000, NULL::numeric),
  ('Economics With Thesis', 'Master', 'English', 4000, 2, true, 'Economics With Thesis', 4000, NULL::numeric),
  ('Education Administration & Supervision', 'Master', 'English', 4000, 1, true, 'Education Administration & Supervision', 4000, NULL::numeric),
  ('Electrical And Electronic Engineering With The', 'Master', 'English', 4000, 1, true, 'Electrical And Electronic Engineering With The', 4000, NULL::numeric),
  ('English Language Teaching With Thesis', 'Master', 'English', 4000, 2, true, 'English Language Teaching With Thesis', 4000, NULL::numeric),
  ('Executive Management With Thesis', 'Master', 'English', 4000, 2, true, 'Executive Management With Thesis', 4000, NULL::numeric),
  ('Financial Management With Thesis', 'Master', 'English', 4000, 2, true, 'Financial Management With Thesis', 4000, NULL::numeric),
  ('Healthcare Management With Thesis', 'Master', 'English', 4000, 2, true, 'Healthcare Management With Thesis', 4000, NULL::numeric),
  ('Industrial Engineering With Thesis', 'Master', 'English', 4000, 2, true, 'Industrial Engineering With Thesis', 4000, NULL::numeric),
  ('Interior Architecture With Thesis', 'Master', 'English', 4000, 2, true, 'Interior Architecture With Thesis', 4000, NULL::numeric),
  ('International Business Law With Thesis', 'Master', 'English', 4000, 2, true, 'International Business Law With Thesis', 4000, NULL::numeric),
  ('International Relation With Thesis', 'Master', 'English', 4000, 2, true, 'International Relation With Thesis', 4000, NULL::numeric),
  ('Journalism & Broadcasting With Thesis', 'Master', 'English', 4000, 2, true, 'Journalism & Broadcasting With Thesis', 4000, NULL::numeric),
  ('Management Information Systems With Thesis', 'Master', 'English', 4000, 2, true, 'Management Information Systems With Thesis', 4000, NULL::numeric),
  ('Marketing With Thesis', 'Master', 'English', 4000, 2, true, 'Marketing With Thesis', 4000, NULL::numeric),
  ('Public Relation With Thesis', 'Master', 'English', 4000, 2, true, 'Public Relation With Thesis', 4000, NULL::numeric),
  ('Tourism Management With Thesis', 'Master', 'English', 4000, 2, true, 'Tourism Management With Thesis', 4000, NULL::numeric),
  ('Urban Design With Thesis', 'Master', 'English', 4000, 2, true, 'Urban Design With Thesis', 4000, NULL::numeric),
  ('Communication Media Management', 'PhD', 'English', 7500, 4, true, 'Communication Media Management', 7500, NULL::numeric),
  ('Construction Management', 'PhD', 'English', 7500, 4, true, 'Construction Management', 7500, NULL::numeric),
  ('Education Administration & Supervision', 'PhD', 'English', 7500, 4, true, 'Education Administration & Supervision', 7500, NULL::numeric),
  ('Electrical And Electronic Engineering', 'PhD', 'English', 7500, 4, true, 'Electrical And Electronic Engineering', 7500, NULL::numeric),
  ('English Language Teaching', 'PhD', 'English', 7500, 4, true, 'English Language Teaching', 7500, NULL::numeric),
  ('Gime American UniversitZyprus', 'PhD', 'English', 7500, 4, true, 'Gime American UniversitZyprus', 7500, NULL::numeric),
  ('Girne American UniversitE yprus', 'PhD', 'English', 7500, 4, true, 'Girne American UniversitE yprus', 7500, NULL::numeric),
  ('Marketing', 'PhD', 'English', 7500, 4, true, 'Marketing', 7500, NULL::numeric),
  ('Political And International Studies', 'PhD', 'English', 7500, 4, true, 'Political And International Studies', 7500, NULL::numeric),
  ('Psychology', 'PhD', 'English', 7500, 4, true, 'Psychology', 7500, NULL::numeric),
  ('Tourism Management', 'PhD', 'English', 7500, 4, true, 'Tourism Management', 7500, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Girne American University'))
  AND p.id IS NULL;


-- Medipol Ankara University: 40 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Audiology', 'Bachelor', 'Turkish', 4000, 4, true, 'Audiology', 4000, 3600),
  ('Computer Engineering', 'Bachelor', 'English', 5000, 4, true, 'Computer Engineering', 5000, 4500),
  ('Dentistry', 'Bachelor', 'English', 20000, 5, true, 'Dentistry', 20000, NULL::numeric),
  ('Electrical And Electronic Engineering', 'Bachelor', 'English', 5000, 4, true, 'Electrical And Electronic Engineering', 5000, 4500),
  ('Ergotherapy', 'Bachelor', 'Turkish', 3400, 4, true, 'Ergotherapy', 3400, 3060),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 4000, 4, true, 'Gastronomy And Culinary Arts', 4000, 3600),
  ('Interior Architecture And Environmental Desigr', 'Bachelor', 'Turkish', 4000, 4, true, 'Interior Architecture And Environmental Desigr', 4000, 3600),
  ('International Trade And Finance', 'Bachelor', 'English', 4000, 4, true, 'International Trade And Finance', 4000, 3600),
  ('International Trade And Finance', 'Bachelor', 'Turkish', 4000, 4, true, 'International Trade And Finance', 4000, 3600),
  ('Law', 'Bachelor', 'Turkish', 5000, 4, true, 'Law', 5000, 4500),
  ('Management Information Systems', 'Bachelor', 'Turkish', 4000, 4, true, 'Management Information Systems', 4000, 3600),
  ('Medicine', 'Bachelor', 'English', 20000, 6, true, 'Medicine', 20000, 18000),
  ('Medicine', 'Bachelor', 'Turkish', 18500, 6, true, 'Medicine', 18500, NULL::numeric),
  ('Nursing', 'Bachelor', 'English', 4500, 4, true, 'Nursing', 4500, 4050),
  ('Nursing', 'Bachelor', 'Turkish', 4500, 4, true, 'Nursing', 4500, 4050),
  ('Nutrition And Dietetics', 'Bachelor', 'Turkish', 4000, 4, true, 'Nutrition And Dietetics', 4000, 3600),
  ('Pharmacy', 'Bachelor', 'English', 9500, 5, true, 'Pharmacy', 9500, 8550),
  ('Pharmacy', 'Bachelor', 'Turkish', 9000, 5, true, 'Pharmacy', 9000, 8100),
  ('Physiotherapy And Rehabilitation', 'Bachelor', 'Turkish', 5000, 4, true, 'Physiotherapy And Rehabilitation', 5000, 4500),
  ('Political Science And International Relations', 'Bachelor', 'English', 4000, 4, true, 'Political Science And International Relations', 4000, 3600),
  ('Psychology', 'Bachelor', 'English', 5000, 4, true, 'Psychology', 5000, 4500),
  ('Psychology', 'Bachelor', 'Turkish', 5000, 4, true, 'Psychology', 5000, 4500),
  ('Public Relations And Advertising', 'Bachelor', 'Turkish', 4000, 4, true, 'Public Relations And Advertising', 4000, 3600),
  ('Speech And Language Therapy', 'Bachelor', 'Turkish', 4000, 4, true, 'Speech And Language Therapy', 4000, 3600),
  ('Anesthesia', 'Diploma', 'Turkish', 2250, 2, true, 'Anesthesia', 2250, NULL::numeric),
  ('Audiometry', 'Diploma', 'Turkish', 2250, 2, true, 'Audiometry', 2250, NULL::numeric),
  ('Biomedical Device Technologies', 'Diploma', 'Turkish', 2250, 2, true, 'Biomedical Device Technologies', 2250, 2026),
  ('Computer Programming', 'Diploma', 'Turkish', 2250, 2, true, 'Computer Programming', 2250, NULL::numeric),
  ('Construction Technology', 'Diploma', 'Turkish', 2250, 2, true, 'Construction Technology', 2250, NULL::numeric),
  ('Dental Prosthesis', 'Diploma', 'Turkish', 2250, 2, true, 'Dental Prosthesis', 2250, NULL::numeric),
  ('Dialysis', 'Diploma', 'Turkish', 2250, 2, true, 'Dialysis', 2250, NULL::numeric),
  ('First And Emergency Aid', 'Diploma', 'Turkish', 2250, 2, true, 'First And Emergency Aid', 2250, NULL::numeric),
  ('Health Tourism Management', 'Diploma', 'Turkish', 2250, 2, true, 'Health Tourism Management', 2250, 2026),
  ('Marketing', 'Diploma', 'Turkish', 2250, 2, true, 'Marketing', 2250, NULL::numeric),
  ('Medical Imaging Techniques', 'Diploma', 'Turkish', 2250, 2, true, 'Medical Imaging Techniques', 2250, 2026),
  ('Operating Room Services', 'Diploma', 'Turkish', 2250, 2, true, 'Operating Room Services', 2250, 2026),
  ('Opticianry', 'Diploma', 'Turkish', 2250, 2, true, 'Opticianry', 2250, NULL::numeric),
  ('Oral And Dental Health', 'Diploma', 'Turkish', 2250, 2, true, 'Oral And Dental Health', 2250, NULL::numeric),
  ('Physiotherapy', 'Diploma', 'Turkish', 2250, 2, true, 'Physiotherapy', 2250, NULL::numeric),
  ('Radiotherapy', 'Diploma', 'Turkish', 2250, 2, true, 'Radiotherapy', 2250, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Medipol Ankara University'))
  AND p.id IS NULL;


-- Near East University: 126 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Arabic Language And Literature With Thesis', 'Master', 'Arabic', 1254, 2, true, 'Arabic Language And Literature With Thesis', 1254, NULL::numeric),
  ('Architecture With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Architecture With Thesis', 1254, NULL::numeric),
  ('Arts And Crafts Teaching', 'Master', 'Turkish', 1254, 1, true, 'Arts And Crafts Teaching', 1254, NULL::numeric),
  ('Banking And Accounting', 'Master', 'English', 1254, 1, true, 'Banking And Accounting', 1254, NULL::numeric),
  ('Banking And Accounting With Thesis', 'Master', 'Arabic', 1254, 2, true, 'Banking And Accounting With Thesis', 1254, NULL::numeric),
  ('Banking And Accounting With Thesis', 'Master', 'English', 1254, 2, true, 'Banking And Accounting With Thesis', 1254, NULL::numeric),
  ('Banking And Finance With Thesis', 'Master', 'English', 1254, 2, true, 'Banking And Finance With Thesis', 1254, NULL::numeric),
  ('Biophysics', 'Master', 'Turkish', 1254, 1, true, 'Biophysics', 1254, NULL::numeric),
  ('Biostatistics', 'Master', 'Turkish', 1254, 1, true, 'Biostatistics', 1254, NULL::numeric),
  ('Biostatistics With Thesis', 'Master', 'English', 1254, 2, true, 'Biostatistics With Thesis', 1254, NULL::numeric),
  ('Blockchain And Digital Currency With Thesis', 'Master', 'English', 1254, 2, true, 'Blockchain And Digital Currency With Thesis', 1254, NULL::numeric),
  ('Child Health And Diseases Nursing With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Child Health And Diseases Nursing With Thesis', 1254, NULL::numeric),
  ('Clinical Pharmacy', 'Master', 'Turkish', 1254, 1, true, 'Clinical Pharmacy', 1254, NULL::numeric),
  ('Clinical Psychology With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Clinical Psychology With Thesis', 1254, NULL::numeric),
  ('Computer Education And Instructional Technol', 'Master', 'English', 1254, 1, true, 'Computer Education And Instructional Technol', 1254, NULL::numeric),
  ('Construction Management', 'Master', 'English', 1254, 1, true, 'Construction Management', 1254, NULL::numeric),
  ('Educational Programs And Instruction With The', 'Master', 'English', 1254, 2, true, 'Educational Programs And Instruction With The', 1254, NULL::numeric),
  ('Electrical And Electronic Engineering With The', 'Master', 'English', 1254, 1, true, 'Electrical And Electronic Engineering With The', 1254, NULL::numeric),
  ('Environmental Education With Thesis', 'Master', 'English', 1254, 2, true, 'Environmental Education With Thesis', 1254, NULL::numeric),
  ('Environmental Education With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Environmental Education With Thesis', 1254, NULL::numeric),
  ('Food Engineering With Thesis', 'Master', 'English', 1254, 2, true, 'Food Engineering With Thesis', 1254, NULL::numeric),
  ('Geography With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Geography With Thesis', 1254, NULL::numeric),
  ('History Teaching', 'Master', 'Turkish', 1254, 1, true, 'History Teaching', 1254, NULL::numeric),
  ('Interior Architecture With Thesis', 'Master', 'English', 1254, 2, true, 'Interior Architecture With Thesis', 1254, NULL::numeric),
  ('International Business With Thesis', 'Master', 'English', 1254, 2, true, 'International Business With Thesis', 1254, NULL::numeric),
  ('Mechatronics Engineering With Thesis', 'Master', 'English', 1254, 2, true, 'Mechatronics Engineering With Thesis', 1254, NULL::numeric),
  ('Medical Microbiology And Clinical Microbiolog!', 'Master', 'English', 1254, 1, true, 'Medical Microbiology And Clinical Microbiolog!', 1254, NULL::numeric),
  ('Nursing', 'Master', 'Turkish', 1254, 1, true, 'Nursing', 1254, NULL::numeric),
  ('Nutntion And Dietetics', 'Master', 'Turkish', 1254, 1, true, 'Nutntion And Dietetics', 1254, NULL::numeric),
  ('Pre-School Education', 'Master', 'Turkish', 1254, 1, true, 'Pre-School Education', 1254, NULL::numeric),
  ('Software Engineering With Thesis', 'Master', 'English', 1254, 2, true, 'Software Engineering With Thesis', 1254, NULL::numeric),
  ('Special Education With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Special Education With Thesis', 1254, NULL::numeric),
  ('Surgical Nursing', 'Master', 'Turkish', 1254, 1, true, 'Surgical Nursing', 1254, NULL::numeric),
  ('Turkish Language And Literature With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Turkish Language And Literature With Thesis', 1254, NULL::numeric),
  ('Turkish Language Teaching', 'Master', 'Turkish', 1254, 1, true, 'Turkish Language Teaching', 1254, NULL::numeric),
  ('Turkish Language Teaching With Thesis', 'Master', 'Turkish', 1254, 2, true, 'Turkish Language Teaching With Thesis', 1254, NULL::numeric),
  ('Allergy And Immunology', 'PhD', 'English', 62377, 4, true, 'Allergy And Immunology', 2377, 2026),
  ('Analytical Chemistry', 'PhD', 'English', 2377, 4, true, 'Analytical Chemistry', 2377, 2026),
  ('Analytical Chemistry', 'PhD', 'Turkish', 2377, 4, true, 'Analytical Chemistry', 2377, NULL::numeric),
  ('Anatomy', 'PhD', 'English', 2377, 4, true, 'Anatomy', 2377, NULL::numeric),
  ('Anatomy', 'PhD', 'Turkish', 2377, 4, true, 'Anatomy', 2377, 2026),
  ('Animal Nutrition And Nutritional Diseases', 'PhD', 'English', 2377, 4, true, 'Animal Nutrition And Nutritional Diseases', 2377, NULL::numeric),
  ('Architecture', 'PhD', 'English', 1510, 4, true, 'Architecture', 1510, NULL::numeric),
  ('Architecture', 'PhD', 'Turkish', 1510, 4, true, 'Architecture', 1510, NULL::numeric),
  ('Arts And Design', 'PhD', 'Turkish', 1510, 4, true, 'Arts And Design', 1510, NULL::numeric),
  ('Banking And Finance', 'PhD', 'English', 1510, 4, true, 'Banking And Finance', 1510, NULL::numeric),
  ('Biochemistry', 'PhD', 'Turkish', 1510, 4, true, 'Biochemistry', 1510, NULL::numeric),
  ('Biomedical Engineering', 'PhD', 'English', 1510, 4, true, 'Biomedical Engineering', 1510, NULL::numeric),
  ('Biostatistics', 'PhD', 'English', 62377, 4, true, 'Biostatistics', 2377, NULL::numeric),
  ('Biostatistics', 'PhD', 'Turkish', 2377, 4, true, 'Biostatistics', 2377, 2026),
  ('Business Administration', 'PhD', 'English', 1510, 4, true, 'Business Administration', 1510, NULL::numeric),
  ('Child Health And Diseases Nursing', 'PhD', 'Turkish', 1510, 4, true, 'Child Health And Diseases Nursing', 1510, NULL::numeric),
  ('Civil Engineering', 'PhD', 'English', 1510, 4, true, 'Civil Engineering', 1510, NULL::numeric),
  ('Clinical Pharmacy', 'PhD', 'English', 2377, 4, true, 'Clinical Pharmacy', 2377, NULL::numeric),
  ('Clinical Pharmacy', 'PhD', 'Turkish', 2377, 4, true, 'Clinical Pharmacy', 2377, NULL::numeric),
  ('Computer Education And Instructional Technol', 'PhD', 'English', 1510, 4, true, 'Computer Education And Instructional Technol', 1510, NULL::numeric),
  ('Computer Education And Instructional Technol', 'PhD', 'Turkish', 1510, 4, true, 'Computer Education And Instructional Technol', 1510, NULL::numeric),
  ('Computer Engineering', 'PhD', 'English', 1510, 4, true, 'Computer Engineering', 1510, NULL::numeric),
  ('Computer Information Systems', 'PhD', 'English', 1510, 4, true, 'Computer Information Systems', 1510, NULL::numeric),
  ('Department of Surgery', 'PhD', 'English', 62377, 4, true, 'Department of Surgery', 2377, NULL::numeric),
  ('Economics', 'PhD', 'English', 1510, 4, true, 'Economics', 1510, NULL::numeric),
  ('Educational Administration, Supervision And Pl', 'PhD', 'English', 1510, 4, true, 'Educational Administration, Supervision And Pl', 1510, NULL::numeric),
  ('Educational Administration, Supervision And Pl', 'PhD', 'Turkish', 1510, 4, true, 'Educational Administration, Supervision And Pl', 1510, NULL::numeric),
  ('Educational Programs And Instruction', 'PhD', 'English', 1510, 4, true, 'Educational Programs And Instruction', 1510, NULL::numeric),
  ('Educational Programs And Instruction', 'PhD', 'Turkish', 1510, 4, true, 'Educational Programs And Instruction', 1510, 2026),
  ('Electrical And Electronic Engineering', 'PhD', 'English', 1510, 4, true, 'Electrical And Electronic Engineering', 1510, NULL::numeric),
  ('Endodontics', 'PhD', 'Turkish', 2377, 4, true, 'Endodontics', 2377, NULL::numeric),
  ('English Language Teaching', 'PhD', 'English', 1510, 4, true, 'English Language Teaching', 1510, NULL::numeric),
  ('Environmental Education', 'PhD', 'English', 1510, 4, true, 'Environmental Education', 1510, NULL::numeric),
  ('Environmental Education', 'PhD', 'Turkish', 1510, 4, true, 'Environmental Education', 1510, NULL::numeric),
  ('Folklore Education', 'PhD', 'Turkish', 1510, 4, true, 'Folklore Education', 1510, NULL::numeric),
  ('Food Hygiene And Technology', 'PhD', 'English', 2377, 4, true, 'Food Hygiene And Technology', 2377, NULL::numeric),
  ('Fundamentals Of Nursing And Nursing Adminis', 'PhD', 'Turkish', 1510, 4, true, 'Fundamentals Of Nursing And Nursing Adminis', 1510, NULL::numeric),
  ('General Psychology', 'PhD', 'English', 1510, 4, true, 'General Psychology', 1510, NULL::numeric),
  ('Graphic Design', 'PhD', 'Turkish', 1510, 4, true, 'Graphic Design', 1510, NULL::numeric),
  ('Health Institutions Management', 'PhD', 'Turkish', 1510, 4, true, 'Health Institutions Management', 1510, NULL::numeric),
  ('Information Systems Engineering', 'PhD', 'Turkish', 1510, 4, true, 'Information Systems Engineering', 1510, NULL::numeric),
  ('Innovation And Knowledge Management', 'PhD', 'English', 1510, 4, true, 'Innovation And Knowledge Management', 1510, 2026),
  ('Interior Architecture', 'PhD', 'English', 1510, 4, true, 'Interior Architecture', 1510, NULL::numeric),
  ('Internal Medicine Nursing', 'PhD', 'Turkish', 1510, 4, true, 'Internal Medicine Nursing', 1510, NULL::numeric),
  ('International Law', 'PhD', 'English', 1510, 4, true, 'International Law', 1510, NULL::numeric),
  ('Marine Law', 'PhD', 'Turkish', 1510, 4, true, 'Marine Law', 1510, NULL::numeric),
  ('Mathematics', 'PhD', 'English', 1510, 4, true, 'Mathematics', 1510, NULL::numeric),
  ('Mechanical Engineering', 'PhD', 'English', 1510, 4, true, 'Mechanical Engineering', 1510, NULL::numeric),
  ('Media And Communication Studies', 'PhD', 'Turkish', 1510, 4, true, 'Media And Communication Studies', 1510, NULL::numeric),
  ('Medical Biochemistry', 'PhD', 'English', 1510, 4, true, 'Medical Biochemistry', 1510, NULL::numeric),
  ('Medical Biology And Genetics', 'PhD', 'English', 2377, 4, true, 'Medical Biology And Genetics', 2377, NULL::numeric),
  ('Medical Microbiology And Clinical Microbiolog!', 'PhD', 'English', 2377, 4, true, 'Medical Microbiology And Clinical Microbiolog!', 2377, NULL::numeric),
  ('Molecular Biology And Genetics', 'PhD', 'English', 2377, 4, true, 'Molecular Biology And Genetics', 2377, NULL::numeric),
  ('Music', 'PhD', 'Turkish', 1510, 4, true, 'Music', 1510, 2026),
  ('Nursing', 'PhD', 'English', 1510, 4, true, 'Nursing', 1510, NULL::numeric),
  ('Nursing', 'PhD', 'Turkish', 1510, 4, true, 'Nursing', 1510, NULL::numeric),
  ('Nutrition And Dietetics', 'PhD', 'Turkish', 1510, 4, true, 'Nutrition And Dietetics', 1510, NULL::numeric),
  ('Obstetrics And Gynecologic Nursing', 'PhD', 'Turkish', 1510, 4, true, 'Obstetrics And Gynecologic Nursing', 1510, NULL::numeric),
  ('Oral And Maxillofacial Radiology', 'PhD', 'Turkish', 2377, 4, true, 'Oral And Maxillofacial Radiology', 2377, NULL::numeric),
  ('Orthodontics', 'PhD', 'Turkish', 2377, 4, true, 'Orthodontics', 2377, NULL::numeric),
  ('Pedodontics', 'PhD', 'Turkish', 62377, 4, true, 'Pedodontics', 2377, NULL::numeric),
  ('Periodontology', 'PhD', 'Turkish', 2377, 4, true, 'Periodontology', 2377, NULL::numeric),
  ('Petrol And Natural Gas Engineering', 'PhD', 'English', 1510, 4, true, 'Petrol And Natural Gas Engineering', 1510, NULL::numeric),
  ('Pharmaceutical Botany', 'PhD', 'English', 2377, 4, true, 'Pharmaceutical Botany', 2377, NULL::numeric),
  ('Pharmaceutical Chimistry', 'PhD', 'English', 2377, 4, true, 'Pharmaceutical Chimistry', 2377, NULL::numeric),
  ('Pharmacognosy', 'PhD', 'English', 62377, 4, true, 'Pharmacognosy', 2377, NULL::numeric),
  ('Pharmacognosy', 'PhD', 'Turkish', 2377, 4, true, 'Pharmacognosy', 2377, NULL::numeric),
  ('Pharmacology', 'PhD', 'English', 62377, 4, true, 'Pharmacology', 2377, NULL::numeric),
  ('Pharmacology', 'PhD', 'Turkish', 2377, 4, true, 'Pharmacology', 2377, NULL::numeric),
  ('Physical Education And Sports', 'PhD', 'Turkish', 1510, 4, true, 'Physical Education And Sports', 1510, NULL::numeric),
  ('Physics Engineering', 'PhD', 'English', 1510, 4, true, 'Physics Engineering', 1510, NULL::numeric),
  ('Physiology', 'PhD', 'Turkish', 2377, 4, true, 'Physiology', 2377, NULL::numeric),
  ('Physiotherapy And Rehabilitation', 'PhD', 'Turkish', 1510, 4, true, 'Physiotherapy And Rehabilitation', 1510, NULL::numeric),
  ('Phytotherapy', 'PhD', 'English', 2377, 4, true, 'Phytotherapy', 2377, NULL::numeric),
  ('Political Science And International Relations', 'PhD', 'English', 1510, 4, true, 'Political Science And International Relations', 1510, NULL::numeric),
  ('Preschool Education', 'PhD', 'English', 1510, 4, true, 'Preschool Education', 1510, 2026),
  ('Preschool Education', 'PhD', 'Turkish', 1510, 4, true, 'Preschool Education', 1510, NULL::numeric),
  ('Private Law', 'PhD', 'Turkish', 1510, 4, true, 'Private Law', 1510, NULL::numeric),
  ('Prosthodontics', 'PhD', 'Turkish', 2377, 4, true, 'Prosthodontics', 2377, NULL::numeric),
  ('Public Law', 'PhD', 'Arabic', 1510, 4, true, 'Public Law', 1510, NULL::numeric),
  ('Public Law', 'PhD', 'Turkish', 1510, 4, true, 'Public Law', 1510, NULL::numeric),
  ('Restorative Dentistry', 'PhD', 'Turkish', 2377, 4, true, 'Restorative Dentistry', 2377, NULL::numeric),
  ('Software Engineering', 'PhD', 'English', 1510, 4, true, 'Software Engineering', 1510, NULL::numeric),
  ('Special Education', 'PhD', 'English', 1510, 4, true, 'Special Education', 1510, NULL::numeric),
  ('Special Education', 'PhD', 'Turkish', 1510, 4, true, 'Special Education', 1510, NULL::numeric),
  ('Toxicology', 'PhD', 'English', 2377, 4, true, 'Toxicology', 2377, NULL::numeric),
  ('Toxicology', 'PhD', 'Turkish', 2377, 4, true, 'Toxicology', 2377, NULL::numeric),
  ('Veterinary Internal Medicine', 'PhD', 'English', 2377, 4, true, 'Veterinary Internal Medicine', 62377, NULL::numeric),
  ('Veterinary Microbiology', 'PhD', 'English', 2377, 4, true, 'Veterinary Microbiology', 2377, NULL::numeric),
  ('Zoo Techniques', 'PhD', 'Turkish', 2377, 4, true, 'Zoo Techniques', 2377, 2026)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Near East University'))
  AND p.id IS NULL;


-- İstanbul Bilgi University: 106 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Advertising', 'Bachelor', 'English', 6000, 4, true, 'Advertising', 12000, 2026),
  ('Architecture', 'Bachelor', 'English', 4800, 4, true, 'Architecture', 12000, 2026),
  ('Aviation Management', 'Bachelor', 'English', 6000, 4, true, 'Aviation Management', 12000, NULL::numeric),
  ('Business Administration', 'Bachelor', 'English', 7200, 4, true, 'Business Administration', 12000, NULL::numeric),
  ('Child Development', 'Bachelor', 'English', 6000, 4, true, 'Child Development', 12000, NULL::numeric),
  ('Civil Engineering', 'Bachelor', 'English', 4800, 4, true, 'Civil Engineering', 12000, 2026),
  ('Communication Design And Management', 'Bachelor', 'English', 6000, 4, true, 'Communication Design And Management', 12000, NULL::numeric),
  ('Comparative Literature', 'Bachelor', 'English', 4800, 4, true, 'Comparative Literature', 12000, NULL::numeric),
  ('Computer Engineering', 'Bachelor', 'English', 7800, 4, true, 'Computer Engineering', 12000, NULL::numeric),
  ('Digital Game Design', 'Bachelor', 'English', 7200, 4, true, 'Digital Game Design', 12000, NULL::numeric),
  ('Economics', 'Bachelor', 'English', 7200, 4, true, 'Economics', 12000, 2026),
  ('Economics And Finance', 'Bachelor', 'English', 7200, 4, true, 'Economics And Finance', 12000, NULL::numeric),
  ('Electrical And Electronic Engineering', 'Bachelor', 'English', 4800, 4, true, 'Electrical And Electronic Engineering', 12000, 2026),
  ('English Language And Literature', 'Bachelor', 'English', 4800, 4, true, 'English Language And Literature', 12000, NULL::numeric),
  ('Fashion And Textile Design', 'Bachelor', 'English', 6000, 4, true, 'Fashion And Textile Design', 12000, 2026),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 6000, 4, true, 'Gastronomy And Culinary Arts', 12000, 2026),
  ('Genetics And Bioengineering', 'Bachelor', 'English', 4800, 4, true, 'Genetics And Bioengineering', 12000, 2026),
  ('History', 'Bachelor', 'English', 4800, 4, true, 'History', 12000, NULL::numeric),
  ('Industrial Design', 'Bachelor', 'English', 7200, 4, true, 'Industrial Design', 12000, NULL::numeric),
  ('Industrial Engineering', 'Bachelor', 'English', 7800, 4, true, 'Industrial Engineering', 12000, NULL::numeric),
  ('Interior Design', 'Bachelor', 'English', 7200, 4, true, 'Interior Design', 12000, NULL::numeric),
  ('International Finance', 'Bachelor', 'English', 7200, 4, true, 'International Finance', 12000, NULL::numeric),
  ('International Relations', 'Bachelor', 'English', 6600, 4, true, 'International Relations', 12000, 2026),
  ('International Trade And Business', 'Bachelor', 'English', 7200, 4, true, 'International Trade And Business', 12000, NULL::numeric),
  ('Law', 'Bachelor', 'English', 9600, 4, true, 'Law', 12000, 2026),
  ('Logistics Management', 'Bachelor', 'English', 6000, 4, true, 'Logistics Management', 12000, NULL::numeric),
  ('Management Information Systems', 'Bachelor', 'English', 7200, 4, true, 'Management Information Systems', 12000, NULL::numeric),
  ('Management Of Performing Arts', 'Bachelor', 'English', 6000, 4, true, 'Management Of Performing Arts', 12000, NULL::numeric),
  ('Marketing', 'Bachelor', 'English', 7200, 4, true, 'Marketing', 12000, 2026),
  ('Mathematics', 'Bachelor', 'English', 4800, 4, true, 'Mathematics', 12000, NULL::numeric),
  ('Mechanical Engineering', 'Bachelor', 'English', 4800, 4, true, 'Mechanical Engineering', 12000, 2026),
  ('Mechatronics Engineering', 'Bachelor', 'English', 6000, 4, true, 'Mechatronics Engineering', 12000, 2026),
  ('Music', 'Bachelor', 'English', 6600, 4, true, 'Music', 12000, 2026),
  ('New Media And Communication', 'Bachelor', 'English', 6000, 4, true, 'New Media And Communication', 12000, 2026),
  ('Nursing', 'Bachelor', 'English', 6000, 4, true, 'Nursing', 12000, 2026),
  ('Physiotherapy And Rehabilitation', 'Bachelor', 'Turkish', 6000, 4, true, 'Physiotherapy And Rehabilitation', 12000, NULL::numeric),
  ('Political Science And Public Administration', 'Bachelor', 'Turkish', 6600, 4, true, 'Political Science And Public Administration', 12000, 2026),
  ('Psychology', 'Bachelor', 'Turkish', 7800, 4, true, 'Psychology', 12000, 2026),
  ('Public Relations And Publicity', 'Bachelor', 'Turkish', 6000, 4, true, 'Public Relations And Publicity', 12000, NULL::numeric),
  ('Radio Television And Film', 'Bachelor', 'English', 6000, 4, true, 'Radio Television And Film', 12000, NULL::numeric),
  ('Sociology', 'Bachelor', 'English', 4800, 4, true, 'Sociology', 12000, NULL::numeric),
  ('Visual Communication Design', 'Bachelor', 'English', 6000, 4, true, 'Visual Communication Design', 12000, NULL::numeric),
  ('Audiometry', 'Diploma', 'Turkish', 3000, 2, true, 'Audiometry', 3000, 2026),
  ('Banking And Insurance', 'Diploma', 'Turkish', 3000, 2, true, 'Banking And Insurance', 3000, NULL::numeric),
  ('Business Administration', 'Diploma', 'Turkish', 3000, 2, true, 'Business Administration', 3000, 2026),
  ('Child Development ( Evening Class)', 'Diploma', 'Turkish', 3000, 2, true, 'Child Development ( Evening Class)', 3000, NULL::numeric),
  ('Civil Aviation Cabin Services', 'Diploma', 'Turkish', 3000, 2, true, 'Civil Aviation Cabin Services', 3000, 2026),
  ('Civil Aviation Transportation Management', 'Diploma', 'Turkish', 3000, 2, true, 'Civil Aviation Transportation Management', 3000, NULL::numeric),
  ('Computer Programming', 'Diploma', 'Turkish', 3000, 2, true, 'Computer Programming', 3000, NULL::numeric),
  ('Construction Technology', 'Diploma', 'Turkish', 3000, 2, false, 'Construction Technology', 3000, 2026),
  ('Cooking', 'Diploma', 'Turkish', 3000, 2, true, 'Cooking', 3000, 2026),
  ('Dental Prosthesis', 'Diploma', 'Turkish', 3000, 2, false, 'Dental Prosthesis', 3000, NULL::numeric),
  ('Dialysis', 'Diploma', 'Turkish', 3000, 2, true, 'Dialysis', 3000, 2026),
  ('Emergency And Disaster Management', 'Diploma', 'Turkish', 3000, 2, true, 'Emergency And Disaster Management', 3000, 2026),
  ('Fashion Design', 'Diploma', 'Turkish', 3000, 2, true, 'Fashion Design', 3000, 2026),
  ('First And Emergency Aid', 'Diploma', 'Turkish', 3000, 2, true, 'First And Emergency Aid', 3000, 2026),
  ('Graphic Design', 'Diploma', 'Turkish', 3000, 2, true, 'Graphic Design', 3000, 2026),
  ('Information Security Technologies', 'Diploma', 'Turkish', 3000, 2, true, 'Information Security Technologies', 3000, 2026),
  ('Interior Space Design', 'Diploma', 'Turkish', 3000, 2, true, 'Interior Space Design', 3000, 2026),
  ('International Trade', 'Diploma', 'Turkish', 3500, 2, false, 'International Trade', 3500, 2026),
  ('Justice', 'Diploma', 'Turkish', 3000, 2, true, 'Justice', 3000, 2026),
  ('Medical Imaging Techniques', 'Diploma', 'Turkish', 3000, 2, true, 'Medical Imaging Techniques', 3000, NULL::numeric),
  ('Operating Room Services', 'Diploma', 'Turkish', 3000, 2, true, 'Operating Room Services', 3000, 2026),
  ('Oral And Dental Health', 'Diploma', 'Turkish', 3000, 2, false, 'Oral And Dental Health', 3000, 2026),
  ('Pathology Laboratory Techniques', 'Diploma', 'Turkish', 3000, 2, true, 'Pathology Laboratory Techniques', 3000, 2026),
  ('Physiotherapy', 'Diploma', 'Turkish', 3000, 2, true, 'Physiotherapy', 3000, 2026),
  ('Public Relations And Advertising', 'Diploma', 'Turkish', 3500, 2, true, 'Public Relations And Advertising', 3500, NULL::numeric),
  ('Architectural Design', 'Master', 'English', 12500, 1, true, 'Architectural Design', 12500, NULL::numeric),
  ('Banking And Finance ( De)', 'Master', 'Turkish', 10000, 1, true, 'Banking And Finance ( De)', 10000, 2026),
  ('Bioengineering With Thesis', 'Master', 'English', 12500, 2, true, 'Bioengineering With Thesis', 12500, NULL::numeric),
  ('Business Administration', 'Master', 'English', 15000, 1, true, 'Business Administration', 15000, NULL::numeric),
  ('Business Administration (De)', 'Master', 'English', 11000, 1, true, 'Business Administration (De)', 11000, 2026),
  ('Business Administration (De)', 'Master', 'Turkish', 10000, 1, true, 'Business Administration (De)', 10000, 2026),
  ('Business Administration With Thesis', 'Master', 'Turkish', 15000, 2, true, 'Business Administration With Thesis', 15000, 2026),
  ('Cultural Management', 'Master', 'English', 10000, 1, true, 'Cultural Management', 10000, 2026),
  ('Cultural Management With Thesis', 'Master', 'English', 10000, 2, true, 'Cultural Management With Thesis', 10000, 2026),
  ('Cultural Studies With Thesis', 'Master', 'English', 9000, 2, true, 'Cultural Studies With Thesis', 9000, NULL::numeric),
  ('Economics', 'Master', 'English', 12500, 2, true, 'Economics', 12500, 2026),
  ('Electrical And Electronic Engineering With The', 'Master', 'English', 12500, 2, true, 'Electrical And Electronic Engineering With The', 12500, NULL::numeric),
  ('Financial Economics With Thesis', 'Master', 'English', 12500, 2, true, 'Financial Economics With Thesis', 12500, NULL::numeric),
  ('History', 'Master', 'English', 9000, 1, true, 'History', 9000, NULL::numeric),
  ('Human Resource Management (De)', 'Master', 'Turkish', 10000, 1, true, 'Human Resource Management (De)', 10000, 2026),
  ('Human Rights Law', 'Master', 'Turkish', 12500, 1, true, 'Human Rights Law', 12500, NULL::numeric),
  ('Human Rights Law With Thesis', 'Master', 'Turkish', 12500, 2, true, 'Human Rights Law With Thesis', 12500, NULL::numeric),
  ('Information Technology Law', 'Master', 'Turkish', 13000, 1, true, 'Information Technology Law', 13000, 2026),
  ('Information Technology Law With Thesis', 'Master', 'Turkish', 13000, 2, true, 'Information Technology Law With Thesis', 13000, 2026),
  ('Management Information Systems (De)', 'Master', 'Turkish', 10000, 1, true, 'Management Information Systems (De)', 10000, NULL::numeric),
  ('Marketing', 'Master', 'English', 12500, 1, true, 'Marketing', 12500, NULL::numeric),
  ('Marketing Communication', 'Master', 'Turkish', 12500, 1, true, 'Marketing Communication', 12500, NULL::numeric),
  ('Marketing With Thesis', 'Master', 'English', 12500, 2, true, 'Marketing With Thesis', 12500, NULL::numeric),
  ('Media And Communication Studies With Thesi', 'Master', 'English', 12500, 2, true, 'Media And Communication Studies With Thesi', 12500, NULL::numeric),
  ('Nutntion And Dietetics', 'Master', 'Turkish', 10000, 1, true, 'Nutntion And Dietetics', 10000, NULL::numeric),
  ('Organizational Psychology With Thesis', 'Master', 'English', 14000, 2, true, 'Organizational Psychology With Thesis', 14000, NULL::numeric),
  ('Physiotherapy And Rehabilitation', 'Master', 'Turkish', 10000, 1, true, 'Physiotherapy And Rehabilitation', 10000, NULL::numeric),
  ('Political Science And International Relations', 'Master', 'English', 10000, 1, true, 'Political Science And International Relations', 10000, NULL::numeric),
  ('Political Science And International Relations W', 'Master', 'English', 10000, 1, true, 'Political Science And International Relations W', 10000, NULL::numeric),
  ('Private Law', 'Master', 'Turkish', 12500, 1, true, 'Private Law', 12500, 2026),
  ('Television And Film', 'Master', 'English', 10000, 1, true, 'Television And Film', 10000, NULL::numeric),
  ('Television And Film With Thesis', 'Master', 'English', 10000, 2, true, 'Television And Film With Thesis', 10000, NULL::numeric),
  ('Trauma and Disaster Mental Health With Thesis', 'Master', 'Turkish', 14000, 2, true, 'Trauma and Disaster Mental Health With Thesis', 14000, NULL::numeric),
  ('Business Administration', 'PhD', 'English', 18000, 4, true, 'Business Administration', 18000, 2026),
  ('Communications Sciences', 'PhD', 'English', 18000, 4, true, 'Communications Sciences', 18000, 2026),
  ('Economics', 'PhD', 'English', 18000, 4, true, 'Economics', 18000, 2026),
  ('Political Science', 'PhD', 'English', 18000, 4, true, 'Political Science', 18000, 2026),
  ('Private Law', 'PhD', 'Turkish', 18000, 4, true, 'Private Law', 18000, 2026),
  ('Public Law', 'PhD', 'Turkish', 18000, 4, true, 'Public Law', 18000, 2026)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('İstanbul Bilgi University'))
  AND p.id IS NULL;


-- İstanbul Gelişim University: 7 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Business Administration With Thesis', 'Master', 'Turkish', 5500, 2, true, 'Business Administration With Thesis', 9000, 2000),
  ('Civil Engineering With Thesis', 'Master', 'English', 6500, 2, true, 'Civil Engineering With Thesis', 6000, 4500),
  ('Clinical Psychology', 'Master', 'Turkish', 60000, 1, true, 'Clinical Psychology', 10000, 2000),
  ('Economics And Finance', 'Master', 'Turkish', 4500, 1, true, 'Economics And Finance', 7000, 2000),
  ('Health Mangement', 'Master', 'Turkish', 4500, 1, true, 'Health Mangement', 7000, 2000),
  ('Political Science And Public Administration', 'Master', 'English', 5000, 1, true, 'Political Science And Public Administration', 7000, 4500),
  ('Security Studies With Thesis', 'Master', 'Turkish', 5000, 2, true, 'Security Studies With Thesis', 7000, 2000)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('İstanbul Gelişim University'))
  AND p.id IS NULL;


-- Refresh programs_count from actual rows
UPDATE university u SET programs_count = sub.cnt
FROM (SELECT university_id, COUNT(*) AS cnt FROM program GROUP BY university_id) sub
WHERE u.id = sub.university_id
  AND lower(trim(u.name)) IN ('Atlas University', 'Beykoz University', 'Eastern Mediterranean University', 'Girne American University', 'Medipol Ankara University', 'Near East University', 'İstanbul Bilgi University', 'İstanbul Gelişim University');
