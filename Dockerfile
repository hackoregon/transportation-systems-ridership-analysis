FROM docker.io/znmeb/postgis
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@znmeb.net>"

# files in this directory run after the database is initialized and started
RUN mkdir -p /docker-entrypoint-initdb.d/
COPY ingest.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/ingest.sh

# create a workspace for the 'postgres' Linux user
RUN mkdir -p /home/postgres/
COPY *sql /home/postgres/
COPY passenger_census.csv /home/postgres/
RUN chown -R postgres:postgres /home/postgres/
