#!/bin/bash

docker-compose up -d db
# TODO できれば起動をチェックしたい
sleep 3
sql-migrate up -config src/config/dbconfig.yaml
sqlboiler -c src/config/sqlboiler.toml psql
docker-compose stop