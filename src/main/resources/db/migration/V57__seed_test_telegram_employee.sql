-- Temporary test sales employee (remove after real employees are registered).
INSERT INTO employee (
  id,
  name,
  email,
  telegram_chat_id,
  telegram_username,
  active,
  created_at
)
VALUES (
  'e0000000-0000-4000-8000-000000000001',
  'Ahmed Hassan',
  'ahmed.test@telegram.local',
  1200680291,
  'a_hsnn3',
  true,
  now()
)
ON CONFLICT (email) DO UPDATE SET
  name = EXCLUDED.name,
  telegram_chat_id = EXCLUDED.telegram_chat_id,
  telegram_username = EXCLUDED.telegram_username,
  active = EXCLUDED.active;
