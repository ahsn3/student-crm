CREATE TABLE IF NOT EXISTS university (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT,
  website TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS program (
  id UUID PRIMARY KEY,
  university_id UUID REFERENCES university(id),
  name TEXT NOT NULL,
  degree TEXT,
  language TEXT,
  cost NUMERIC(12, 2),
  years INT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS agent (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  type TEXT,
  legal_name TEXT,
  phone TEXT,
  email TEXT,
  website TEXT,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS student (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  agent_id UUID REFERENCES agent(id) ON DELETE SET NULL,
  full_name TEXT NOT NULL,
  passport_no TEXT,
  father_name TEXT,
  mother_name TEXT,
  gender TEXT,
  email TEXT,
  phone TEXT,
  semester TEXT,
  nationality TEXT,
  country TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS application (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  student_id UUID NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  program_id UUID REFERENCES program(id) ON DELETE SET NULL,
  application_number TEXT NOT NULL UNIQUE,
  status TEXT NOT NULL,
  items_count INT NOT NULL DEFAULT 0,
  semester TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS complaint (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT,
  status TEXT NOT NULL DEFAULT 'OPEN',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS news_item (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT,
  published BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_agent_owner ON agent(owner_user_id);
CREATE INDEX IF NOT EXISTS idx_student_owner ON student(owner_user_id);
CREATE INDEX IF NOT EXISTS idx_application_owner ON application(owner_user_id);
CREATE INDEX IF NOT EXISTS idx_application_student ON application(student_id);
CREATE INDEX IF NOT EXISTS idx_complaint_owner ON complaint(owner_user_id);
CREATE INDEX IF NOT EXISTS idx_news_owner ON news_item(owner_user_id);
CREATE UNIQUE INDEX IF NOT EXISTS uq_app_user_email_lower ON app_user ((lower(email)));

