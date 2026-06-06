CREATE TABLE IF NOT EXISTS app_user (
  id UUID PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  display_name TEXT NOT NULL,
  role TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS company_account (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  legal_name TEXT,
  type TEXT,
  email TEXT,
  phone TEXT,
  foundation_year INT,
  tax_id TEXT,
  tax_office TEXT,
  employees_count INT,
  website TEXT,
  address TEXT,
  logo_url TEXT,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

