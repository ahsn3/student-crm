ALTER TABLE student_service
  ADD COLUMN end_date date;

CREATE INDEX idx_student_service_owner_end
  ON student_service(owner_user_id, service_key, end_date);
