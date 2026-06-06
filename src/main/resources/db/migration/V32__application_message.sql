CREATE TABLE application_message (
  id UUID PRIMARY KEY,
  application_id UUID NOT NULL REFERENCES application(id) ON DELETE CASCADE,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  sender_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  body TEXT,
  file_name TEXT,
  content_type TEXT,
  size_bytes BIGINT,
  content BYTEA,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_application_message_app_created
  ON application_message(application_id, created_at DESC);
