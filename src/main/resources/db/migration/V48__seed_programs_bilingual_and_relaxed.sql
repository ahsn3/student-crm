-- V48: bilingual language variants + relaxed OCR (target 4600–4800 total programs).
-- New rows in this migration: 806


-- Altınbaş University: 39 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'Bachelor', 'Turkish', 5100, 4, true, 'Architecture', 6000, 4800),
  ('Business Administration', 'Bachelor', 'Turkish', 5100, 4, true, 'Business Administration', 6000, 4800),
  ('Civil Engineering', 'Bachelor', 'Turkish', 5100, 4, true, 'Civil Engineering', 6000, 4800),
  ('Computer Engineering', 'Bachelor', 'Turkish', 5100, 4, true, 'Computer Engineering', 6000, 4800),
  ('Dentistry', 'Bachelor', 'Turkish', 19800, 5, true, 'Dentistry', 22000, 18700),
  ('Economics', 'Bachelor', 'Turkish', 4250, 4, true, 'Economics', 5000, 4000),
  ('Electrical And Electronic Engineering', 'Bachelor', 'Turkish', 5100, 4, true, 'Electrical And Electronic Engineering', 6000, 4800),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 4250, 4, true, 'Gastronomy And Culinary Arts', 5000, 4000),
  ('Healthcare Management', 'Bachelor', 'English', 4250, 4, true, 'Healthcare Management', 5000, 4000),
  ('Industrial Engineering', 'Bachelor', 'Turkish', 5100, 4, true, 'Industrial Engineering', 6000, 4800),
  ('International Relations', 'Bachelor', 'Turkish', 4250, 4, true, 'International Relations', 5000, 4000),
  ('International Trade And Finance', 'Bachelor', 'Turkish', 4250, 4, true, 'International Trade And Finance', 5000, 4000),
  ('Management Information Systems', 'Bachelor', 'English', 4250, 4, true, 'Management Information Systems', 5000, 4000),
  ('Marketing', 'Bachelor', 'Turkish', 5100, 4, true, 'Marketing', 6000, 4800),
  ('Mechanical Engineering', 'Bachelor', 'Turkish', 5100, 4, true, 'Mechanical Engineering', 6000, 4800),
  ('Medicine', 'Bachelor', 'Turkish', 22500, 6, true, 'Medicine', 25000, 21250),
  ('Political Science And Public Administration', 'Bachelor', 'Turkish', 4250, 4, true, 'Political Science And Public Administration', 5000, 4000),
  ('Psychology', 'Bachelor', 'Turkish', 5100, 4, true, 'Psychology', 6000, 4800),
  ('Radio Television And Film', 'Bachelor', 'English', 4250, 4, true, 'Radio Television And Film', 5000, 4000),
  ('Sociology', 'Bachelor', 'Turkish', 4250, 4, true, 'Sociology', 5000, 4000),
  ('Software Engineering', 'Bachelor', 'Turkish', 5100, 4, true, 'Software Engineering', 6000, 4800),
  ('Accounting And Auditing With Thesis', 'Master', 'English', 5865, 2, true, 'Accounting And Auditing With Thesis', 6900, 5520),
  ('Architecture With Thesis', 'Master', 'Turkish', 5865, 2, true, 'Architecture With Thesis', 6900, 5520),
  ('Arts And Design With Thesis', 'Master', 'English', 5865, 2, true, 'Arts And Design With Thesis', 6900, 5520),
  ('Cilinical Psychology With Thesis', 'Master', 'English', 25000, 2, true, 'Cilinical Psychology With Thesis', 25000, NULL::numeric),
  ('Civil Engineering With Thesis', 'Master', 'Turkish', 5865, 2, true, 'Civil Engineering With Thesis', 6900, 5520),
  ('Clinical Periodontology With Thesis', 'Master', 'English', 16200, 2, true, 'Clinical Periodontology With Thesis', 16200, NULL::numeric),
  ('Financial Economics With Thesis', 'Master', 'English', 5865, 2, true, 'Financial Economics With Thesis', 6900, 5520),
  ('Histology And Embryology With Thesis', 'Master', 'English', 6900, 2, true, 'Histology And Embryology With Thesis', 6900, NULL::numeric),
  ('Internaltional Taxation With Thesis', 'Master', 'English', 5865, 2, true, 'Internaltional Taxation With Thesis', 6900, 5520),
  ('International Taxation With Thesis', 'Master', 'Turkish', 5865, 2, true, 'International Taxation With Thesis', 6900, 5520),
  ('International Trade Law With Thesis', 'Master', 'English', 5865, 2, true, 'International Trade Law With Thesis', 6900, 5520),
  ('Mechanical Engineering With Thesis', 'Master', 'Turkish', 5865, 2, true, 'Mechanical Engineering With Thesis', 6900, 2026),
  ('Orthodontics With Thesis', 'Master', 'Turkish', 25000, 2, true, 'Orthodontics With Thesis', 25000, 2026),
  ('Pediatric Dentistry With Thesis', 'Master', 'English', 16200, 2, true, 'Pediatric Dentistry With Thesis', 16200, NULL::numeric),
  ('Periodontology', 'Master', 'English', 16200, 3, true, 'Periodontology', 16200, NULL::numeric),
  ('Psychology With Thesis', 'Master', 'English', 10625, 2, true, 'Psychology With Thesis', 12500, 10000),
  ('Public Law With Thesis', 'Master', 'English', 5865, 2, true, 'Public Law With Thesis', 6900, 5520),
  ('Strategic Marketing And Brand Management W', 'Master', 'English', 5865, 2, true, 'Strategic Marketing And Brand Management W', 6900, 5520)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Altınbaş University'))
  AND p.id IS NULL;


