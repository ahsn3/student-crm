CREATE TABLE application_attachment (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  application_id UUID NOT NULL REFERENCES application(id) ON DELETE CASCADE,
  file_name VARCHAR(260) NOT NULL,
  content_type VARCHAR(120),
  size_bytes BIGINT NOT NULL,
  content BYTEA NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_app_attachment_owner_app_created
  ON application_attachment(owner_user_id, application_id, created_at DESC);
