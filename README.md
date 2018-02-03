# ingest-ridership-data
Loading the ridership data into a PostgreSQL database

## Usage
1. Clone this repo and `cd` into it.
2. Copy the raw data file `passenger_census.csv` into the directory.
3. `docker-compose up --build`. This will run everything. When it finishes you'll see

    ```
    passenger_census_1  | PostgreSQL init process complete; ready for start up.
    passenger_census_1  |
    passenger_census_1  | 2018-02-03 01:26:37.844 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
    passenger_census_1  | 2018-02-03 01:26:37.845 UTC [1] LOG:  listening on IPv6 address "::", port 5432
    passenger_census_1  | 2018-02-03 01:26:37.952 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
    passenger_census_1  | 2018-02-03 01:26:38.171 UTC [71] LOG:  database system was shut down at 2018-02-03 01:26:36 UTC
    passenger_census_1  | 2018-02-03 01:26:38.230 UTC [1] LOG:  database system is ready to accept connections
    ```

    Press `CTL-C` to stop the container. Do *not* bring the network down yet!

4. Copy the resulting SQL dump file out of the container.

    ```
    docker cp ingestridershipdata_passenger_census_1:/home/postgres/passenger_census.sql .
    ```

    You can bring the Docker network down once you've copied out the SQL dump file with `docker-compose down`.
