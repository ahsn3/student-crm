-- Default admin login: admin / admin123
INSERT INTO app_user (
  id,
  email,
  password_hash,
  display_name,
  role,
  created_at,
  email_domain,
  can_manage_agents
)
VALUES (
  'a0000000-0000-4000-8000-000000000001',
  'admin',
  '$2y$10$AL2kUhXYWYxpqXu0j78.ce3mYQk3doe2.ZFmfSDyPDJSNQTTEI4cG',
  'Administrator',
  'ADMIN',
  now(),
  'local',
  true
)
ON CONFLICT (email) DO UPDATE SET
  password_hash = EXCLUDED.password_hash,
  display_name = EXCLUDED.display_name,
  role = EXCLUDED.role,
  email_domain = EXCLUDED.email_domain,
  can_manage_agents = EXCLUDED.can_manage_agents;
