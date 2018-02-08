#! /bin/bash

echo "Building the image"
docker-compose build
echo "Running the ingestion and database dump"
echo "CTL-C after the database restarts following dump"
sleep 15
docker-compose up 2>&1 | tee up.log

echo "Copying the dump file out of the container"
docker cp ingestridershipdata_passenger_census_1:/home/postgres/passenger_census.pgdump .
