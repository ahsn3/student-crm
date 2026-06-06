-- If a failed deploy partially created tables from an earlier V33 draft, remove orphans
-- so the app maps to news_item (V2) + news_comment (V33).

DROP TABLE IF EXISTS news_comment CASCADE;
DROP TABLE IF EXISTS news_post CASCADE;

CREATE TABLE IF NOT EXISTS news_comment (
  id UUID PRIMARY KEY,
  news_item_id UUID NOT NULL REFERENCES news_item(id) ON DELETE CASCADE,
  author_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  body TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_news_comment_item ON news_comment(news_item_id, created_at ASC);

CREATE TABLE IF NOT EXISTS complaint_comment (
  id UUID PRIMARY KEY,
  complaint_id UUID NOT NULL REFERENCES complaint(id) ON DELETE CASCADE,
  author_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  body TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_complaint_comment_complaint ON complaint_comment(complaint_id, created_at ASC);
