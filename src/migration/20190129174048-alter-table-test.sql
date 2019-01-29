-- +migrate Up
ALTER TABLE users ADD COLUMN name text;

-- +migrate Down
ALTER TABLE users DROP COLUMN name;
