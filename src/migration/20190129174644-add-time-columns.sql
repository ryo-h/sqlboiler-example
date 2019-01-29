-- +migrate Up
ALTER TABLE users ADD COLUMN created_at timestamp;
ALTER TABLE users ADD COLUMN updated_at timestamp;

-- +migrate Down
ALTER TABLE users DROP COLUMN created_at;
ALTER TABLE users DROP COLUMN updated_at;
