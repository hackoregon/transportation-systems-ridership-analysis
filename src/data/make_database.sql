-- create a fresh instance of the user
DROP OWNED BY transportation-systems CASCADE;
DROP ROLE IF EXISTS transportation-systems;
CREATE USER transportation-systems WITH
  ENCRYPTED PASSWORD
  NOCREATEDB
  NOCREATEROLE
  NOSUPERUSER
  NOREPLICATION
;

-- create a fresh database owned by the user
DROP DATABASE IF EXISTS passenger_census;
CREATE DATABASE passenger_census WITH OWNER = transportation-systems;
\connect passenger_census

CREATE TABLE passenger_census (
  summary_begin_date date,
  route_number integer,
  direction integer,
  service_key text,
  stop_seq integer,
  location_id integer,
  public_location_description text,
  ons integer,
  offs integer,
  x_coord double precision,
  y_coord double precision
);

\copy passenger_census from '../../data/raw/passenger_census.csv' with csv header

-- we don't have PostGIS so we just add a column with the SRID for consumers!
-- see ../../docs/ridership_data_dictionary.md
ALTER TABLE passenger_census ADD COLUMN epsg_srid integer;
UPDATE passenger_census
  SET epsg_srid = 2913;

-- create a primary key - Django needs it
ALTER TABLE passenger_census
  ADD COLUMN id serial;
ALTER TABLE passenger_census
  ADD CONSTRAINT passenger_census_pkey PRIMARY KEY (id);