-- Aydın University: 190 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('9găo', 'Bachelor', 'English', 6500, 4, true, '9găo', 6500, 5850),
  ('Accounting And Finance Management', 'Bachelor', 'English', 5000, 4, false, 'Accounting And Finance Management', 5000, 4500),
  ('Acting', 'Bachelor', 'English', 5000, 4, true, 'Acting', 5000, 4500),
  ('Advertising', 'Bachelor', 'English', 5000, 4, true, 'Advertising', 5000, 4500),
  ('Aerospace Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Aerospace Engineering', 6500, 5850),
  ('Artificial Intelligence And Data Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Artificial Intelligence And Data Engineering', 6500, 5850),
  ('Audiology', 'Bachelor', 'English', 6500, 4, true, 'Audiology', 6500, 5850),
  ('Aviation Electrics And Electronics (Avionics)', 'Bachelor', 'Turkish', 6500, 4, true, 'Aviation Electrics And Electronics (Avionics)', 6500, 5850),
  ('Aviation Management', 'Bachelor', 'Turkish', 6000, 4, true, 'Aviation Management', 6000, 5400),
  ('Banking And Finance', 'Bachelor', 'Turkish', 2600, 4, true, 'Banking And Finance', 10600, NULL::numeric),
  ('Cartoon And Animation', 'Bachelor', 'English', 5000, 4, true, 'Cartoon And Animation', 5000, 4500),
  ('Child Development', 'Bachelor', 'English', 6500, 4, true, 'Child Development', 6500, 5850),
  ('Civil Aviation Cabin Services', 'Bachelor', 'Turkish', 2600, 4, true, 'Civil Aviation Cabin Services', 10600, NULL::numeric),
  ('Computer Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Computer Engineering', 6500, 5850),
  ('Dentistry', 'Bachelor', 'Turkish', 23000, 5, true, 'Dentistry', 23000, 21850),
  ('Digital Game Design', 'Bachelor', 'English', 5000, 4, true, 'Digital Game Design', 5000, 4500),
  ('Electrical And Electronic Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Electrical And Electronic Engineering', 6500, 5850),
  ('English Language And Literature', 'Bachelor', 'Turkish', 5000, 4, true, 'English Language And Literature', 5000, 4500),
  ('English Language Teaching', 'Bachelor', 'Turkish', 2600, 4, true, 'English Language Teaching', 10600, NULL::numeric),
  ('Fashion And Textile Design', 'Bachelor', 'English', 5000, 4, true, 'Fashion And Textile Design', 5000, 4500),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 5000, 4, false, 'Gastronomy And Culinary Arts', 5000, 4500),
  ('Graphic Design', 'Bachelor', 'English', 5000, 4, true, 'Graphic Design', 5000, 4500),
  ('Guidance And Psychological Counseling', 'Bachelor', 'English', 5000, 4, true, 'Guidance And Psychological Counseling', 5000, 4500),
  ('Health Management', 'Bachelor', 'English', 6500, 4, true, 'Health Management', 6500, 5850),
  ('History', 'Bachelor', 'English', 5000, 4, true, 'History', 5000, 4500),
  ('Industrial Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Industrial Engineering', 6500, 5850),
  ('Industrial Product Design', 'Bachelor', 'English', 5000, 4, true, 'Industrial Product Design', 5000, 4500),
  ('Information Security Engineering', 'Bachelor', 'Turkish', 2600, 4, true, 'Information Security Engineering', 10600, NULL::numeric),
  ('Interior Architecture', 'Bachelor', 'English', 5000, 4, true, 'Interior Architecture', 5000, 4500),
  ('Interior Architecture And Environmental Desig', 'Bachelor', 'English', 2600, 4, true, 'Interior Architecture And Environmental Desig', 10600, NULL::numeric),
  ('Interior Architecture And Environmental Desig!', 'Bachelor', 'English', 2600, 4, true, 'Interior Architecture And Environmental Desig!', 10600, NULL::numeric),
  ('International Law', 'Bachelor', 'Turkish', 2600, 4, true, 'International Law', 10600, NULL::numeric),
  ('International Relations', 'Bachelor', 'Turkish', 2600, 4, true, 'International Relations', 10600, NULL::numeric),
  ('International Trade', 'Bachelor', 'Turkish', 6000, 4, true, 'International Trade', 6000, 5400),
  ('Journalism', 'Bachelor', 'English', 5000, 4, true, 'Journalism', 5000, 4500),
  ('Law', 'Bachelor', 'English', 2600, 4, true, 'Law', 10600, NULL::numeric),
  ('Mechatronics Engineering', 'Bachelor', 'Turkish', 2600, 4, true, 'Mechatronics Engineering', 10600, NULL::numeric),
  ('Midwifery', 'Bachelor', 'English', 6500, 4, true, 'Midwifery', 6500, 5850),
  ('Molecular Biology And Genetics', 'Bachelor', 'Turkish', 6000, 4, true, 'Molecular Biology And Genetics', 6000, 5400),
  ('New Media And Communication', 'Bachelor', 'English', 5000, 4, true, 'New Media And Communication', 5000, 4500),
  ('Physical Education And Sports Teaching', 'Bachelor', 'English', 5000, 4, true, 'Physical Education And Sports Teaching', 5000, 4500),
  ('Pilotage', 'Bachelor', 'Turkish', 8000, 4, true, 'Pilotage', 8000, 7200),
  ('Political Science And Public Administration', 'Bachelor', 'Turkish', 2600, 4, true, 'Political Science And Public Administration', 10600, NULL::numeric),
  ('Public Administration', 'Bachelor', 'English', 5000, 4, true, 'Public Administration', 5000, 4500),
  ('Public Relations And Presentation', 'Bachelor', 'English', 5000, 4, true, 'Public Relations And Presentation', 5000, 4500),
  ('Recreation', 'Bachelor', 'English', 5000, 4, true, 'Recreation', 5000, 4500),
  ('Social Services', 'Bachelor', 'English', 6500, 4, true, 'Social Services', 6500, 5850),
  ('Sociology', 'Bachelor', 'English', 5000, 4, true, 'Sociology', 5000, 4500),
  ('Software Development', 'Bachelor', 'Turkish', 6500, 4, true, 'Software Development', 6500, 5850),
  ('Software Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Software Engineering', 6500, 5850),
  ('Special Education Teacher', 'Bachelor', 'English', 5000, 4, true, 'Special Education Teacher', 5000, 4500),
  ('Sports Management', 'Bachelor', 'English', 5000, 4, true, 'Sports Management', 5000, 4500),
  ('Teacher Training At Pre-School Level', 'Bachelor', 'English', 5000, 4, false, 'Teacher Training At Pre-School Level', 5000, 4500),
  ('Teacher Training At Primary School Level', 'Bachelor', 'English', 5000, 4, false, 'Teacher Training At Primary School Level', 5000, 4500),
  ('Teacher Training In English', 'Bachelor', 'Turkish', 5000, 4, true, 'Teacher Training In English', 5000, 4500),
  ('Teacher Training In Turkish', 'Bachelor', 'English', 5000, 4, true, 'Teacher Training In Turkish', 5000, 4500),
  ('Teacher Training in Mathematics at Primary Sch', 'Bachelor', 'English', 5000, 4, true, 'Teacher Training in Mathematics at Primary Sch', 5000, 4500),
  ('Television News And Programming', 'Bachelor', 'English', 5000, 4, true, 'Television News And Programming', 5000, 4500),
  ('Tourism And Hotel Management', 'Bachelor', 'Turkish', 2600, 4, true, 'Tourism And Hotel Management', 10600, NULL::numeric),
  ('Translation And Interpretation (English)', 'Bachelor', 'English', 5000, 4, true, 'Translation And Interpretation (English)', 5000, 4500),
  ('Turkish Language And Literature', 'Bachelor', 'English', 5000, 4, true, 'Turkish Language And Literature', 5000, 4500),
  ('Turkish Language Teaching', 'Bachelor', 'English', 2600, 4, true, 'Turkish Language Teaching', 10600, NULL::numeric),
  ('clectical And blectone cncineering', 'Bachelor', 'Turkish', 2600, 4, true, 'clectical And blectone cncineering', 10600, NULL::numeric),
  ('Administration', 'CombinedPhD', 'Turkish', 12500, 4, true, 'Administration', 12500, 2026),
  ('Management', 'CombinedPhD', 'Turkish', 15000, 5, true, 'Management', 15000, 14250),
  ('Management', 'CombinedPhD', 'English', 19000, 5, true, 'Management', 20000, 2026),
  ('Acting With Thesis', 'Master', 'English', 9000, 2, true, 'Acting With Thesis', 9000, 8100),
  ('Addiction Consultancy And Rehabilitation With', 'Master', 'English', 67600, 1, false, 'Addiction Consultancy And Rehabilitation With', 67600, NULL::numeric),
  ('Addiction Counseling And Rehabilitation', 'Master', 'English', 3400, 1, false, 'Addiction Counseling And Rehabilitation', 7600, NULL::numeric),
  ('Aerospace Engineering', 'Master', 'Turkish', 10000, 1, true, 'Aerospace Engineering', 10000, 9000),
  ('Aerospace Engineering With Thesis', 'Master', 'Turkish', 12000, 2, true, 'Aerospace Engineering With Thesis', 12000, 10800),
  ('Arabic Language Training', 'Master', 'English', 8000, 1, true, 'Arabic Language Training', 8000, 7200),
  ('Arabic Language Training With Thesis', 'Master', 'English', 9000, 2, true, 'Arabic Language Training With Thesis', 9000, 8100),
  ('Architectural Design', 'Master', 'English', 8000, 1, true, 'Architectural Design', 8000, 7200),
  ('Architectural Design With Thesis', 'Master', 'English', 9000, 2, true, 'Architectural Design With Thesis', 9000, 8100),
  ('Architecture', 'Master', 'English', 8000, 1, true, 'Architecture', 8000, 7200),
  ('Architecture With Thesis', 'Master', 'English', 9000, 2, true, 'Architecture With Thesis', 9000, 8100),
  ('Artificial Intelligence And Data Science With Tr', 'Master', 'Turkish', 12000, 2, true, 'Artificial Intelligence And Data Science With Tr', 12000, 6000),
  ('Audiology With Thesis', 'Master', 'English', 10000, 2, true, 'Audiology With Thesis', 10000, 9000),
  ('Banking And Finance', 'Master', 'Turkish', 3400, 1, true, 'Banking And Finance', 7600, NULL::numeric),
  ('Banking And Finance (De)', 'Master', 'English', 8000, 1, true, 'Banking And Finance (De)', 8000, 7200),
  ('Banking And Finance With Thesis', 'Master', 'Turkish', 3400, 2, true, 'Banking And Finance With Thesis', 7600, NULL::numeric),
  ('Banking And Insurance', 'Master', 'English', 8000, 1, true, 'Banking And Insurance', 8000, 7200),
  ('Banking And Insurance With Thesis', 'Master', 'English', 9000, 2, true, 'Banking And Insurance With Thesis', 9000, 8100),
  ('Biotechnology', 'Master', 'English', 8000, 1, true, 'Biotechnology', 8000, 7200),
  ('Biotechnology With Thesis', 'Master', 'English', 9000, 2, true, 'Biotechnology With Thesis', 9000, 8100),
  ('Business Administration', 'Master', 'English', 3400, 1, true, 'Business Administration', 67600, NULL::numeric),
  ('Business Administration (De)', 'Master', 'Turkish', 10000, 1, true, 'Business Administration (De)', 10000, 9000),
  ('Business Management For Business Manager', 'Master', 'English', 8000, 1, true, 'Business Management For Business Manager', 8000, 7200),
  ('Child Development', 'Master', 'English', 8000, 1, true, 'Child Development', 8000, 7200),
  ('Child Development With Thesis', 'Master', 'English', 9000, 2, true, 'Child Development With Thesis', 9000, 8100),
  ('Civil Engineering', 'Master', 'Turkish', 10000, 1, true, 'Civil Engineering', 10000, 6000),
  ('Civil Engineering Construction And Project Ma', 'Master', 'English', 8000, 1, true, 'Civil Engineering Construction And Project Ma', 8000, 7200),
  ('Clinical Psychology', 'Master', 'English', 11000, 1, true, 'Clinical Psychology', 11000, 9900),
  ('Clinical Psychology With Thesis', 'Master', 'English', 11000, 2, true, 'Clinical Psychology With Thesis', 11000, 9900),
  ('Computer Engineering', 'Master', 'Turkish', 10000, 1, true, 'Computer Engineering', 10000, 9000),
  ('Cyber Security', 'Master', 'Turkish', 10000, 1, true, 'Cyber Security', 10000, 9000),
  ('Digital Marketing (DE)', 'Master', 'English', 8000, 1, true, 'Digital Marketing (DE)', 8000, 7200),
  ('E - Business Management (De)', 'Master', 'English', 8000, 1, true, 'E - Business Management (De)', 8000, 7200),
  ('Earthquake And Structural Engineering', 'Master', 'English', 8000, 1, true, 'Earthquake And Structural Engineering', 8000, 7200),
  ('Earthquake And Structural Engineering With Th', 'Master', 'English', 9000, 1, true, 'Earthquake And Structural Engineering With Th', 9000, 8100),
  ('Education Management', 'Master', 'English', 8000, 1, true, 'Education Management', 8000, 7200),
  ('Education Management With Thesis', 'Master', 'English', 9000, 2, true, 'Education Management With Thesis', 9000, 8100),
  ('Educational Technology And Educational Desig', 'Master', 'English', 8000, 1, true, 'Educational Technology And Educational Desig', 8000, 7200),
  ('Electrical And Electronic Engineering', 'Master', 'Turkish', 10000, 1, true, 'Electrical And Electronic Engineering', 10000, 9000),
  ('Elementary Education', 'Master', 'English', 8000, 1, true, 'Elementary Education', 8000, 7200),
  ('Elementary Education With Thesis', 'Master', 'English', 9000, 2, true, 'Elementary Education With Thesis', 9000, 8100),
  ('Energy Technologies', 'Master', 'Turkish', 10000, 1, true, 'Energy Technologies', 10000, 9000),
  ('Energy Technologies With Thesis', 'Master', 'Turkish', 12000, 2, true, 'Energy Technologies With Thesis', 12000, 10800),
  ('English Language And Literature With Thesis', 'Master', 'English', 12000, 2, true, 'English Language And Literature With Thesis', 12000, 10800),
  ('English Language Teaching', 'Master', 'English', 10000, 1, true, 'English Language Teaching', 10000, 3000),
  ('English Language Teaching With Thesis', 'Master', 'English', 12000, 2, true, 'English Language Teaching With Thesis', 12000, 10800),
  ('English language and literature', 'Master', 'Turkish', 10000, 1, true, 'English language and literature', 10000, 9000),
  ('Entrepreneurship And Innovation Management', 'Master', 'Turkish', 12000, 1, true, 'Entrepreneurship And Innovation Management', 12000, 6000),
  ('Family Counseling', 'Master', 'English', 9000, 1, true, 'Family Counseling', 9000, 8100),
  ('Family Counseling With Thesis', 'Master', 'English', 10000, 2, true, 'Family Counseling With Thesis', 10000, 9000),
  ('Food Safety With Thesis', 'Master', 'English', 9000, 2, true, 'Food Safety With Thesis', 9000, 8100),
  ('Gastronomy And Culinary Arts', 'Master', 'English', 8000, 1, true, 'Gastronomy And Culinary Arts', 8000, 7200),
  ('Gastronomy And Culinary Arts With Thesis', 'Master', 'English', 9000, 2, true, 'Gastronomy And Culinary Arts With Thesis', 9000, 8100),
  ('Graphic Design', 'Master', 'English', 8000, 1, true, 'Graphic Design', 8000, 7200),
  ('Graphic Design With Thesis', 'Master', 'English', 9000, 2, true, 'Graphic Design With Thesis', 9000, 8100),
  ('Guidance And Psychological Counseling', 'Master', 'English', 3400, 1, true, 'Guidance And Psychological Counseling', 7600, NULL::numeric),
  ('Guidance And Psychological Counseling With', 'Master', 'English', 3400, 1, true, 'Guidance And Psychological Counseling With', 7600, NULL::numeric),
  ('Health Management With Thesis', 'Master', 'English', 10000, 2, true, 'Health Management With Thesis', 10000, 3000),
  ('Health Mangement', 'Master', 'English', 90000, 1, true, 'Health Mangement', 90000, 81000),
  ('Health Physics With Thesis', 'Master', 'English', 10000, 2, true, 'Health Physics With Thesis', 10000, 9000),
  ('History With Thesis', 'Master', 'English', 9000, 2, true, 'History With Thesis', 9000, 8100),
  ('Human Resource Management', 'Master', 'English', 8000, 1, true, 'Human Resource Management', 8000, 7200),
  ('Human Resource Management With Thesis', 'Master', 'English', 9000, 2, true, 'Human Resource Management With Thesis', 9000, 8100),
  ('Industrial Engineering', 'Master', 'Turkish', 10000, 1, true, 'Industrial Engineering', 10000, 9000),
  ('Industrial Engineering With Thesis', 'Master', 'Turkish', 12000, 2, true, 'Industrial Engineering With Thesis', 12000, 10800),
  ('Information Technology Law With Thesis', 'Master', 'English', 9000, 2, true, 'Information Technology Law With Thesis', 9000, 8100),
  ('International Relations And Intelligence Studie:', 'Master', 'English', 9000, 2, true, 'International Relations And Intelligence Studie:', 9000, 8100),
  ('International Relations And Terrorism Research', 'Master', 'English', 9000, 2, true, 'International Relations And Terrorism Research', 9000, 8100),
  ('Journalism', 'Master', 'English', 8000, 1, true, 'Journalism', 8000, 7200),
  ('Local Goverments And Decentralization', 'Master', 'English', 8000, 1, true, 'Local Goverments And Decentralization', 8000, 7200),
  ('Local Goverments And Decentralization (De)', 'Master', 'English', 8000, 1, true, 'Local Goverments And Decentralization (De)', 8000, 7200),
  ('Local Goverments And Decentralization With T', 'Master', 'English', 9000, 2, true, 'Local Goverments And Decentralization With T', 9000, 8100),
  ('Marketing', 'Master', 'Turkish', 3400, 1, true, 'Marketing', 7600, NULL::numeric),
  ('Marketing With Thesis', 'Master', 'Turkish', 3400, 2, true, 'Marketing With Thesis', 7600, NULL::numeric),
  ('Measurement And Evaluation Education With 1', 'Master', 'English', 9000, 1, true, 'Measurement And Evaluation Education With 1', 9000, 8100),
  ('Medical Microbiology With Thesis', 'Master', 'English', 10000, 2, true, 'Medical Microbiology With Thesis', 10000, 9000),
  ('Medical Pharmacology', 'Master', 'English', 9000, 1, true, 'Medical Pharmacology', 9000, 8100),
  ('Medical Pharmacology With Thesis', 'Master', 'English', 10000, 2, true, 'Medical Pharmacology With Thesis', 10000, 9000),
  ('Molecular Biology And Genetics', 'Master', 'English', 8000, 1, true, 'Molecular Biology And Genetics', 8000, 7200),
  ('Molecular Biology And Genetics With Thesis', 'Master', 'English', 9000, 2, true, 'Molecular Biology And Genetics With Thesis', 9000, 8100),
  ('Molecular Medicine With Thesis', 'Master', 'English', 10000, 2, true, 'Molecular Medicine With Thesis', 10000, 9000),
  ('New Media With Thesis', 'Master', 'English', 9000, 2, true, 'New Media With Thesis', 9000, 8100),
  ('Nursing', 'Master', 'English', 63400, 1, true, 'Nursing', 7600, NULL::numeric),
  ('Nursing With Thesis', 'Master', 'English', 3400, 2, true, 'Nursing With Thesis', 7600, NULL::numeric),
  ('Nursing With nests', 'Master', 'English', 3400, 1, true, 'Nursing With nests', 7600, NULL::numeric),
  ('Nutnition And Dietetics', 'Master', 'English', 9000, 1, true, 'Nutnition And Dietetics', 9000, 8100),
  ('Nutrition And Dietetics With Thesis', 'Master', 'English', 3400, 2, true, 'Nutrition And Dietetics With Thesis', 7600, NULL::numeric),
  ('Occupational Health And Safety', 'Master', 'English', 8000, 1, true, 'Occupational Health And Safety', 8000, 7200),
  ('Occupational Health And Safety With Thesis', 'Master', 'English', 9000, 2, true, 'Occupational Health And Safety With Thesis', 9000, 8100),
  ('Performing Arts With Thesis', 'Master', 'English', 9000, 2, true, 'Performing Arts With Thesis', 9000, 8100),
  ('Philosophy', 'Master', 'English', 8000, 1, true, 'Philosophy', 8000, 7200),
  ('Philosophy With Thesis', 'Master', 'English', 9000, 2, true, 'Philosophy With Thesis', 9000, 8100),
  ('Physical Education And Sports With Thesis', 'Master', 'English', 10000, 2, true, 'Physical Education And Sports With Thesis', 10000, 9000),
  ('Physiotherapy And Rehabilitation', 'Master', 'English', 9000, 1, true, 'Physiotherapy And Rehabilitation', 9000, 8100),
  ('Physiotherapy And Rehabilitation With Thesis', 'Master', 'English', 10000, 2, true, 'Physiotherapy And Rehabilitation With Thesis', 10000, 9000),
  ('Pre-School Education', 'Master', 'English', 8000, 1, true, 'Pre-School Education', 8000, 7200),
  ('Pre-School Education With Thesis', 'Master', 'English', 9000, 2, true, 'Pre-School Education With Thesis', 9000, 8100),
  ('Private Law', 'Master', 'English', 8000, 1, true, 'Private Law', 8000, 7200),
  ('Private Law With Thesis', 'Master', 'English', 9000, 2, true, 'Private Law With Thesis', 9000, 8100),
  ('Project Management', 'Master', 'Turkish', 10000, 1, true, 'Project Management', 10000, 9000),
  ('Project Management With Thesis', 'Master', 'Turkish', 12000, 2, true, 'Project Management With Thesis', 12000, 10800),
  ('Psychological Counseling And Guidance', 'Master', 'English', 8000, 1, true, 'Psychological Counseling And Guidance', 8000, 7200),
  ('Psychological Counselling And Guidance With', 'Master', 'English', 9000, 1, true, 'Psychological Counselling And Guidance With', 9000, 8100),
  ('Public Law', 'Master', 'English', 8000, 1, true, 'Public Law', 8000, 7200),
  ('Public Law With Thesis', 'Master', 'English', 9000, 2, true, 'Public Law With Thesis', 9000, 8100),
  ('Public Relations And Publicity', 'Master', 'English', 8000, 1, true, 'Public Relations And Publicity', 8000, 7200),
  ('Public Relations And Publicity With Thesis', 'Master', 'English', 9000, 2, true, 'Public Relations And Publicity With Thesis', 9000, 8100),
  ('Quality Management And Quality Assurance Sj', 'Master', 'English', 8000, 1, true, 'Quality Management And Quality Assurance Sj', 8000, 7200),
  ('Quality Management And Quality Assurance Sy', 'Master', 'English', 9000, 1, true, 'Quality Management And Quality Assurance Sy', 9000, 8100),
  ('Social Service With Thesis', 'Master', 'English', 10000, 2, true, 'Social Service With Thesis', 10000, 9000),
  ('Social Services', 'Master', 'English', 9000, 1, true, 'Social Services', 9000, 8100),
  ('Software Engineering', 'Master', 'Turkish', 3400, 1, true, 'Software Engineering', 7600, NULL::numeric),
  ('Software Engineering With Thesis', 'Master', 'Turkish', 3400, 2, true, 'Software Engineering With Thesis', 7600, NULL::numeric),
  ('Strategic Marketing And Brand Management', 'Master', 'English', 8000, 1, true, 'Strategic Marketing And Brand Management', 8000, 7200),
  ('Surgical Diseases Nursing', 'Master', 'English', 9000, 1, true, 'Surgical Diseases Nursing', 9000, 8100),
  ('Surgical Diseases Nursing With Thesis', 'Master', 'English', 10000, 2, true, 'Surgical Diseases Nursing With Thesis', 10000, 9000),
  ('Television And Film', 'Master', 'English', 8000, 1, true, 'Television And Film', 8000, 7200),
  ('Television And Film With Thesis', 'Master', 'English', 9000, 2, true, 'Television And Film With Thesis', 9000, 8100),
  ('Translation And Interpretation (Turkish - Russia', 'Master', 'English', 9000, 1, true, 'Translation And Interpretation (Turkish - Russia', 9000, 8100),
  ('Turkish Education With Thesis', 'Master', 'English', 9000, 2, true, 'Turkish Education With Thesis', 9000, 8100),
  ('Turkish Language And Literature With Thesis', 'Master', 'English', 9000, 2, true, 'Turkish Language And Literature With Thesis', 9000, 8100),
  ('Urban Design', 'Master', 'English', 8000, 1, true, 'Urban Design', 8000, 7200),
  ('Urban Renewal With Thesis', 'Master', 'English', 9000, 2, true, 'Urban Renewal With Thesis', 9000, 8100),
  ('lact 6,13', 'Master', 'Turkish', 3400, 1, true, 'lact 6,13', 7600, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Aydın University'))
  AND p.id IS NULL;


-- Beykent University: 78 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Capital Markets', 'Bachelor', 'English', 2500, 4, true, 'Capital Markets', 3500, 2500),
  ('Chemical Engineering', 'Bachelor', 'English', 2500, 4, true, 'Chemical Engineering', 3500, 2500),
  ('Child Development', 'Bachelor', 'English', 2500, 4, true, 'Child Development', 3500, 2500),
  ('Dentistry', 'Bachelor', 'English', 11000, 5, true, 'Dentistry', 18000, 3950),
  ('Electrical And Electronic Engineering', 'Bachelor', 'English', 2500, 4, true, 'Electrical And Electronic Engineering', 3500, 2500),
  ('English Language And Literature', 'Bachelor', 'Turkish', 2500, 4, true, 'English Language And Literature', 3500, 2500),
  ('Fashion And Textile Design', 'Bachelor', 'English', 2500, 4, true, 'Fashion And Textile Design', 3500, 2500),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 2500, 4, true, 'Gastronomy And Culinary Arts', 3500, 2500),
  ('Health Management', 'Bachelor', 'English', 2500, 4, true, 'Health Management', 3500, 2500),
  ('History', 'Bachelor', 'English', 2500, 4, true, 'History', 3500, 2500),
  ('Information System And Technologies', 'Bachelor', 'English', 2500, 4, true, 'Information System And Technologies', 3500, 2500),
  ('International Relations', 'Bachelor', 'Turkish', 2500, 4, true, 'International Relations', 3500, 2500),
  ('International Trade And Finance', 'Bachelor', 'English', 2500, 4, true, 'International Trade And Finance', 3500, 2500),
  ('Mathematics', 'Bachelor', 'English', 2500, 4, true, 'Mathematics', 3500, 2500),
  ('Mechanical Engineering', 'Bachelor', 'English', 2500, 4, true, 'Mechanical Engineering', 3500, 2500),
  ('Media And Communications', 'Bachelor', 'English', 2500, 4, true, 'Media And Communications', 3500, 2500),
  ('Medicine', 'Bachelor', 'English', 11000, 6, true, 'Medicine', 18000, 3950),
  ('Nursing', 'Bachelor', 'English', 2700, 4, true, 'Nursing', 4000, 2700),
  ('Nutrition And Dietetics', 'Bachelor', 'English', 2700, 4, true, 'Nutrition And Dietetics', 4000, 2700),
  ('Physiotherapy And Rehabilitation', 'Bachelor', 'English', 2700, 4, true, 'Physiotherapy And Rehabilitation', 4000, 2700),
  ('Psychology', 'Bachelor', 'Turkish', 2500, 4, true, 'Psychology', 3500, 2500),
  ('Public Relations And Advertising', 'Bachelor', 'English', 2500, 4, true, 'Public Relations And Advertising', 3500, 2500),
  ('Sociology', 'Bachelor', 'English', 2500, 4, true, 'Sociology', 3500, 2500),
  ('Software Development', 'Bachelor', 'English', 2500, 4, true, 'Software Development', 3500, 2500),
  ('Software Engineering', 'Bachelor', 'English', 2700, 4, true, 'Software Engineering', 4000, 2700),
  ('Tourism Management', 'Bachelor', 'English', 2500, 4, true, 'Tourism Management', 3500, 2500),
  ('Translation And Interpretation (English)', 'Bachelor', 'Turkish', 2500, 4, true, 'Translation And Interpretation (English)', 3500, 2500),
  ('Turkish Language And Literature', 'Bachelor', 'English', 2500, 4, true, 'Turkish Language And Literature', 3500, 2500),
  ('Accounting And Auditing With Thesis', 'Master', 'English', 2100, 2, true, 'Accounting And Auditing With Thesis', 2900, 1600),
  ('Architectural Design', 'Master', 'English', 1600, 1, true, 'Architectural Design', 2200, 1600),
  ('Architecture With Thesis', 'Master', 'English', 2100, 2, true, 'Architecture With Thesis', 2900, 1600),
  ('Banking And Finance ( De)', 'Master', 'English', 1400, 1, true, 'Banking And Finance ( De)', 2200, 1600),
  ('Cinema And Television With Thesis', 'Master', 'English', 2100, 2, true, 'Cinema And Television With Thesis', 2900, 1600),
  ('Civil Engineering', 'Master', 'English', 1600, 1, true, 'Civil Engineering', 2200, 1600),
  ('Civil Engineering With Thesis', 'Master', 'English', 2100, 2, true, 'Civil Engineering With Thesis', 2900, 1600),
  ('Clinical Psychology With Thesis', 'Master', 'English', 12000, 2, true, 'Clinical Psychology With Thesis', 16500, 1600),
  ('Communication Design With Thesis', 'Master', 'English', 2100, 2, true, 'Communication Design With Thesis', 2900, 1600),
  ('Computer Engineering', 'Master', 'English', 1600, 1, true, 'Computer Engineering', 2200, 1600),
  ('Computer Engineering With Thesis', 'Master', 'English', 2100, 2, true, 'Computer Engineering With Thesis', 2900, 1600),
  ('Economics', 'Master', 'English', 1600, 1, true, 'Economics', 2200, 1600),
  ('Economics And Finance', 'Master', 'English', 1600, 1, true, 'Economics And Finance', 2200, 1600),
  ('Economics With Thesis', 'Master', 'English', 2100, 2, true, 'Economics With Thesis', 2900, 1600),
  ('English Language And Literature With Thesis', 'Master', 'Turkish', 2100, 2, true, 'English Language And Literature With Thesis', 2900, 1800),
  ('Fashion And Textile Design With Thesis', 'Master', 'English', 2100, 2, true, 'Fashion And Textile Design With Thesis', 2900, 1600),
  ('Finance', 'Master', 'English', 1600, 1, true, 'Finance', 2200, 1600),
  ('Finance With Thesis', 'Master', 'English', 2100, 2, true, 'Finance With Thesis', 2900, 1600),
  ('Gastronomy And Culinary Arts', 'Master', 'English', 1600, 1, true, 'Gastronomy And Culinary Arts', 2200, 1600),
  ('Gastronomy And Culinary Arts With Thesis', 'Master', 'English', 2100, 2, true, 'Gastronomy And Culinary Arts With Thesis', 2900, 1600),
  ('Graphic Design', 'Master', 'English', 1600, 1, true, 'Graphic Design', 2200, 1600),
  ('Graphic Design With Thesis', 'Master', 'English', 2100, 2, true, 'Graphic Design With Thesis', 2900, 1600),
  ('Health Institutions Management', 'Master', 'English', 1600, 1, true, 'Health Institutions Management', 2200, 1600),
  ('Health Institutions Management (de)', 'Master', 'English', 1600, 2, true, 'Health Institutions Management (de)', 2200, 1600),
  ('Health Institutions Management With Thesis', 'Master', 'English', 2100, 2, true, 'Health Institutions Management With Thesis', 2900, 1600),
  ('History', 'Master', 'English', 1600, 1, true, 'History', 2200, 1600),
  ('History With Thesis', 'Master', 'English', 2100, 2, true, 'History With Thesis', 2900, 1600),
  ('Human Resources And Organisational Change', 'Master', 'English', 1600, 1, true, 'Human Resources And Organisational Change', 2200, 1600),
  ('Industrial Engineering', 'Master', 'English', 1600, 1, true, 'Industrial Engineering', 2200, 1600),
  ('Industrial Policies And Technology Managemer', 'Master', 'English', 2100, 2, true, 'Industrial Policies And Technology Managemer', 2900, 1600),
  ('Management And Organisation', 'Master', 'English', 1600, 1, true, 'Management And Organisation', 2200, 1600),
  ('Management And Organisation With Thesis', 'Master', 'English', 2100, 2, true, 'Management And Organisation With Thesis', 2900, 1600),
  ('Management Information Systems ( De)', 'Master', 'English', 1600, 1, true, 'Management Information Systems ( De)', 2200, 1600),
  ('Manufacturing Engineering', 'Master', 'English', 1600, 1, true, 'Manufacturing Engineering', 2200, 1600),
  ('Manufacturing Engineering With Thesis', 'Master', 'English', 2100, 2, true, 'Manufacturing Engineering With Thesis', 2900, 1600),
  ('Marketing', 'Master', 'English', 1600, 1, true, 'Marketing', 2200, 1600),
  ('Marketing With Thesis', 'Master', 'English', 2100, 2, true, 'Marketing With Thesis', 2900, 1600),
  ('Mathematics', 'Master', 'English', 1600, 1, true, 'Mathematics', 2200, 1600),
  ('Mechanical Engineering', 'Master', 'English', 1600, 1, true, 'Mechanical Engineering', 2200, 1600),
  ('Media And Communication Studies With Thesi', 'Master', 'English', 2100, 1, true, 'Media And Communication Studies With Thesi', 2900, 1600),
  ('Migration Studies', 'Master', 'English', 1600, 1, true, 'Migration Studies', 2200, 1600),
  ('Migration Studies With Thesis', 'Master', 'English', 2100, 2, true, 'Migration Studies With Thesis', 2900, 1600),
  ('Occupational Health And Safety', 'Master', 'English', 1600, 1, true, 'Occupational Health And Safety', 2200, 1600),
  ('Political Science And Public Administration Wit', 'Master', 'English', 2100, 2, true, 'Political Science And Public Administration Wit', 2900, 1600),
  ('Private Law With Thesis', 'Master', 'English', 2100, 2, true, 'Private Law With Thesis', 2900, 1600),
  ('Pubile Law wit thesis', 'Master', 'English', 2100, 2, true, 'Pubile Law wit thesis', 2900, 1600),
  ('Public Relations And Advertising', 'Master', 'English', 1600, 1, true, 'Public Relations And Advertising', 2200, 1600),
  ('Sociology', 'Master', 'English', 1600, 1, true, 'Sociology', 2200, 1600),
  ('Sociology With Thesis', 'Master', 'English', 2100, 2, true, 'Sociology With Thesis', 2900, 1600),
  ('Turkish Language And Literature With Thesis', 'Master', 'English', 2100, 2, true, 'Turkish Language And Literature With Thesis', 2900, 1600)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Beykent University'))
  AND p.id IS NULL;


