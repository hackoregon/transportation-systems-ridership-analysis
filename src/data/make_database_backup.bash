#! /bin/bash

# assumes
# 1. Linux,
# 2. PostgreSQL with trust authentication for your user ID, You do *not* need PostGIS!
# 3. Your user ID has database creation privileges.

echo "Creating the database"
psql -f make_database.sql
echo "Creating the database backup"
pg_dump --format=custom --verbose --dbname=passenger_census \
  > ../../data/interim/passenger_census.backup
