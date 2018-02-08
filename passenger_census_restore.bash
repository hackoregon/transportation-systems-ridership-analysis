#! /bin/bash

dropdb passenger_census
createdb passenger_census
pg_restore --verbose --dbname=passenger_census passenger_census.backup
