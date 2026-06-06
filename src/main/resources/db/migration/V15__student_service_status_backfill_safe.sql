DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = current_schema()
      AND table_name = 'student_service'
  ) THEN
    IF NOT EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = current_schema()
        AND table_name = 'student_service'
        AND column_name = 'status'
    ) THEN
      ALTER TABLE student_service ADD COLUMN status VARCHAR(40);
    END IF;

    UPDATE student_service
    SET status = 'NEW'
    WHERE status IS NULL;

    ALTER TABLE student_service
      ALTER COLUMN status SET NOT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_student_service_owner_service_status
  ON student_service(owner_user_id, service_key, status);
