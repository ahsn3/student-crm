ALTER TABLE app_user
  ADD COLUMN IF NOT EXISTS email_domain TEXT NOT NULL DEFAULT 'ingazgate.com',
  ADD COLUMN IF NOT EXISTS parent_user_id UUID REFERENCES app_user(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS can_manage_agents BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS office_name TEXT,
  ADD COLUMN IF NOT EXISTS logo_url TEXT;

UPDATE app_user
SET email_domain = lower(split_part(email, '@', 2))
WHERE email_domain IS NULL
   OR btrim(email_domain) = ''
   OR email_domain = 'ingazgate.com';

UPDATE app_user
SET can_manage_agents = true
WHERE role = 'ADMIN' AND lower(email_domain) = 'ingazgate.com';

CREATE TABLE IF NOT EXISTS admin_notification (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  message TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  is_read BOOLEAN NOT NULL DEFAULT false
);

CREATE INDEX IF NOT EXISTS idx_admin_notification_owner_created
  ON admin_notification(owner_user_id, created_at DESC);
