-- Idempotent: if V30 failed on PostgreSQL < 11 (no IF NOT EXISTS for ADD COLUMN), add link_url here.
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = current_schema()
      AND table_name = 'admin_notification'
      AND column_name = 'link_url'
  ) THEN
    ALTER TABLE admin_notification ADD COLUMN link_url TEXT;
  END IF;
END $$;
