CREATE TABLE IF NOT EXISTS nav_section_seen (
    user_id UUID NOT NULL,
    section VARCHAR(32) NOT NULL,
    last_seen_at TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (user_id, section)
);
