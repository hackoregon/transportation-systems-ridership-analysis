#! /bin/bash

set +e # continue on error

echo "Dropping 'passenger_census'"
dropdb passenger_census
echo "Creating 'passenger_census'"
createdb passenger_census
echo "Restoring 'passenger_census'"
pg_restore --no-owner --dbname=passenger_census ../../data/interim/passenger_census.backup
