CREATE TABLE student_service (
  id UUID PRIMARY KEY,
  owner_user_id UUID NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
  student_id UUID NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  service_key VARCHAR(64) NOT NULL,
  details TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_student_service_owner_service_created
  ON student_service(owner_user_id, service_key, created_at DESC);

CREATE INDEX idx_student_service_student
  ON student_service(student_id);
