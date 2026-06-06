ALTER TABLE crm_lead
  ADD COLUMN IF NOT EXISTS student_id UUID REFERENCES student(id),
  ADD COLUMN IF NOT EXISTS application_id UUID REFERENCES application(id);

CREATE INDEX IF NOT EXISTS idx_crm_lead_student ON crm_lead(student_id);
CREATE INDEX IF NOT EXISTS idx_crm_lead_application ON crm_lead(application_id);
