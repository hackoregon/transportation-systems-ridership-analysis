#! /bin/bash

echo "Creating the database"
psql < /home/hacko/ingest.psql
echo "Creating the database dump"
pg_dump --verbose --clean --if-exists --create --dbname=passenger_census \
  > /home/hacko/passenger_census.sql
