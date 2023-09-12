-- Active: 1694493132153@@127.0.0.1@3306

-- CREATE DATABASE test; create a blank db

-- DROP DATABASE test; delete or drop a db with all its contents

-- CREATE DATABASE record_company; creates a blank db

-- USE record_company; confirms selected db



-- CREATE TABLE test (
--     test_column INT
-- );

-- ALTER TABLE test
-- ADD another_column VARCHAR(255);

-- DROP TABLE test;


CREATE TABLE bands (
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);


CREATE TABLE albums (
    ID_Album INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Release_Year INT,
    band_ID INT NOT NULL,
    PRIMARY KEY (ID_Album),
    FOREIGN KEY (band_ID) REFERENCES bands(ID)
);



INSERT INTO bands (name)
VALUES ('Iron Maiden');


INSERT INTO bands (name)
VALUES ('DUUCE'), ('Avenge Seven Fold'), ('Ankor');


SELECT * FROM bands;

SELECT * FROM bands
LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID #',  name AS 'Band Name'
FROM bands;


SELECT * FROM bands
ORDER BY name;

SELECT * FROM bands
ORDER BY DESC;



INSERT INTO albums
(name, Release_Year, band_ID)
VALUES 
('The Number of the Beasts', 1985, 1),
('Power Slave', 1984, 1),
('Nightmare', 2018,2),
('Nightmare', 2018, 3),
('Test Album', NULL, 3);     


SELECT * FROM albums;

SELECT name FROM albums;

SELECT DISTINCT name FROM albums;

UPDATE albums
SET Release_Year = 1982
WHERE ID_Album = 1;

SELECT * FROM albums
WHERE Release_year < 2000;

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_ID = 2

SELECT * FROM albums
WHERE Release_Year = 1984  AND band_ID = 1


SELECT * FROM albums
WHERE Release_Year  BETWEEN 2000 AND 2018



SELECT * FROM albums
WHERE Release_Year iS NULL


DELETE FROM albums
WHERE ID_Album = 5




SELECT * FROM bands
JOIN albums ON bands.ID = albums.band_ID



SELECT * FROM bands
LEFT JOIN albums ON bands.ID = albums.band_ID



SELECT * FROM albums
RIGHT JOIN bands ON bands.ID = albums.band_ID








SELECT SUM(Release_Year) FROM albums



SELECT band_ID, COUNT(band_ID) FROM albums
GROUP BY band_ID


SELECT b.name AS band_Name, COUNT(a.ID_album) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.ID = a.ID_Album
GROUP BY b.ID