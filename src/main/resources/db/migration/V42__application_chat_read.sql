CREATE TABLE application_chat_read (
  application_id UUID NOT NULL REFERENCES application(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  last_read_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (application_id, user_id)
);

CREATE INDEX idx_application_chat_read_user ON application_chat_read(user_id);
