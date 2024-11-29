-- Databricks notebook source
-- Prépartion: masquage colonnes inutiles + insertion colonne horodatage

CREATE OR REPLACE TABLE
  table_preparee (
    artist_id STRING,
    artist_name STRING,
    duration DOUBLE,
    release STRING,
    tempo DOUBLE,
    time_signature DOUBLE,
    title STRING,
    year DOUBLE,
    processed_time TIMESTAMP
  );

INSERT INTO
  table_preparee
SELECT
  artist_id,
  artist_name,
  duration,
  release,
  tempo,
  time_signature,
  title,
  year,
  current_timestamp()
FROM
  table

-- COMMAND ----------

-- Which artists released the most songs each year?
SELECT
  artist_name,
  count(artist_name)
AS
  num_songs,
  year
FROM
  table_preparee
WHERE
  year > 0
GROUP BY
  artist_name,
  year
ORDER BY
  num_songs DESC,
  year DESC

-- COMMAND ----------

-- Find songs for your DJ list
 SELECT
   artist_name,
   title,
   tempo
 FROM
   table_preparee
 WHERE
   time_signature = 4
   AND
   tempo between 100 and 140;
