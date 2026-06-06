-- Remove seed/demo universities and Altınbaş per product request (detach programs first).
DELETE FROM program
WHERE university_id IN (
  SELECT id FROM university
  WHERE lower(trim(name)) IN (
    lower(trim('Istanbul University')),
    lower(trim('Ankara University')),
    lower(trim('Marmara University')),
    lower(trim('Altınbaş University'))
  )
);

DELETE FROM university
WHERE lower(trim(name)) IN (
  lower(trim('Istanbul University')),
  lower(trim('Ankara University')),
  lower(trim('Marmara University')),
  lower(trim('Altınbaş University'))
);
