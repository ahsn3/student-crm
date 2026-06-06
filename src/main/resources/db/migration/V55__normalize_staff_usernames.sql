-- Use plain usernames for staff accounts (admin instead of admin@local).
UPDATE app_user
SET email = split_part(email, '@', 1),
    email_domain = 'local'
WHERE upper(coalesce(role, '')) IN ('ADMIN', 'EMPLOYEE')
  AND position('@' in email) > 0
  AND lower(split_part(email, '@', 2)) = 'local';
