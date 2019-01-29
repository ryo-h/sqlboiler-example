-- +migrate Up
CREATE TABLE IF NOT EXISTS users (id serial PRIMARY KEY);

-- +migrate Down
DROP TABLE IF EXISTS users;
