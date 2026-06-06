ALTER TABLE program
  ADD COLUMN IF NOT EXISTS name_ar TEXT,
  ADD COLUMN IF NOT EXISTS before_discount NUMERIC(12, 2),
  ADD COLUMN IF NOT EXISTS cash_price NUMERIC(12, 2),
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;

UPDATE program SET updated_at = created_at WHERE updated_at IS NULL;
