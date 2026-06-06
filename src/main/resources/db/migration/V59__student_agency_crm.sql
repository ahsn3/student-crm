-- Employee departments for routing
ALTER TABLE employee ADD COLUMN IF NOT EXISTS department TEXT;

UPDATE employee SET department = 'REGISTRATION' WHERE department IS NULL;

ALTER TABLE employee ALTER COLUMN department SET NOT NULL;

UPDATE employee SET department = 'REGISTRATION' WHERE email = 'ahmed.test@telegram.local';
UPDATE employee SET department = 'TRANSFER' WHERE email = 'ziad.test@telegram.local';

CREATE INDEX IF NOT EXISTS idx_employee_department_active ON employee(department, active, last_assigned_at NULLS FIRST);

-- Student agency lead fields
ALTER TABLE crm_lead RENAME COLUMN name TO student_name;

ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS lead_type TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS nationality TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS current_university TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS target_university TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS current_major TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS desired_major TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS study_year TEXT;
ALTER TABLE crm_lead ADD COLUMN IF NOT EXISTS degree_level TEXT;

UPDATE crm_lead SET lead_type = 'GENERAL_INQUIRY' WHERE lead_type IS NULL;
UPDATE crm_lead SET status = 'IN_PROGRESS' WHERE status IN ('ASSIGNED', 'QUALIFIED');
UPDATE crm_lead SET status = 'ACCEPTED' WHERE status = 'WON';
UPDATE crm_lead SET status = 'REJECTED' WHERE status = 'LOST';

ALTER TABLE crm_lead ALTER COLUMN lead_type SET NOT NULL;

CREATE INDEX IF NOT EXISTS idx_crm_lead_type ON crm_lead(lead_type);
CREATE INDEX IF NOT EXISTS idx_crm_lead_assigned_status ON crm_lead(assigned_employee_id, status);

-- Follow-up notes timeline
CREATE TABLE IF NOT EXISTS lead_note (
  id UUID PRIMARY KEY,
  lead_id UUID NOT NULL REFERENCES crm_lead(id) ON DELETE CASCADE,
  employee_id UUID NOT NULL REFERENCES employee(id),
  note TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_lead_note_lead ON lead_note(lead_id, created_at DESC);

-- Status change audit trail
CREATE TABLE IF NOT EXISTS lead_status_history (
  id UUID PRIMARY KEY,
  lead_id UUID NOT NULL REFERENCES crm_lead(id) ON DELETE CASCADE,
  employee_id UUID REFERENCES employee(id),
  old_status TEXT,
  new_status TEXT NOT NULL,
  changed_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_lead_status_history_lead ON lead_status_history(lead_id, changed_at DESC);
