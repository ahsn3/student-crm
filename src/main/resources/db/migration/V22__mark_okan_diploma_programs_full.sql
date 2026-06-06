-- Mark Okan University diploma programs as full (quota closed), based on the latest intake status.
UPDATE program p
SET available = false,
    updated_at = now()
FROM university u
WHERE p.university_id = u.id
  AND lower(trim(u.name)) = lower(trim('Okan University'))
  AND lower(trim(coalesce(p.degree, ''))) = 'diploma';
