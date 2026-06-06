-- Restore Altınbaş University (removed in V6 alongside demo seeds).
INSERT INTO university (id, name, country, website, currency, programs_count, campuses_count, logo_url, created_at)
SELECT gen_random_uuid(),
       'Altınbaş University',
       'Turkey',
       'https://altinbas.edu.tr/',
       'USD',
       102,
       3,
       'https://www.google.com/s2/favicons?domain=altinbas.edu.tr&sz=128',
       now()
WHERE NOT EXISTS (
  SELECT 1 FROM university u WHERE lower(trim(u.name)) = lower(trim('Altınbaş University'))
);
