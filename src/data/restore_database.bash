#! /bin/bash

set +e # continue on error

dropdb passenger_census
createdb passenger_census
pg_restore --no-owner --dbname=passenger_census ../../data/interim/passenger_census.backup
