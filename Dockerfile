FROM postgres:10
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@znmeb.net>"

# Install PostGIS
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
  ca-certificates \
  postgis \
  postgresql-10-postgis-2.4 \
  postgresql-10-postgis-2.4-scripts \
  postgresql-10-postgis-scripts \
  && apt-get clean

# 'postgres' Linux home directory
RUN mkdir -p /home/postgres
RUN usermod --shell /bin/bash --home /home/postgres --move-home postgres

# files in this directory run after the database is initialized and started
RUN mkdir -p /docker-entrypoint-initdb.d/
COPY ingest.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/ingest.sh

# populate the 'postgres' Linux user workspace
COPY *sql /home/postgres/
COPY passenger_census.csv /home/postgres/
RUN chown -R postgres:postgres /home/postgres/

# change the port the server listens on
ARG CONTAINER_PORT
RUN echo $CONTAINER_PORT
ENV PGPORT=$CONTAINER_PORT
EXPOSE $CONTAINER_PORT
