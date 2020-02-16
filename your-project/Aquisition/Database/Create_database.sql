-- Create DB
CREATE DATABASE country_battle;

-- Select the database and create the tables in it
CREATE TABLE artist (
	ID INT(7) AUTO_INCREMENT, PRIMARY KEY (ID),
    artist_name VARCHAR(255)
    );
    
CREATE TABLE genre (
	ID INT(5) AUTO_INCREMENT, PRIMARY KEY (ID),
    genre_name VARCHAR(255)
    );
    
CREATE TABLE country (
	ID INT(3) AUTO_INCREMENT, PRIMARY KEY (ID),
    country_name VARCHAR(255),
    alpha_2_code VARCHAR(4)
    );
    
CREATE TABLE track (
	ID INT(8) AUTO_INCREMENT, PRIMARY KEY (ID),
    track_name LONGTEXT,
    spotify_id VARCHAR(22), -- base-62 identifier, 22 chars.
	acousticness FLOAT,
    danceability FLOAT,
	duration_ms INT(7),
    energy FLOAT,
	instrumentalness FLOAT,
	track_key VARCHAR(3),
    liveness FLOAT,
    loudness FLOAT,
    track_mode VARCHAR(10),
    speechiness FLOAT,
    tempo FLOAT,
    time_signature VARCHAR(4),
    valence FLOAT,
    popularity INT(3),
    artist_id INT(7)
    );
 
	CREATE TABLE track_genre (
	ID INT(8) AUTO_INCREMENT, PRIMARY KEY (ID),
    track_id INT(8),
    genre_id INT(5)
    );
    
	CREATE TABLE top_artists_country (
	ID INT(7) AUTO_INCREMENT, PRIMARY KEY (ID),
    ranking INT(3),
    country_id INT(3),
    artist_id INT(7)
    );

-- Execute JN: Clean datasets and export to database.ipynb

-- Set relations
ALTER TABLE `track` ADD FOREIGN KEY (`artist_id`) REFERENCES `artist`(`ID`);
ALTER TABLE `track_genre` ADD FOREIGN KEY (`track_id`) REFERENCES `track`(`ID`);
ALTER TABLE `track_genre` ADD FOREIGN KEY (`genre_id`) REFERENCES `genre`(`ID`);
ALTER TABLE `top_artists_country` ADD FOREIGN KEY (`country_id`) REFERENCES `country`(`ID`);
ALTER TABLE `top_artists_country` ADD FOREIGN KEY (`artist_id`) REFERENCES `artist`(`ID`);