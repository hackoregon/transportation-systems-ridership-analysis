FROM docker.io/znmeb/postgis
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@znmeb.net>"

# files in this directory run after the database is initialized and started
RUN mkdir -p /docker-entrypoint-initdb.d/
COPY ingest.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/ingest.sh

# add a non-root user
RUN useradd -c "Hack Oregon" --user-group --shell /bin/bash --create-home hacko
RUN mkdir -p /home/hacko/
COPY *sql /home/hacko/
COPY passenger_census.csv /home/hacko/
RUN chown -R hacko:hacko /home/hacko/
