-- Second test sales employee (Telegram /start registration).
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
  'e0000000-0000-4000-8000-000000000002',
  'Ziad Zayed',
  'ziad.test@telegram.local',
  6573722972,
  NULL,
  true,
  now()
)
ON CONFLICT (email) DO UPDATE SET
  name = EXCLUDED.name,
  telegram_chat_id = EXCLUDED.telegram_chat_id,
  telegram_username = EXCLUDED.telegram_username,
  active = EXCLUDED.active;
