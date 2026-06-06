-- Idempotent repair for production DBs where V42/V43 partially applied or Flyway was disabled.

CREATE TABLE IF NOT EXISTS application_chat_read (
  application_id UUID NOT NULL REFERENCES application(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  last_read_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (application_id, user_id)
);

CREATE INDEX IF NOT EXISTS idx_application_chat_read_user ON application_chat_read(user_id);

CREATE TABLE IF NOT EXISTS nav_section_seen (
    user_id UUID NOT NULL,
    section VARCHAR(32) NOT NULL,
    last_seen_at TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (user_id, section)
);
