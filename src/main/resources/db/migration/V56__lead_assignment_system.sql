CREATE TABLE IF NOT EXISTS employee (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  telegram_chat_id BIGINT,
  telegram_username TEXT,
  active BOOLEAN NOT NULL DEFAULT true,
  last_assigned_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS crm_lead (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT,
  email TEXT,
  company TEXT,
  service_requested TEXT,
  notes TEXT,
  status TEXT NOT NULL DEFAULT 'NEW',
  source TEXT,
  assigned_employee_id UUID REFERENCES employee(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS lead_assignment_history (
  id UUID PRIMARY KEY,
  lead_id UUID NOT NULL REFERENCES crm_lead(id) ON DELETE CASCADE,
  employee_id UUID NOT NULL REFERENCES employee(id),
  assigned_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_crm_lead_assigned_employee ON crm_lead(assigned_employee_id);
CREATE INDEX IF NOT EXISTS idx_crm_lead_status ON crm_lead(status);
CREATE INDEX IF NOT EXISTS idx_crm_lead_created_at ON crm_lead(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_lead_assignment_history_lead ON lead_assignment_history(lead_id);
CREATE INDEX IF NOT EXISTS idx_lead_assignment_history_employee ON lead_assignment_history(employee_id);
CREATE INDEX IF NOT EXISTS idx_employee_active_last_assigned ON employee(active, last_assigned_at NULLS FIRST);