-- Biruni University: 31 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Audiology', 'Bachelor', 'English', 4000, 4, true, 'Audiology', 4000, 3600),
  ('Biomedical Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Biomedical Engineering', 5000, 4500),
  ('Child Development', 'Bachelor', 'English', 4000, 4, true, 'Child Development', 4000, 3600),
  ('English Language Teaching', 'Bachelor', 'Turkish', 5000, 4, true, 'English Language Teaching', 5000, 4500),
  ('English Translation And Interpretation', 'Bachelor', 'English', 4000, 4, true, 'English Translation And Interpretation', 4000, 3600),
  ('Ergotherapy', 'Bachelor', 'English', 4000, 4, true, 'Ergotherapy', 4000, 3600),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 4000, 4, true, 'Gastronomy And Culinary Arts', 4000, 3600),
  ('Guidance And Psychological Counseling', 'Bachelor', 'English', 4000, 4, true, 'Guidance And Psychological Counseling', 4000, 3600),
  ('Interior Architecture', 'Bachelor', 'English', 5000, 4, true, 'Interior Architecture', 5000, 4500),
  ('Midwifery', 'Bachelor', 'English', 5000, 4, true, 'Midwifery', 5000, 4500),
  ('Nutrition And Dietetics', 'Bachelor', 'English', 4000, 4, true, 'Nutrition And Dietetics', 4000, 3600),
  ('Preschool Education', 'Bachelor', 'English', 5000, 4, true, 'Preschool Education', 5000, 4500),
  ('Primary Education Mathematics Teaching', 'Bachelor', 'English', 4000, 4, false, 'Primary Education Mathematics Teaching', 4000, 3600),
  ('Software Development', 'Bachelor', 'English', 4000, 4, true, 'Software Development', 4000, 3600),
  ('Software Engineering', 'Bachelor', 'English', 5000, 4, true, 'Software Engineering', 5000, 4500),
  ('Special Education', 'Bachelor', 'English', 5000, 4, true, 'Special Education', 5000, 4500),
  ('Biruni UniversitJurkey', 'Diploma', 'Turkish', 5000, 2, true, 'Biruni UniversitJurkey', 5000, 4500),
  ('Anatomy With Thesis', 'Master', 'English', 3600, 2, true, 'Anatomy With Thesis', 4000, NULL::numeric),
  ('Biomedical Engineering', 'Master', 'English', 2700, 1, true, 'Biomedical Engineering', 3000, NULL::numeric),
  ('Biostatistics', 'Master', 'English', 2700, 1, true, 'Biostatistics', 3000, NULL::numeric),
  ('Biostatistics With Thesis', 'Master', 'English', 3600, 2, true, 'Biostatistics With Thesis', 4000, NULL::numeric),
  ('Clinical Embryology With Thesis', 'Master', 'English', 3600, 2, true, 'Clinical Embryology With Thesis', 4000, NULL::numeric),
  ('Health Informatics', 'Master', 'English', 2700, 1, true, 'Health Informatics', 3000, NULL::numeric),
  ('Health Informatics With Thesis', 'Master', 'English', 3600, 2, true, 'Health Informatics With Thesis', 4000, NULL::numeric),
  ('Midwifery With Thesis', 'Master', 'English', 3600, 2, true, 'Midwifery With Thesis', 4000, NULL::numeric),
  ('Nutnition And Dietetics With Thesis', 'Master', 'English', 3600, 2, true, 'Nutnition And Dietetics With Thesis', 4000, NULL::numeric),
  ('Occupational Therapy With Thesis', 'Master', 'English', 3600, 2, true, 'Occupational Therapy With Thesis', 4000, NULL::numeric),
  ('Physiotherapy And Rehabilitation With Thesis', 'Master', 'English', 3600, 2, true, 'Physiotherapy And Rehabilitation With Thesis', 4000, NULL::numeric),
  ('Psychological Counselling And Guidance With', 'Master', 'English', 2700, 2, true, 'Psychological Counselling And Guidance With', 3000, NULL::numeric),
  ('Special Education', 'Master', 'English', 2700, 1, true, 'Special Education', 3000, NULL::numeric),
  ('Special Education With Thesis', 'Master', 'English', 3600, 2, true, 'Special Education With Thesis', 4000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Biruni University'))
  AND p.id IS NULL;


-- CIU University: 1 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('ClU Universitizyprus', 'Bachelor', 'English', 6495, 5, true, 'ClU Universitizyprus', 6495, 2026)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('CIU University'))
  AND p.id IS NULL;


