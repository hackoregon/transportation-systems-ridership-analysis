-- the standard database backup doesn't have the `postgis` extension or a geometry column
-- add them here
\connect passenger_census
CREATE EXTENSION postgis;

ALTER TABLE public.passenger_census
  ADD COLUMN geom geometry;
UPDATE passenger_census
  SET geom = ST_SetSRID(ST_MakePoint(x_coord, y_coord), epsg_srid);
