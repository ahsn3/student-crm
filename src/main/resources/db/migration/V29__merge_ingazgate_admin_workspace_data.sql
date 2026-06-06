DO $$
DECLARE
  canonical_admin_id UUID;
  has_email_domain BOOLEAN;
  ingaz_filter TEXT;
BEGIN
  SELECT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_name = 'app_user'
      AND column_name = 'email_domain'
  )
  INTO has_email_domain;

  IF has_email_domain THEN
    ingaz_filter := 'lower(coalesce(email_domain, '''')) = ''ingazgate.com'' OR lower(email) LIKE ''%@ingazgate.com''';
  ELSE
    ingaz_filter := 'lower(email) LIKE ''%@ingazgate.com''';
  END IF;

  EXECUTE
    'SELECT id FROM app_user WHERE ' || ingaz_filter || ' ORDER BY created_at ASC, id ASC LIMIT 1'
    INTO canonical_admin_id;

  IF canonical_admin_id IS NULL THEN
    RETURN;
  END IF;

  IF to_regclass('student') IS NOT NULL THEN
    EXECUTE
      'UPDATE student
       SET owner_user_id = $1
       WHERE owner_user_id IN (SELECT id FROM app_user WHERE ' || ingaz_filter || ')
         AND owner_user_id <> $1'
      USING canonical_admin_id;
  END IF;

  IF to_regclass('application') IS NOT NULL THEN
    EXECUTE
      'UPDATE application
       SET owner_user_id = $1
       WHERE owner_user_id IN (SELECT id FROM app_user WHERE ' || ingaz_filter || ')
         AND owner_user_id <> $1'
      USING canonical_admin_id;
  END IF;

  IF to_regclass('student_service_record') IS NOT NULL THEN
    EXECUTE
      'UPDATE student_service_record
       SET owner_user_id = $1
       WHERE owner_user_id IN (SELECT id FROM app_user WHERE ' || ingaz_filter || ')
         AND owner_user_id <> $1'
      USING canonical_admin_id;
  END IF;

  IF to_regclass('application_attachment') IS NOT NULL THEN
    EXECUTE
      'UPDATE application_attachment
       SET owner_user_id = $1
       WHERE owner_user_id IN (SELECT id FROM app_user WHERE ' || ingaz_filter || ')
         AND owner_user_id <> $1'
      USING canonical_admin_id;
  END IF;

  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_name = 'app_user'
      AND column_name = 'can_manage_agents'
  ) THEN
    EXECUTE
      'UPDATE app_user
       SET can_manage_agents = true
       WHERE ' || ingaz_filter;
  END IF;
END $$;
