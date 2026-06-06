ALTER TABLE student_service
  ADD COLUMN status VARCHAR(40) NOT NULL DEFAULT 'NEW';

CREATE INDEX idx_student_service_owner_service_status
  ON student_service(owner_user_id, service_key, status);