-- European University of Lefke: 5 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Lefke Avrupa UniversitZyprus', 'Bachelor', 'Turkish', 2300, 4, true, 'Lefke Avrupa UniversitZyprus', 2300, NULL::numeric),
  ('Lefke Avrupa UniversitiZyprus', 'Diploma', 'Turkish', 2300, 2, true, 'Lefke Avrupa UniversitiZyprus', 2300, NULL::numeric),
  ('Lefke Avrupa Universitil yprus', 'Diploma', 'Turkish', 2300, 2, true, 'Lefke Avrupa Universitil yprus', 2300, NULL::numeric),
  ('Lefke Avrupa Universitiz yprus', 'Diploma', 'Turkish', 2300, 2, true, 'Lefke Avrupa Universitiz yprus', 2300, NULL::numeric),
  ('Lefke Avrupa Universitzzyprus', 'Diploma', 'Turkish', 2300, 2, true, 'Lefke Avrupa Universitzzyprus', 2300, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('European University of Lefke'))
  AND p.id IS NULL;


-- Fenerbahçe University: 1 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Business Administration', 'Master', 'Turkish', 3000, 1, true, 'Business Administration', 6000, 2700)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Fenerbahçe University'))
  AND p.id IS NULL;


-- Girne American University: 2 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Gine American UniversitZyprus', 'Bachelor', 'English', 1900, 4, true, 'Gine American UniversitZyprus', 1900, NULL::numeric),
  ('Girne American UniversitiZyprus', 'Bachelor', 'English', 1900, 4, true, 'Girne American UniversitiZyprus', 1900, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Girne American University'))
  AND p.id IS NULL;


-- KSTU University: 1 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('KSTU UniversitiZyprus', 'PhD', 'English', 60000, 4, true, 'KSTU UniversitiZyprus', 60000, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('KSTU University'))
  AND p.id IS NULL;


-- Kyrenia University: 3 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('1 Kyrenia UniversitiZyprus', 'Bachelor', 'English', 3190, 4, true, '1 Kyrenia UniversitiZyprus', 3190, NULL::numeric),
  ('Kyrenia Universitizyprus', 'Bachelor', 'Turkish', 3190, 4, true, 'Kyrenia Universitizyprus', 3190, NULL::numeric),
  ('Kyrenia Universitizyprus', 'Bachelor', 'English', 7090, 4, true, 'Kyrenia Universitizyprus', 7090, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Kyrenia University'))
  AND p.id IS NULL;


-- Medipol University: 31 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Artificial Intelligence Engineering', 'Bachelor', 'Turkish', 10000, 4, true, 'Artificial Intelligence Engineering', 10000, 9000),
  ('Banking And Insurance', 'Bachelor', 'English', 6500, 4, true, 'Banking And Insurance', 6500, 5850),
  ('Biomedical Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Biomedical Engineering', 6500, 5850),
  ('Child Development', 'Bachelor', 'English', 6000, 4, true, 'Child Development', 6000, 5400),
  ('Computer Engineering', 'Bachelor', 'Turkish', 6500, 4, true, 'Computer Engineering', 6500, 5850),
  ('Dentistry', 'Bachelor', 'English', 33000, 5, true, 'Dentistry', 33000, 29700),
  ('Economics And Finance', 'Bachelor', 'Turkish', 4500, 4, true, 'Economics And Finance', 4500, 4050),
  ('Electrical And Electronic Engineering', 'Bachelor', 'Turkish', 6000, 4, true, 'Electrical And Electronic Engineering', 6000, 5400),
  ('English Language Teaching', 'Bachelor', 'Turkish', 5500, 4, true, 'English Language Teaching', 5500, 4950),
  ('Ergotherapy', 'Bachelor', 'English', 4500, 4, true, 'Ergotherapy', 4500, 4050),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 4750, 4, true, 'Gastronomy And Culinary Arts', 4750, 4275),
  ('History', 'Bachelor', 'Turkish', 6500, 4, true, 'History', 6500, 5850),
  ('Human Resources Management', 'Bachelor', 'English', 5500, 4, true, 'Human Resources Management', 5500, 4950),
  ('Industrial Design', 'Bachelor', 'English', 5000, 4, true, 'Industrial Design', 5000, 4500),
  ('Industrial Engineering', 'Bachelor', 'Turkish', 4750, 4, true, 'Industrial Engineering', 4750, 4275),
  ('Interior Architecture And Environmental Desigr', 'Bachelor', 'English', 6500, 4, true, 'Interior Architecture And Environmental Desigr', 6500, 5850),
  ('Journalism', 'Bachelor', 'English', 4500, 4, true, 'Journalism', 4500, 4050),
  ('Law', 'Bachelor', 'English', 8000, 4, true, 'Law', 8000, 7200),
  ('Media And Visual Arts', 'Bachelor', 'English', 4500, 4, true, 'Media And Visual Arts', 4500, 4050),
  ('Midwifery', 'Bachelor', 'English', 8000, 4, true, 'Midwifery', 8000, 7200),
  ('New Media And Communication', 'Bachelor', 'English', 5500, 4, true, 'New Media And Communication', 5500, 4950),
  ('Orthotics And Prosthetics', 'Bachelor', 'English', 5000, 4, true, 'Orthotics And Prosthetics', 5000, 4500),
  ('Political Science And International Relations', 'Bachelor', 'Turkish', 5500, 4, true, 'Political Science And International Relations', 5500, 4950),
  ('Primary Mathematics Teaching', 'Bachelor', 'English', 5500, 4, true, 'Primary Mathematics Teaching', 5500, 4950),
  ('Radio Television And Film', 'Bachelor', 'English', 5500, 4, true, 'Radio Television And Film', 5500, 4950),
  ('Social Services', 'Bachelor', 'English', 4500, 4, true, 'Social Services', 4500, 4050),
  ('Special Education Teaching', 'Bachelor', 'English', 5500, 4, true, 'Special Education Teaching', 5500, 4950),
  ('Turkish Music Art', 'Bachelor', 'English', 5000, 4, true, 'Turkish Music Art', 5000, 4500),
  ('Visual Communication Design', 'Bachelor', 'English', 4500, 4, true, 'Visual Communication Design', 4500, 4050),
  ('gaull ple', 'Bachelor', 'English', 6500, 4, true, 'gaull ple', 6500, 5850),
  ('• Medipol Universit Jurkey', 'Bachelor', 'English', 4500, 4, true, '• Medipol Universit Jurkey', 4500, 4050)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Medipol University'))
  AND p.id IS NULL;


-- Near East University: 4 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Near East UniversitiZyprus', 'Master', 'Turkish', 1254, 1, true, 'Near East UniversitiZyprus', 1254, NULL::numeric),
  ('Near East UniversitE yprus', 'PhD', 'Turkish', 1510, 4, true, 'Near East UniversitE yprus', 1510, NULL::numeric),
  ('Near East UniversitEyprus', 'PhD', 'Turkish', 2377, 4, true, 'Near East UniversitEyprus', 2377, NULL::numeric),
  ('Near East UniversitiZyprus', 'PhD', 'Turkish', 2377, 4, true, 'Near East UniversitiZyprus', 2377, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Near East University'))
  AND p.id IS NULL;


-- Nişantaşı University: 101 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Accounting And Finance Management', 'Bachelor', 'English', 2950, 4, true, 'Accounting And Finance Management', 2950, 1800),
  ('Air Traffic Control', 'Bachelor', 'English', 8000, 4, true, 'Air Traffic Control', 8000, 1800),
  ('Aircraft Maintenance And Repair', 'Bachelor', 'English', 3250, 4, true, 'Aircraft Maintenance And Repair', 3250, 1800),
  ('Aviation Electrics And Electronics (Avionics)', 'Bachelor', 'English', 3250, 4, true, 'Aviation Electrics And Electronics (Avionics)', 3250, 1800),
  ('Banking And Finance', 'Bachelor', 'English', 2950, 4, true, 'Banking And Finance', 2950, 1800),
  ('Business Administration', 'Bachelor', 'English', 3250, 4, true, 'Business Administration', 3250, 1800),
  ('Coaching', 'Bachelor', 'English', 2950, 4, true, 'Coaching', 2950, 1800),
  ('Communication And Design', 'Bachelor', 'English', 2950, 4, true, 'Communication And Design', 2950, 1800),
  ('Computer Engineering', 'Bachelor', 'English', 3250, 4, true, 'Computer Engineering', 3250, 1800),
  ('Data Science And Analytics', 'Bachelor', 'English', 3250, 4, true, 'Data Science And Analytics', 3250, 1800),
  ('Digital Game Design', 'Bachelor', 'English', 3250, 4, true, 'Digital Game Design', 3250, 1800),
  ('Economics', 'Bachelor', 'English', 2950, 4, true, 'Economics', 2950, 1800),
  ('Economics And Finance', 'Bachelor', 'Turkish', 3800, 4, true, 'Economics And Finance', 3800, 3800),
  ('Electrical And Electronic Engineering', 'Bachelor', 'Turkish', 3800, 4, true, 'Electrical And Electronic Engineering', 3800, 3800),
  ('English Language And Literature', 'Bachelor', 'Turkish', 3800, 4, true, 'English Language And Literature', 3800, 3800),
  ('English Translation And Interpretation', 'Bachelor', 'Turkish', 3800, 4, true, 'English Translation And Interpretation', 3800, 3800),
  ('Exercise And Sport Sciences', 'Bachelor', 'English', 2950, 4, true, 'Exercise And Sport Sciences', 2950, 1800),
  ('Fashion And Textile Design', 'Bachelor', 'English', 3250, 4, true, 'Fashion And Textile Design', 3250, 1800),
  ('Flight Training', 'Bachelor', 'Turkish', 10000, 4, true, 'Flight Training', 10000, 10000),
  ('Gastronomy And Culinary Arts', 'Bachelor', 'English', 3250, 4, true, 'Gastronomy And Culinary Arts', 3250, 1800),
  ('Graphic Design', 'Bachelor', 'English', 3250, 4, true, 'Graphic Design', 3250, 1800),
  ('Industrial Design', 'Bachelor', 'English', 3250, 4, true, 'Industrial Design', 3250, 1800),
  ('Information System And Technologies', 'Bachelor', 'English', 3250, 4, true, 'Information System And Technologies', 3250, 1800),
  ('International Relations', 'Bachelor', 'Turkish', 3800, 4, true, 'International Relations', 3800, 3800),
  ('International Trade And Business', 'Bachelor', 'English', 3250, 4, true, 'International Trade And Business', 3250, 1800),
  ('International Trade And Logistics', 'Bachelor', 'English', 3250, 4, true, 'International Trade And Logistics', 3250, 1800),
  ('Mechanical Engineering', 'Bachelor', 'Turkish', 4400, 4, true, 'Mechanical Engineering', 4400, 4400),
  ('Mechatronics Engineering', 'Bachelor', 'English', 3250, 4, true, 'Mechatronics Engineering', 3250, 1800),
  ('Medicine', 'Bachelor', 'English', 14500, 6, true, 'Medicine', 14500, 1800),
  ('Midwifery', 'Bachelor', 'English', 3250, 4, true, 'Midwifery', 3250, 1800),
  ('Nursing', 'Bachelor', 'English', 3250, 4, true, 'Nursing', 3250, 1800),
  ('Nutrition And Dietetics', 'Bachelor', 'English', 3250, 4, true, 'Nutrition And Dietetics', 3250, 1800),
  ('Physiotherapy And Rehabilitation', 'Bachelor', 'English', 3250, 4, true, 'Physiotherapy And Rehabilitation', 3250, 1800),
  ('Political Science And Public Administration', 'Bachelor', 'English', 2950, 4, true, 'Political Science And Public Administration', 2950, 1800),
  ('Radio Television And Film', 'Bachelor', 'English', 3250, 4, true, 'Radio Television And Film', 3250, 1800),
  ('Recreation', 'Bachelor', 'English', 2950, 4, true, 'Recreation', 2950, 1800),
  ('Social Services', 'Bachelor', 'English', 2950, 4, true, 'Social Services', 2950, 1800),
  ('Sociology', 'Bachelor', 'English', 2950, 4, true, 'Sociology', 2950, 1800),
  ('Software Engineering', 'Bachelor', 'Turkish', 4400, 4, true, 'Software Engineering', 4400, 4400),
  ('Speech And Language Therapy', 'Bachelor', 'English', 3250, 4, true, 'Speech And Language Therapy', 3250, 1800),
  ('Sports Management', 'Bachelor', 'English', 2950, 4, true, 'Sports Management', 2950, 1800),
  ('Theatre', 'Bachelor', 'English', 3250, 4, true, 'Theatre', 3250, 1800),
  ('Tour Guide Training', 'Bachelor', 'English', 2950, 4, true, 'Tour Guide Training', 2950, 1800),
  ('Tourism Administration', 'Bachelor', 'English', 2950, 4, true, 'Tourism Administration', 2950, 1800),
  ('Accounting And Auditing', 'Master', 'English', 3300, 1, true, 'Accounting And Auditing', 3300, NULL::numeric),
  ('Accounting And Auditing (De)', 'Master', 'English', 3300, 1, true, 'Accounting And Auditing (De)', 3300, NULL::numeric),
  ('Accounting And Auditing With Thesis', 'Master', 'English', 3850, 2, true, 'Accounting And Auditing With Thesis', 3850, NULL::numeric),
  ('Advertising And Brand Communications', 'Master', 'English', 4500, 1, true, 'Advertising And Brand Communications', 4500, NULL::numeric),
  ('Advertising And Brand Communications (De)', 'Master', 'English', 4500, 1, true, 'Advertising And Brand Communications (De)', 4500, NULL::numeric),
  ('Advertising And Brand Communications With 7', 'Master', 'English', 5000, 2, true, 'Advertising And Brand Communications With 7', 5000, NULL::numeric),
  ('Aetifical Intelligence Engineering', 'Master', 'English', 3300, 1, true, 'Aetifical Intelligence Engineering', 3300, NULL::numeric),
  ('Aetifical Intelligence Engineering With Thesis', 'Master', 'English', 3850, 2, true, 'Aetifical Intelligence Engineering With Thesis', 3850, NULL::numeric),
  ('Architectural Design', 'Master', 'English', 3300, 1, true, 'Architectural Design', 3300, NULL::numeric),
  ('Big Data Analytics And Management', 'Master', 'English', 3300, 1, true, 'Big Data Analytics And Management', 3300, NULL::numeric),
  ('Big Data Analytics And Management With Thes', 'Master', 'English', 3850, 2, true, 'Big Data Analytics And Management With Thes', 3850, NULL::numeric),
  ('Business Administration (De)', 'Master', 'English', 3300, 1, true, 'Business Administration (De)', 3300, NULL::numeric),
  ('Chiropractic Treatment With Thesis', 'Master', 'English', 3850, 2, true, 'Chiropractic Treatment With Thesis', 3850, NULL::numeric),
  ('Civil Engineering', 'Master', 'English', 3300, 1, true, 'Civil Engineering', 3300, NULL::numeric),
  ('Civil Engineering With Thesis', 'Master', 'English', 3850, 2, true, 'Civil Engineering With Thesis', 3850, NULL::numeric),
  ('Clinical Psychology', 'Master', 'English', 17000, 1, true, 'Clinical Psychology', 17000, NULL::numeric),
  ('Clinical Psychology With Thesis', 'Master', 'English', 18500, 2, true, 'Clinical Psychology With Thesis', 18500, NULL::numeric),
  ('Computer Engineering', 'Master', 'English', 3300, 1, true, 'Computer Engineering', 3300, NULL::numeric),
  ('Computer Engineering With Thesis', 'Master', 'English', 3850, 2, true, 'Computer Engineering With Thesis', 3850, NULL::numeric),
  ('Economics With Thesis', 'Master', 'English', 3850, 2, true, 'Economics With Thesis', 3850, NULL::numeric),
  ('Engineering Management', 'Master', 'English', 3300, 1, true, 'Engineering Management', 3300, NULL::numeric),
  ('Engineering Management With Thesis', 'Master', 'English', 3850, 2, true, 'Engineering Management With Thesis', 3850, NULL::numeric),
  ('Fashion And Textile Design', 'Master', 'English', 3300, 1, true, 'Fashion And Textile Design', 3300, NULL::numeric),
  ('Fashion And Textile Design With Thesis', 'Master', 'English', 3850, 2, true, 'Fashion And Textile Design With Thesis', 3850, NULL::numeric),
  ('Finance And Banking', 'Master', 'English', 3300, 1, true, 'Finance And Banking', 3300, NULL::numeric),
  ('Finance And Banking (De)', 'Master', 'English', 3300, 1, true, 'Finance And Banking (De)', 3300, NULL::numeric),
  ('Gastronomy And Culinary Arts', 'Master', 'English', 3300, 1, true, 'Gastronomy And Culinary Arts', 3300, NULL::numeric),
  ('Gastronomy And Culinary Arts With Thesis', 'Master', 'English', 3850, 2, true, 'Gastronomy And Culinary Arts With Thesis', 3850, NULL::numeric),
  ('Health Mangement', 'Master', 'English', 3300, 1, true, 'Health Mangement', 3300, NULL::numeric),
  ('Human Resources Management', 'Master', 'English', 3300, 1, true, 'Human Resources Management', 3300, NULL::numeric),
  ('Human Resources Management With Thesis', 'Master', 'English', 3850, 2, true, 'Human Resources Management With Thesis', 3850, NULL::numeric),
  ('Information Technologies', 'Master', 'English', 3300, 1, true, 'Information Technologies', 3300, NULL::numeric),
  ('Information Technologies With Thesis', 'Master', 'English', 3850, 2, true, 'Information Technologies With Thesis', 3850, NULL::numeric),
  ('International Business Administration', 'Master', 'English', 3300, 1, true, 'International Business Administration', 3300, NULL::numeric),
  ('International Business Administration With The', 'Master', 'English', 3850, 1, true, 'International Business Administration With The', 3850, NULL::numeric),
  ('International Business ministration De', 'Master', 'English', 3300, 1, true, 'International Business ministration De', 3300, NULL::numeric),
  ('International Financial Reporting And Auditing', 'Master', 'English', 3300, 1, true, 'International Financial Reporting And Auditing', 3300, NULL::numeric),
  ('International Trade And Finance', 'Master', 'English', 3300, 1, true, 'International Trade And Finance', 3300, NULL::numeric),
  ('Local Government With Thesis', 'Master', 'English', 3850, 2, true, 'Local Government With Thesis', 3850, NULL::numeric),
  ('Movement And Training Sciences In Sports', 'Master', 'English', 3300, 1, true, 'Movement And Training Sciences In Sports', 3300, NULL::numeric),
  ('Movement And Training Sciences In Sports Wit', 'Master', 'English', 3850, 1, true, 'Movement And Training Sciences In Sports Wit', 3850, NULL::numeric),
  ('Music And Performing Arts', 'Master', 'English', 3300, 1, true, 'Music And Performing Arts', 3300, NULL::numeric),
  ('Music And Performing Arts With Thesis', 'Master', 'English', 3850, 2, true, 'Music And Performing Arts With Thesis', 3850, NULL::numeric),
  ('New Media And Jouralism', 'Master', 'English', 3300, 1, true, 'New Media And Jouralism', 3300, NULL::numeric),
  ('New Media And Journalism', 'Master', 'Turkish', 4500, 1, true, 'New Media And Journalism', 4500, NULL::numeric),
  ('New Media And Journalism With Thesis', 'Master', 'English', 3850, 2, true, 'New Media And Journalism With Thesis', 3850, NULL::numeric),
  ('Nutrition And Dietetics', 'Master', 'English', 3300, 1, true, 'Nutrition And Dietetics', 3300, NULL::numeric),
  ('Nutrition And Dietetics With Thesis', 'Master', 'English', 3850, 2, true, 'Nutrition And Dietetics With Thesis', 3850, NULL::numeric),
  ('Political Science And International Relations (D', 'Master', 'English', 3300, 1, true, 'Political Science And International Relations (D', 3300, NULL::numeric),
  ('Political Science And Public Administration Wit', 'Master', 'English', 3850, 2, true, 'Political Science And Public Administration Wit', 3850, NULL::numeric),
  ('Psychology With Thesis', 'Master', 'English', 3850, 2, true, 'Psychology With Thesis', 3850, NULL::numeric),
  ('Radio Television And Cinema With Thesis', 'Master', 'English', 3850, 2, true, 'Radio Television And Cinema With Thesis', 3850, NULL::numeric),
  ('Sports Management', 'Master', 'English', 3300, 1, true, 'Sports Management', 3300, NULL::numeric),
  ('Strategic Marketing And Brand Management', 'Master', 'English', 3300, 1, true, 'Strategic Marketing And Brand Management', 3300, NULL::numeric),
  ('Strategic Marketing And Brand Management W', 'Master', 'English', 3850, 1, true, 'Strategic Marketing And Brand Management W', 3850, NULL::numeric),
  ('Tourism Management', 'Master', 'English', 3300, 1, true, 'Tourism Management', 3300, NULL::numeric),
  ('Tourism Management With Thesis', 'Master', 'English', 3850, 2, true, 'Tourism Management With Thesis', 3850, NULL::numeric)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Nişantaşı University'))
  AND p.id IS NULL;


-- Okan University: 83 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Automotive Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Automotive Engineering', 5000, 4750),
  ('Aviation Management', 'Bachelor', 'English', 4500, 4, true, 'Aviation Management', 4500, 4275),
  ('Cinema And Television', 'Bachelor', 'English', 4500, 4, true, 'Cinema And Television', 4500, 4275),
  ('Civil Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Civil Engineering', 5000, 4750),
  ('Computer Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Computer Engineering', 5000, 4750),
  ('Digital Game Design', 'Bachelor', 'English', 4500, 4, true, 'Digital Game Design', 4500, 4275),
  ('Economics And Finance', 'Bachelor', 'Turkish', 5000, 4, true, 'Economics And Finance', 5000, 4750),
  ('English Language Teaching', 'Bachelor', 'Turkish', 5000, 4, true, 'English Language Teaching', 5000, 4750),
  ('English Translation And Interpretation', 'Bachelor', 'English', 4500, 4, true, 'English Translation And Interpretation', 5000, 4275),
  ('Fashion And Textile Design', 'Bachelor', 'English', 4500, 4, true, 'Fashion And Textile Design', 4500, 4275),
  ('Genetics And Bioengineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Genetics And Bioengineering', 5000, 4750),
  ('Geomatics Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Geomatics Engineering', 5000, 1000),
  ('Health Management', 'Bachelor', 'English', 4500, 4, true, 'Health Management', 4500, 4275),
  ('Industrial Engineering', 'Bachelor', 'Turkish', 5000, 2, true, 'Industrial Engineering', 5000, 4750),
  ('International Banking And Finance', 'Bachelor', 'English', 4500, 4, true, 'International Banking And Finance', 4500, 4275),
  ('International Trade', 'Bachelor', 'Turkish', 5000, 4, true, 'International Trade', 5000, 4750),
  ('Law', 'Bachelor', 'English', 4500, 4, true, 'Law', 4500, 4275),
  ('Logistics Management', 'Bachelor', 'Turkish', 5000, 4, true, 'Logistics Management', 5000, 4750),
  ('Mechanical Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Mechanical Engineering', 5000, 4750),
  ('Mechatronics Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Mechatronics Engineering', 5000, 4750),
  ('Music', 'Bachelor', 'English', 4500, 4, true, 'Music', 4500, 4275),
  ('New Media And Communication', 'Bachelor', 'English', 4500, 4, true, 'New Media And Communication', 4500, 4275),
  ('Nursing', 'Bachelor', 'Turkish', 5000, 4, true, 'Nursing', 5000, 4750),
  ('Pilotage', 'Bachelor', 'Turkish', 8000, 4, true, 'Pilotage', 8000, 7600),
  ('Psychological Counseling And Guidance', 'Bachelor', 'English', 4500, 4, true, 'Psychological Counseling And Guidance', 4500, 4275),
  ('Public Relation', 'Bachelor', 'English', 4500, 4, true, 'Public Relation', 4500, 4275),
  ('Software Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Software Engineering', 5000, 4750),
  ('Special Education Teaching', 'Bachelor', 'English', 4500, 4, true, 'Special Education Teaching', 4500, 4275),
  ('Sports Management', 'Bachelor', 'English', 4500, 2, true, 'Sports Management', 4500, 4275),
  ('Theatre', 'Bachelor', 'English', 4500, 4, true, 'Theatre', 4500, 4275),
  ('Translation And Interpretation (Chinese)', 'Bachelor', 'English', 4500, 4, true, 'Translation And Interpretation (Chinese)', 4500, 4275),
  ('Translation And Interpretation (Russian)', 'Bachelor', 'English', 4500, 4, true, 'Translation And Interpretation (Russian)', 4500, 4275),
  ('Visual Communication Design', 'Bachelor', 'English', 4500, 4, true, 'Visual Communication Design', 4500, 4275),
  ('clectrical And bleetonke the lneering', 'Bachelor', 'Turkish', 5000, 4, true, 'clectrical And bleetonke the lneering', 5000, 4750),
  ('Management', 'CombinedPhD', 'Turkish', 15000, 5, true, 'Management', 15000, 14250),
  ('Accounting And Auditing', 'Master', 'English', 3500, 1, true, 'Accounting And Auditing', 3500, 3325),
  ('Accounting And Auditing (De)', 'Master', 'English', 3500, 1, true, 'Accounting And Auditing (De)', 3500, 3325),
  ('Accounting And Auditing With Thesis', 'Master', 'English', 4500, 2, true, 'Accounting And Auditing With Thesis', 4500, 4275),
  ('Advanced Electronics And Communication Tec', 'Master', 'Turkish', 6000, 1, true, 'Advanced Electronics And Communication Tec', 6000, 5700),
  ('Anatomy With Thesis', 'Master', 'English', 4500, 2, true, 'Anatomy With Thesis', 4500, 4275),
  ('Artificial Intelligence', 'Master', 'Turkish', 5000, 1, true, 'Artificial Intelligence', 5000, 1000),
  ('Artificial Intelligence Engineering With Thesis', 'Master', 'Turkish', 6000, 2, true, 'Artificial Intelligence Engineering With Thesis', 6000, 5700),
  ('Automotive Mechatronics And Intelligent Vehic', 'Master', 'Turkish', 6000, 2, true, 'Automotive Mechatronics And Intelligent Vehic', 6000, 5700),
  ('Banking (De)', 'Master', 'English', 3500, 1, true, 'Banking (De)', 3500, 1000),
  ('Banking And Finance With Thesis', 'Master', 'English', 4500, 2, true, 'Banking And Finance With Thesis', 4500, 4275),
  ('Business Administration (De)', 'Master', 'English', 3500, 1, true, 'Business Administration (De)', 3500, 3325),
  ('Business Administration With Thesis', 'Master', 'English', 4500, 2, true, 'Business Administration With Thesis', 4500, 4275),
  ('Child Development', 'Master', 'English', 3500, 1, true, 'Child Development', 3500, 3325),
  ('Child Development With Thesis', 'Master', 'English', 4500, 2, true, 'Child Development With Thesis', 4500, 4275),
  ('Cinema And Television With Thesis', 'Master', 'English', 4500, 2, true, 'Cinema And Television With Thesis', 4500, 4275),
  ('Economic Law', 'Master', 'English', 3500, 1, true, 'Economic Law', 3500, 3325),
  ('Economic Law With Thesis', 'Master', 'English', 4500, 2, true, 'Economic Law With Thesis', 4500, 1000),
  ('Educational Administration And Supervision', 'Master', 'English', 3500, 1, true, 'Educational Administration And Supervision', 3500, 3325),
  ('Educational Administration And Supervision W', 'Master', 'English', 4500, 2, true, 'Educational Administration And Supervision W', 4500, 4275),
  ('Finance', 'Master', 'English', 3500, 1, true, 'Finance', 3500, 3325),
  ('Finance With Thesis', 'Master', 'English', 4500, 2, true, 'Finance With Thesis', 4500, 4275),
  ('Gastronomy With Thesis', 'Master', 'Turkish', 6000, 2, true, 'Gastronomy With Thesis', 6000, 5700),
  ('Geotechnical With Thesis', 'Master', 'English', 4500, 2, true, 'Geotechnical With Thesis', 4500, 4275),
  ('Information Technology Law', 'Master', 'English', 3500, 1, true, 'Information Technology Law', 3500, 1000),
  ('Information Technology Law With Thesis', 'Master', 'English', 4500, 2, true, 'Information Technology Law With Thesis', 4500, 4275),
  ('Interior Architecture And Environmental Desigr', 'Master', 'English', 3500, 1, true, 'Interior Architecture And Environmental Desigr', 3500, 3325),
  ('International Logistics', 'Master', 'English', 3500, 1, true, 'International Logistics', 3500, 3325),
  ('International Logistics With Thesis', 'Master', 'English', 4500, 2, true, 'International Logistics With Thesis', 4500, 4275),
  ('Logistics Management (De)', 'Master', 'English', 3500, 1, true, 'Logistics Management (De)', 3500, 3325),
  ('Marketing Communications With Thesis', 'Master', 'English', 4500, 2, true, 'Marketing Communications With Thesis', 4500, 4275),
  ('Nursing', 'Master', 'English', 3500, 1, true, 'Nursing', 3500, 3325),
  ('Nutrition And Dietetics', 'Master', 'English', 3500, 1, true, 'Nutrition And Dietetics', 3500, 3325),
  ('Nutrition And Dietetics With Thesis', 'Master', 'English', 4500, 2, true, 'Nutrition And Dietetics With Thesis', 4500, 4275),
  ('Occupational Health And Safety', 'Master', 'English', 3500, 1, true, 'Occupational Health And Safety', 3500, 3325),
  ('Occupational Health And Safety With Thesis', 'Master', 'English', 4500, 2, true, 'Occupational Health And Safety With Thesis', 4500, 4275),
  ('Oral And Maxillofacial Radiology With Thesis', 'Master', 'English', 4500, 2, true, 'Oral And Maxillofacial Radiology With Thesis', 4500, 1000),
  ('Physiotherapy And Rehabilitation', 'Master', 'English', 3500, 1, true, 'Physiotherapy And Rehabilitation', 3500, NULL::numeric),
  ('Physiotherapy And Rehabilitation With Thesis', 'Master', 'English', 4500, 2, true, 'Physiotherapy And Rehabilitation With Thesis', 4500, 4275),
  ('Power Electronics And Clean Energy Systems', 'Master', 'Turkish', 6000, 2, true, 'Power Electronics And Clean Energy Systems', 6000, 5700),
  ('Quality Management In Health', 'Master', 'English', 3500, 1, true, 'Quality Management In Health', 3500, 1000),
  ('Real Estate Finance And Valuation', 'Master', 'English', 3500, 1, true, 'Real Estate Finance And Valuation', 3500, 3325),
  ('Real Estate Finance And Valuation (De)', 'Master', 'English', 3500, 1, true, 'Real Estate Finance And Valuation (De)', 3500, 3325),
  ('Real Estate Finance And Valuation With Thesis', 'Master', 'English', 4500, 2, true, 'Real Estate Finance And Valuation With Thesis', 4500, 4275),
  ('Sales And Marketing With Thesis', 'Master', 'English', 4500, 2, true, 'Sales And Marketing With Thesis', 4500, 4275),
  ('Social And Cultural Studies', 'Master', 'English', 3500, 1, true, 'Social And Cultural Studies', 3500, 3325),
  ('Social And Cultural Studies With Thesis', 'Master', 'English', 4500, 2, true, 'Social And Cultural Studies With Thesis', 4500, 4275),
  ('Tourism And Hospitality', 'Master', 'English', 3500, 1, true, 'Tourism And Hospitality', 3500, 1000),
  ('Tourism And Hospitality With Thesis', 'Master', 'English', 4500, 2, true, 'Tourism And Hospitality With Thesis', 4500, 4275)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Okan University'))
  AND p.id IS NULL;


-- Üsküdar University: 152 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Architecture', 'Bachelor', 'Turkish', 8500, 4, true, 'Architecture', 8500, 8500),
  ('Artificial Intelligence Engineering', 'Bachelor', 'Turkish', 12000, 4, true, 'Artificial Intelligence Engineering', 12000, 8500),
  ('Audiology', 'Bachelor', 'English', 4200, 4, true, 'Audiology', 4200, 3800),
  ('Bioengineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Bioengineering', 5000, 4500),
  ('Child Development', 'Bachelor', 'English', 4200, 4, true, 'Child Development', 4200, 3800),
  ('Cinema And Television', 'Bachelor', 'Turkish', 6800, 4, true, 'Cinema And Television', 6800, 8500),
  ('Clinical Pharmacy', 'Bachelor', 'Turkish', 3800, 4, true, 'Clinical Pharmacy', 3800, 2026),
  ('Coaching', 'Bachelor', 'English', 3000, 4, true, 'Coaching', 3000, 2026),
  ('Digital Game Design', 'Bachelor', 'Turkish', 6800, 4, true, 'Digital Game Design', 6800, 8500),
  ('Economics', 'Bachelor', 'Turkish', 8500, 4, true, 'Economics', 8500, 8500),
  ('Electrical And Electronic Engineering', 'Bachelor', 'Turkish', 5000, 4, true, 'Electrical And Electronic Engineering', 5000, 4500),
  ('Energy Systems Engineering', 'Bachelor', 'Turkish', 9000, 4, true, 'Energy Systems Engineering', 9000, 8500),
  ('Engineering Management', 'Bachelor', 'Turkish', 8500, 4, true, 'Engineering Management', 8500, 8500),
  ('Fashion And Textile Design', 'Bachelor', 'Turkish', 8500, 4, true, 'Fashion And Textile Design', 8500, 8500),
  ('Gelis pianoi', 'Bachelor', 'Turkish', 8500, 4, true, 'Gelis pianoi', 8500, 8500),
  ('Guidance And Psychological Counseling', 'Bachelor', 'Turkish', 5950, 4, true, 'Guidance And Psychological Counseling', 5950, 8500),
  ('Health Management', 'Bachelor', 'English', 4200, 4, true, 'Health Management', 4200, 3800),
  ('History', 'Bachelor', 'English', 4200, 4, true, 'History', 4200, 3800),
  ('Industral Engineering', 'Bachelor', 'Turkish', 9000, 4, true, 'Industral Engineering', 9000, 8500),
  ('Information Security Technology', 'Bachelor', 'Turkish', 9000, 4, true, 'Information Security Technology', 9000, 8500),
  ('Interior Architecture And Environmental Desigr', 'Bachelor', 'Turkish', 8500, 4, true, 'Interior Architecture And Environmental Desigr', 8500, 8500),
  ('International Finance', 'Bachelor', 'Turkish', 8500, 4, true, 'International Finance', 8500, 8500),
  ('International Trade And Business', 'Bachelor', 'Turkish', 8500, 4, true, 'International Trade And Business', 8500, 8500),
  ('Journalism', 'Bachelor', 'English', 4200, 4, true, 'Journalism', 4200, 3800),
  ('Logistics Management', 'Bachelor', 'Turkish', 8500, 4, true, 'Logistics Management', 8500, 8500),
  ('Management Information Systems', 'Bachelor', 'English', 3800, 4, true, 'Management Information Systems', 4200, 1500),
  ('Mechatronics Engineering', 'Bachelor', 'Turkish', 3000, 4, true, 'Mechatronics Engineering', 3000, 3000),
  ('Midwifery', 'Bachelor', 'English', 4200, 4, true, 'Midwifery', 4200, 3800),
  ('Music', 'Bachelor', 'Turkish', 5950, 4, true, 'Music', 5950, 8500),
  ('Music Technology', 'Bachelor', 'English', 5950, 4, true, 'Music Technology', 5950, 3500),
  ('New Media', 'Bachelor', 'Turkish', 6800, 4, true, 'New Media', 6800, 8500),
  ('Nutnition And Dietetics', 'Bachelor', 'English', 6375, 4, true, 'Nutnition And Dietetics', 6375, 3500),
  ('Occupational Health And Safety', 'Bachelor', 'English', 4200, 4, true, 'Occupational Health And Safety', 4200, 3800),
  ('Occupational Therapy', 'Bachelor', 'English', 4200, 4, true, 'Occupational Therapy', 4200, 3800),
  ('Oral And Dental Health', 'Bachelor', 'English', 2500, 4, true, 'Oral And Dental Health', 2500, 2026),
  ('Performing Arts', 'Bachelor', 'Turkish', 5950, 4, true, 'Performing Arts', 5950, 8500),
  ('Perfusion', 'Bachelor', 'English', 4200, 4, true, 'Perfusion', 4200, 3800),
  ('Philosophy', 'Bachelor', 'English', 4200, 4, true, 'Philosophy', 4200, 3800),
  ('Pilotage', 'Bachelor', 'Turkish', 9000, 4, true, 'Pilotage', 9000, 8500),
  ('Preschool Education', 'Bachelor', 'Turkish', 5950, 4, true, 'Preschool Education', 5950, 8500),
  ('Public Relations And Advertising', 'Bachelor', 'Turkish', 6800, 4, true, 'Public Relations And Advertising', 6800, 8500),
  ('Public Relations And Publicity', 'Bachelor', 'English', 4200, 4, true, 'Public Relations And Publicity', 4200, 3800),
  ('Radio Television And Film', 'Bachelor', 'English', 4200, 4, true, 'Radio Television And Film', 4200, 3800),
  ('Recreation', 'Bachelor', 'English', 3000, 4, true, 'Recreation', 3000, 2026),
  ('Social Work', 'Bachelor', 'English', 4200, 4, true, 'Social Work', 4200, 3800),
  ('Speech And Language Therapy', 'Bachelor', 'English', 4200, 4, true, 'Speech And Language Therapy', 4200, 3800),
  ('Sports Management', 'Bachelor', 'English', 3000, 4, true, 'Sports Management', 3000, 2026),
  ('Vocal Training', 'Bachelor', 'English', 5950, 4, true, 'Vocal Training', 5950, 3500),
  ('Addiction Consultancy And Rehabilitation With Thesis', 'Master', 'English', 4800, 2, true, 'Addiction Consultancy And Rehabilitation With Thesis', 4800, 4320),
  ('Addiction Counseling And Rehabilitation', 'Master', 'English', 4400, 4, true, 'Addiction Counseling And Rehabilitation', 4400, 3960),
  ('Advertising And Brand Communication Manage', 'Master', 'English', 14000, 1, true, 'Advertising And Brand Communication Manage', 12000, 3500),
  ('Applied Psychology', 'Master', 'English', 6300, 1, true, 'Applied Psychology', 6300, 5670),
  ('Applied Psychology With Thesis', 'Master', 'English', 7300, 4, true, 'Applied Psychology With Thesis', 7300, 6570),
  ('Architecture', 'Master', 'English', 12000, 1, true, 'Architecture', 12000, 3500),
  ('Artifical Intelligence Engineering', 'Master', 'English', 4400, 4, true, 'Artifical Intelligence Engineering', 4400, 3960),
  ('Artificial Intelligence Engineering', 'Master', 'English', 4400, 1, true, 'Artificial Intelligence Engineering', 4400, 3960),
  ('Artificial Intelligence Engineering With Thesis', 'Master', 'English', 4800, 2, true, 'Artificial Intelligence Engineering With Thesis', 4800, 4320),
  ('Artificial Intelligence With Thesis', 'Master', 'Turkish', 14000, 2, true, 'Artificial Intelligence With Thesis', 14000, 8500),
  ('Aviation Management', 'Master', 'Turkish', 12000, 1, true, 'Aviation Management', 12000, 8500),
  ('Bioinformatics With Thesis', 'Master', 'English', 4800, 2, true, 'Bioinformatics With Thesis', 4800, 4320),
  ('Biosecurity With Thesis', 'Master', 'English', 4800, 2, true, 'Biosecurity With Thesis', 4800, 4320),
  ('Biotechnology', 'Master', 'English', 4400, 4, true, 'Biotechnology', 4400, 3960),
  ('Biotechnology With Thesis', 'Master', 'English', 4800, 4, true, 'Biotechnology With Thesis', 4800, 4320),
  ('Business Administration ( De)', 'Master', 'Turkish', 7000, 1, true, 'Business Administration ( De)', 7000, 3500),
  ('Business Administration (De)', 'Master', 'English', 7000, 1, false, 'Business Administration (De)', 7000, 3500),
  ('Chemical Engineering', 'Master', 'Turkish', 4400, 4, true, 'Chemical Engineering', 4400, 3960),
  ('Chemical Engineering With Thesis', 'Master', 'Turkish', 4800, 4, true, 'Chemical Engineering With Thesis', 4800, 4320),
  ('Child Development', 'Master', 'English', 3960, 4, true, 'Child Development', 4400, NULL::numeric),
  ('Child Development With Thesis', 'Master', 'English', 4800, 2, true, 'Child Development With Thesis', 4800, 4320),
  ('Chiropractic Treatment', 'Master', 'English', 12000, 1, true, 'Chiropractic Treatment', 12000, 3500),
  ('Clinical Psychology', 'Master', 'English', 15200, 4, true, 'Clinical Psychology', 15200, 13680),
  ('Criminal Justice', 'Master', 'English', 4400, 4, true, 'Criminal Justice', 4400, 3960),
  ('Criminal Justice With Thesis', 'Master', 'English', 4800, 2, true, 'Criminal Justice With Thesis', 4800, 4320),
  ('Cyber Secunty With Thesis', 'Master', 'Turkish', 5700, 4, true, 'Cyber Secunty With Thesis', 5700, 5130),
  ('Educational Administration And Supervision W', 'Master', 'English', 4000, 2, true, 'Educational Administration And Supervision W', 4000, NULL::numeric),
  ('Electrical And Electronic Engineering', 'Master', 'Turkish', 5100, 4, true, 'Electrical And Electronic Engineering', 5100, 4590),
  ('Electrical And Electronic Engineering With The', 'Master', 'Turkish', 5700, 2, true, 'Electrical And Electronic Engineering With The', 5700, 5130),
  ('Electrical And Electronic Engineering With Thesis', 'Master', 'Turkish', 5700, 2, true, 'Electrical And Electronic Engineering With Thesis', 5700, 5130),
  ('English Language Education', 'Master', 'Turkish', 12000, 1, true, 'English Language Education', 12000, 3500),
  ('English Language Education (De)', 'Master', 'Turkish', 7000, 1, true, 'English Language Education (De)', 7000, 8500),
  ('Entrepreneurship And Innovation Management', 'Master', 'Turkish', 14000, 1, true, 'Entrepreneurship And Innovation Management', 14000, 8500),
  ('Executive MBA With Thesis', 'Master', 'English', 18000, 2, true, 'Executive MBA With Thesis', 18000, 3500),
  ('Family Counseling', 'Master', 'English', 4400, 4, true, 'Family Counseling', 4400, 3960),
  ('Family Counseling With Thesis', 'Master', 'English', 4800, 4, true, 'Family Counseling With Thesis', 4800, 4320),
  ('Financial Technologies', 'Master', 'Turkish', 12000, 1, true, 'Financial Technologies', 12000, 8500),
  ('Financial Technologies With Thesis', 'Master', 'Turkish', 14000, 2, true, 'Financial Technologies With Thesis', 14000, 8500),
  ('Forensic Chemistry and Forensic Toxicology', 'Master', 'English', 4400, 4, true, 'Forensic Chemistry and Forensic Toxicology', 4400, 3960),
  ('Forensic Chemistry and Forensic Toxicology W', 'Master', 'English', 4800, 4, true, 'Forensic Chemistry and Forensic Toxicology W', 4800, 4320),
  ('Forensic Science', 'Master', 'English', 4400, 4, true, 'Forensic Science', 4400, 3960),
  ('Forensic Sciences With Thesis', 'Master', 'English', 5100, 2, true, 'Forensic Sciences With Thesis', 5100, 4590),
  ('Game Development Technologies', 'Master', 'English', 12000, 1, true, 'Game Development Technologies', 12000, 3500),
  ('Global Affairs With Thesis', 'Master', 'Turkish', 14000, 2, true, 'Global Affairs With Thesis', 14000, 8500),
  ('Health Care Organizations Management', 'Master', 'English', 12000, 1, true, 'Health Care Organizations Management', 12000, 3500),
  ('Health Care Organizations Management With 1', 'Master', 'English', 14000, 1, true, 'Health Care Organizations Management With 1', 14000, 3500),
  ('Health Informatics', 'Master', 'English', 4400, 1, true, 'Health Informatics', 4400, 3960),
  ('Health Informatics With Thesis', 'Master', 'English', 4800, 4, true, 'Health Informatics With Thesis', 4800, 4320),
  ('Health Management With Thesis', 'Master', 'English', 4800, 2, true, 'Health Management With Thesis', 4800, 4320),
  ('Health Mangement', 'Master', 'English', 4400, 4, true, 'Health Mangement', 4400, 3960),
  ('History', 'Master', 'Turkish', 12000, 1, true, 'History', 12000, 3500),
  ('History With Thesis', 'Master', 'English', 14000, 2, true, 'History With Thesis', 14000, 3500),
  ('Human Resources Management (De)', 'Master', 'English', 7000, 1, true, 'Human Resources Management (De)', 7000, 3500),
  ('Information Technologies With Thesis', 'Master', 'English', 14000, 2, true, 'Information Technologies With Thesis', 14000, 3500),
  ('Interior Design With Thesis', 'Master', 'English', 14000, 2, true, 'Interior Design With Thesis', 14000, 3500),
  ('International Commercial Law', 'Master', 'English', 12000, 1, true, 'International Commercial Law', 12000, 3500),
  ('International Relations', 'Master', 'English', 4400, 4, true, 'International Relations', 4400, 3960),
  ('International Relations With Thesis', 'Master', 'English', 4800, 4, true, 'International Relations With Thesis', 4800, 4320),
  ('Marketing (De)', 'Master', 'English', 7000, 1, true, 'Marketing (De)', 7000, 3500),
  ('Media And Cultural Studies', 'Master', 'English', 4400, 4, true, 'Media And Cultural Studies', 4400, 3960),
  ('Media And Cultural Studies With Thesis', 'Master', 'English', 4800, 4, true, 'Media And Cultural Studies With Thesis', 4800, 4320),
  ('Midwifery', 'Master', 'English', 4400, 1, true, 'Midwifery', 4400, 3960),
  ('Midwifery With Thesis', 'Master', 'English', 4800, 2, true, 'Midwifery With Thesis', 4800, 4320),
  ('Minema And Talavicion With thesis', 'Master', 'Turkish', 12000, 2, true, 'Minema And Talavicion With thesis', 12000, 8500),
  ('Music With Thesis', 'Master', 'English', 14000, 2, true, 'Music With Thesis', 14000, 3500),
  ('Neuromarketing', 'Master', 'English', 4400, 1, true, 'Neuromarketing', 4400, 3960),
  ('Neuromarketing With Thesis', 'Master', 'English', 4800, 2, true, 'Neuromarketing With Thesis', 4800, 4320),
  ('Neuroscience With Thesis', 'Master', 'Turkish', 4800, 2, true, 'Neuroscience With Thesis', 4800, 4320),
  ('New Media And Journalism', 'Master', 'English', 4400, 4, true, 'New Media And Journalism', 4400, 3960),
  ('New Media And Journalism With Thesis', 'Master', 'English', 4800, 4, true, 'New Media And Journalism With Thesis', 4800, 4320),
  ('Nursing', 'Master', 'English', 4400, 1, true, 'Nursing', 4400, 3960),
  ('Nursing With Thesis', 'Master', 'English', 4800, 2, true, 'Nursing With Thesis', 4800, 4320),
  ('Nutrition And Dietetics', 'Master', 'English', 4400, 4, true, 'Nutrition And Dietetics', 4400, 3960),
  ('Nutrition And Dietetics With Thesis', 'Master', 'English', 4800, 2, true, 'Nutrition And Dietetics With Thesis', 4800, 4320),
  ('Occupational Health And Safety', 'Master', 'English', 4400, 4, true, 'Occupational Health And Safety', 4400, 3960),
  ('Occupational Health And Safety With Thesis', 'Master', 'English', 4800, 4, true, 'Occupational Health And Safety With Thesis', 4800, 4320),
  ('Occupational Therapy', 'Master', 'English', 4400, 4, true, 'Occupational Therapy', 4400, 3960),
  ('Occupational Therapy With Thesis', 'Master', 'English', 4800, 2, true, 'Occupational Therapy With Thesis', 4800, 4320),
  ('Orthodontics', 'Master', 'English', 6000, 1, true, 'Orthodontics', 6000, NULL::numeric),
  ('Perfusion', 'Master', 'English', 4400, 4, true, 'Perfusion', 4400, 3960),
  ('Perfusion With Thesis', 'Master', 'English', 4800, 2, true, 'Perfusion With Thesis', 4800, 4320),
  ('Philosophy', 'Master', 'English', 4400, 4, true, 'Philosophy', 4400, 3960),
  ('Philosophy With Thesis', 'Master', 'English', 4800, 4, true, 'Philosophy With Thesis', 4800, 4320),
  ('Physiotherapy And Rehabilitation', 'Master', 'English', 4400, 4, true, 'Physiotherapy And Rehabilitation', 4400, 3960),
  ('Physiotherapy And Rehabilitation With Thesis', 'Master', 'English', 4800, 2, true, 'Physiotherapy And Rehabilitation With Thesis', 4800, 4320),
  ('Prosthetic Dentistry', 'Master', 'English', 12000, 1, true, 'Prosthetic Dentistry', 12000, NULL::numeric),
  ('Prosthetic Dentistry With Thesis', 'Master', 'English', 12000, 2, true, 'Prosthetic Dentistry With Thesis', 12000, 20261),
  ('Prosthodontics', 'Master', 'Turkish', 12000, 1, true, 'Prosthodontics', 12000, 2026),
  ('Public Law With Thesis', 'Master', 'English', 12000, 2, true, 'Public Law With Thesis', 14000, 3500),
  ('Public Relations And Advertising', 'Master', 'English', 4400, 4, true, 'Public Relations And Advertising', 4400, 3960),
  ('Public Relations And Advertising With Thesis', 'Master', 'English', 4800, 2, true, 'Public Relations And Advertising With Thesis', 4800, NULL::numeric),
  ('Quota Full|', 'Master', 'Turkish', 12000, 1, false, 'Quota Full|', 12000, 8500),
  ('Social Work', 'Master', 'English', 4400, 4, true, 'Social Work', 4400, 3960),
  ('Social Work With Thesis', 'Master', 'English', 4800, 4, true, 'Social Work With Thesis', 4800, 4320),
  ('Sociology', 'Master', 'English', 4400, 4, true, 'Sociology', 4400, 3960),
  ('Sociology With Thesis', 'Master', 'English', 4800, 4, true, 'Sociology With Thesis', 4800, 4320),
  ('Speech And Language Therapy', 'Master', 'English', 4400, 4, true, 'Speech And Language Therapy', 4400, NULL::numeric),
  ('Speech And Language Therapy With Thesis', 'Master', 'English', 800, 2, true, 'Speech And Language Therapy With Thesis', 4800, 4320),
  ('Sport Management', 'Master', 'English', 14000, 1, true, 'Sport Management', 12000, 3500),
  ('Sports Nutrition With Thesis', 'Master', 'English', 14000, 2, true, 'Sports Nutrition With Thesis', 14000, 3500),
  ('Sufi Culture And Literature', 'Master', 'English', 7500, 4, true, 'Sufi Culture And Literature', 7500, 6750),
  ('Sufi Culture And Literature With Thesis', 'Master', 'English', 9150, 2, true, 'Sufi Culture And Literature With Thesis', 9150, 8235),
  ('Visual Communication Design', 'Master', 'English', 4400, 4, true, 'Visual Communication Design', 4400, 3960),
  ('Visual Communication Design With Thesis', 'Master', 'English', 4800, 4, true, 'Visual Communication Design With Thesis', 4800, 4320)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('Üsküdar University'))
  AND p.id IS NULL;


-- İstanbul Kültür University: 1 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('quaill ala', 'Bachelor', 'Turkish', 3000, 4, true, 'quaill ala', 6000, 3000)
) AS v(name, degree, language, cost, years, available, name_ar, before_discount, cash_price)
LEFT JOIN program p
  ON p.university_id = u.id
 AND lower(trim(p.name)) = lower(trim(v.name))
 AND COALESCE(p.degree, '') = COALESCE(v.degree, '')
 AND COALESCE(p.language, '') = COALESCE(v.language, '')
