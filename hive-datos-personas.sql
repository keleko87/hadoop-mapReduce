CREATE DATABASE IF NOT EXISTS ejemplo_hive;
USE ejemplo_hive;

DROP TABLE IF EXISTS personas_HDFS;

-- Definimos la estructura (schema) sobre los archivos de HDFS
CREATE EXTERNAL TABLE personas_HDFS (
    id INT,
    nombre STRING,
    apellidos STRING,
    edad INT,
    ciudad STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/output/personas_sqoop';