WHERE lower(trim(u.name)) = lower(trim('İstanbul Kültür University'))
  AND p.id IS NULL;


-- İstinye University: 83 programs
INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  v.name, v.degree, v.language, v.cost, v.years, now(), v.available, v.name_ar, v.before_discount, v.cash_price, now()
FROM university u
CROSS JOIN (
  VALUES
  ('Audiology', 'Bachelor', 'English', 8000, 4, true, 'Audiology', 8000, NULL::numeric),
  ('Biomedical Engineering', 'Bachelor', 'Turkish', 8000, 4, true, 'Biomedical Engineering', 8000, 8000),
  ('Business Administration', 'Bachelor', 'Turkish', 8000, 4, true, 'Business Administration', 8000, 8000),
  ('Chemistry', 'Bachelor', 'Turkish', 8000, 4, true, 'Chemistry', 8000, 8000),
  ('Child Development', 'Bachelor', 'English', 8000, 4, true, 'Child Development', 8000, 3000),
  ('Cinema And Television', 'Bachelor', 'English', 2700, 4, true, 'Cinema And Television', 3600, 2026),
  ('Civil Engineering', 'Bachelor', 'Turkish', 2700, 4, true, 'Civil Engineering', 4800, 2021),
  ('Digital Game Design', 'Bachelor', 'Turkish', 8000, 4, true, 'Digital Game Design', 8000, 8000),
  ('Economics', 'Bachelor', 'Turkish', 8000, 4, true, 'Economics', 8000, 8000),
  ('Electrical And Electronic Engineering', 'Bachelor', 'Turkish', 8000, 4, true, 'Electrical And Electronic Engineering', 8000, 8000),
  ('English Language And Literature', 'Bachelor', 'Turkish', 8000, 4, true, 'English Language And Literature', 8000, 8000),
  ('Fashion And Textile Design', 'Bachelor', 'English', 7000, 4, true, 'Fashion And Textile Design', 7000, 3000),
  ('Health Management', 'Bachelor', 'English', 8000, 4, true, 'Health Management', 8000, 3000),
  ('Industrial Design', 'Bachelor', 'English', 2700, 4, true, 'Industrial Design', 3600, 2021),
  ('Industrial Engineering', 'Bachelor', 'Turkish', 8000, 4, true, 'Industrial Engineering', 8000, 8000),
  ('Interior Architecture And Environmental Desig', 'Bachelor', 'English', 8000, 4, true, 'Interior Architecture And Environmental Desig', 8000, 3000),
  ('Interior Architecture And Environmental Design', 'Bachelor', 'English', 8000, 4, true, 'Interior Architecture And Environmental Design', 8000, 3000),
  ('Interior Architecture And Environmental Desigr', 'Bachelor', 'Turkish', 2700, 4, true, 'Interior Architecture And Environmental Desigr', 3600, 2021),
  ('International Relations', 'Bachelor', 'Turkish', 8000, 4, true, 'International Relations', 8000, 8000),
  ('International Trade And Business', 'Bachelor', 'Turkish', 8000, 4, true, 'International Trade And Business', 8000, 8000),
  ('International Trade And Finance', 'Bachelor', 'Turkish', 2700, 4, true, 'International Trade And Finance', 3600, 2021),
  ('Logistics Management', 'Bachelor', 'English', 8000, 4, true, 'Logistics Management', 8000, 3000),
  ('Mathematics', 'Bachelor', 'Turkish', 8000, 4, true, 'Mathematics', 8000, 8000),
  ('Mechanical Engineering', 'Bachelor', 'Turkish', 8000, 4, true, 'Mechanical Engineering', 8000, 8000),
  ('Mechatronics Engineering', 'Bachelor', 'Turkish', 2700, 4, true, 'Mechatronics Engineering', 4800, 2021),
  ('Midwifery', 'Bachelor', 'English', 8000, 4, true, 'Midwifery', 8000, 3000),
  ('Molecular Biology And Genetics', 'Bachelor', 'Turkish', 8000, 4, true, 'Molecular Biology And Genetics', 8000, 8000),
  ('New Media And Communication', 'Bachelor', 'Turkish', 7000, 4, true, 'New Media And Communication', 7000, 8000),
  ('Nutnition And Dietetics', 'Bachelor', 'English', 8000, 4, true, 'Nutnition And Dietetics', 8000, 3000),
  ('Nutrition And Dietetics', 'Bachelor', 'English', 9000, 4, true, 'Nutrition And Dietetics', 9000, NULL::numeric),
  ('Public Relations And Advertising', 'Bachelor', 'English', 7000, 4, true, 'Public Relations And Advertising', 7000, 3000),
  ('Radio Television And Film', 'Bachelor', 'Turkish', 7000, 4, true, 'Radio Television And Film', 7000, 8000),
  ('Software Development', 'Bachelor', 'Turkish', 8000, 4, true, 'Software Development', 8000, 8000),
  ('Speech And Language Therapy', 'Bachelor', 'English', 8000, 4, true, 'Speech And Language Therapy', 8000, 3000),
  ('Translation And Interpretation (English)', 'Bachelor', 'Turkish', 8000, 4, true, 'Translation And Interpretation (English)', 8000, 8000),
  ('Turkish Language And Literaturee', 'Bachelor', 'English', 8000, 4, true, 'Turkish Language And Literaturee', 8000, 3000),
  ('Visual Communication Design', 'Bachelor', 'English', 7000, 4, true, 'Visual Communication Design', 7000, 3000),
  ('Anatomy With Thesis', 'Master', 'English', 8500, 2, true, 'Anatomy With Thesis', 8500, 3000),
  ('Applied Economics', 'Master', 'Turkish', 3500, 1, true, 'Applied Economics', 5100, 2026),
  ('Artificial Intelligence Engineering With Thesis', 'Master', 'Turkish', 8500, 2, true, 'Artificial Intelligence Engineering With Thesis', 8500, 8000),
  ('Cinema And Television With Thesis', 'Master', 'Turkish', 8500, 2, true, 'Cinema And Television With Thesis', 8500, 8000),
  ('Civil Engineering', 'Master', 'Turkish', 3500, 1, true, 'Civil Engineering', 5100, 2026),
  ('Clinical Psychology', 'Master', 'English', 15000, 2, true, 'Clinical Psychology', 15000, 3000),
  ('Computer Engineering', 'Master', 'Turkish', 8000, 1, true, 'Computer Engineering', 8000, 3000),
  ('Computer Engineering With Thesis', 'Master', 'Turkish', 8500, 2, true, 'Computer Engineering With Thesis', 8500, 8000),
  ('Cyber Security', 'Master', 'Turkish', 8000, 1, true, 'Cyber Security', 8000, 8000),
  ('Cyber Security With Thesis', 'Master', 'Turkish', 8500, 2, true, 'Cyber Security With Thesis', 8500, 8000),
  ('Data Science', 'Master', 'English', 8000, 1, true, 'Data Science', 8000, 3000),
  ('Electronics Engineering With Thesis', 'Master', 'Turkish', 4000, 2, true, 'Electronics Engineering With Thesis', 5100, 2026),
  ('Executive Business Administration With Thesis', 'Master', 'Turkish', 4000, 2, true, 'Executive Business Administration With Thesis', 5100, 2026),
  ('Fashion And Textile Design', 'Master', 'English', 8000, 1, true, 'Fashion And Textile Design', 8000, 3000),
  ('Fashion And Textile Design With Thesis', 'Master', 'English', 8500, 2, true, 'Fashion And Textile Design With Thesis', 8500, 3000),
  ('Gastronomy And Culinary Arts', 'Master', 'English', 8000, 2, true, 'Gastronomy And Culinary Arts', 8000, 3000),
  ('Gastronomy And Culinary Arts With Thesis', 'Master', 'English', 8500, 2, true, 'Gastronomy And Culinary Arts With Thesis', 8500, 3000),
  ('Health Management With Thesis', 'Master', 'English', 8500, 2, true, 'Health Management With Thesis', 8500, 3000),
  ('Health Mangement', 'Master', 'English', 8000, 2, true, 'Health Mangement', 8000, 3000),
  ('Industrial Engineering', 'Master', 'Turkish', 3500, 1, true, 'Industrial Engineering', 5100, 2026),
  ('Industrial Engineering With Thesis', 'Master', 'Turkish', 4000, 2, true, 'Industrial Engineering With Thesis', 5100, 2026),
  ('Information Technologies With Thesis', 'Master', 'Turkish', 4000, 2, true, 'Information Technologies With Thesis', 5100, 2026),
  ('Interior Architecture With Thesis', 'Master', 'English', 8500, 2, true, 'Interior Architecture With Thesis', 8500, 3000),
  ('Management Information Systems With Thesis', 'Master', 'Turkish', 8500, 2, true, 'Management Information Systems With Thesis', 8500, 8000),
  ('Mechanical Engineering', 'Master', 'Turkish', 3500, 1, true, 'Mechanical Engineering', 5100, 2021),
  ('Mechanical Engineering With Thesis', 'Master', 'Turkish', 4000, 2, true, 'Mechanical Engineering With Thesis', 5100, 2026),
  ('Medical Biology And Genetics With Thesis', 'Master', 'English', 8500, 2, true, 'Medical Biology And Genetics With Thesis', 8500, 3000),
  ('Midwifery With Thesis', 'Master', 'English', 8500, 2, true, 'Midwifery With Thesis', 8500, 3000),
  ('Molecular Biology And Genetics With Thesis', 'Master', 'Turkish', 8500, 2, true, 'Molecular Biology And Genetics With Thesis', 8500, 8000),
  ('Neuroscience With Thesis', 'Master', 'English', 8500, 2, true, 'Neuroscience With Thesis', 8500, 3000),
  ('Nutntion And Dietetics', 'Master', 'English', 8000, 2, true, 'Nutntion And Dietetics', 8000, 3000),
  ('Nutrition And Dietetics', 'Master', 'English', 8000, 1, true, 'Nutrition And Dietetics', 8000, 3000),
  ('Nutrition And Dietetics With Thesis', 'Master', 'English', 8500, 2, true, 'Nutrition And Dietetics With Thesis', 8500, 3000),
  ('Obstetrics And Gynecologic Nursing', 'Master', 'English', 8000, 1, true, 'Obstetrics And Gynecologic Nursing', 8000, 3000),
  ('Obstetrics And Gynecologic Nursing With The:', 'Master', 'English', 8500, 1, true, 'Obstetrics And Gynecologic Nursing With The:', 8500, 3000),
  ('Occupational Health And Safety', 'Master', 'English', 8000, 1, true, 'Occupational Health And Safety', 8000, 3000),
  ('Pharmacology And Cancer Biology With Thesis', 'Master', 'English', 8500, 2, true, 'Pharmacology And Cancer Biology With Thesis', 8500, 3000),
  ('Psychology', 'Master', 'English', 8000, 1, true, 'Psychology', 8000, 3000),
  ('Psychology With Thesis', 'Master', 'English', 8500, 2, true, 'Psychology With Thesis', 8500, 3000),
  ('Speech And Language Therapy With Thesis', 'Master', 'English', 8500, 2, true, 'Speech And Language Therapy With Thesis', 8500, 3000),
  ('Sports Physiotherapy With Thesis', 'Master', 'English', 8500, 2, true, 'Sports Physiotherapy With Thesis', 8500, 3000),
  ('Stem Cell And Tissue Engineering With Thesis', 'Master', 'English', 8500, 2, true, 'Stem Cell And Tissue Engineering With Thesis', 8500, 3000),
  ('Surgical Nursing', 'Master', 'English', 8000, 1, true, 'Surgical Nursing', 8000, 3000),
  ('Surgical Nursing With Thesis', 'Master', 'English', 8500, 2, true, 'Surgical Nursing With Thesis', 8500, 3000),
  ('Turkish Language And Literature With Thesis', 'Master', 'English', 8500, 2, true, 'Turkish Language And Literature With Thesis', 8500, 3000),
  ('mooled Economies with nests', 'Master', 'Turkish', 4000, 2, true, 'mooled Economies with nests', 5100, 2021)
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
