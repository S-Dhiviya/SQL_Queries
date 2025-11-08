CREATE DATABASE IMDB;
USE IMDB;

CREATE TABLE movie(
movie_id INT PRIMARY KEY NOT NULL,
title VARCHAR(100) NOT NULL,
director VARCHAR(100) NOT NULL,
release_year YEAR 
);

INSERT INTO movie(movie_id,title,director,release_year) VALUES 
(101,'Dangal','Nitesh Tiwari',2016),
(102,'Baahubali2','Rajamouli',2017),
(103,'PK','Rajkumar Hirani',2014),
(104,'Leo','Lokesh Kanagaraj',2023),
(105,'RRR','Rajamouli',2022);

SELECT * FROM movie;

CREATE TABLE media(
media_id INT PRIMARY KEY AUTO_INCREMENT,
movie_id INT,
media_type VARCHAR(200),
media_url VARCHAR(200),
FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

INSERT INTO media(movie_id,media_type,media_url) VALUES 
(101,'Dangal.mp4','https://dangal.mp4'),
(102,'Baahubali2.jpeg','https://baahubali.mp3'),
(103,'PKteaser.mp4','https://web//pk.mp4'),
(104,'Leotrailer.mp4','www.leo.mp4'),
(105,'RRR.png','https://rrr.mp3');

SELECT * FROM media;

CREATE TABLE genre(
genre_id INT PRIMARY KEY AUTO_INCREMENT,
movie_id INT,
movie_genre VARCHAR(100),
FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

INSERT INTO genre(movie_id,movie_genre) VALUES 
(101,'Sports'),(102,'History'),(102,'Adventure'),(103,'Crime'),(103,'Suspense'),
(104,'Mystery'),(104,'Gangster'),(105,'War');

SELECT * FROM genre;

CREATE TABLE user(
user_id INT PRIMARY KEY NOT NULL,
movie_id INT,
influencer VARCHAR(50),
people VARCHAR(50),
film_critics VARCHAR(50),
journalists VARCHAR(50),
FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

INSERT INTO user(user_id,movie_id,influencer,people,film_critics,journalists) VALUES
(111,101,'Andrea David','Ritu','Deepak Dua','Anupama Chopra'),
(112,102,'Rishab Raj','Diya','Sucharita Tyagi','Khalid Mohamed'),
(113,104,'Ayush Mehra','Charan','Rajeev Masand','B. K. Karanjia');

SELECT * FROM user;

CREATE TABLE reviews(
review_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
FOREIGN KEY(user_id) REFERENCES user(user_id),
comments VARCHAR(200)
);

INSERT INTO reviews(user_id,comments) VALUES
(111,'DANGAL is a masterpiece'),
(112,'Baahubali2 is the finest film to come out of the film industry in a long time'),
(113,'Leo flashback segments seemed unconvincing, which affected the second half'),
(111,'Vijay delivers a commendable performance in both of his roles'),
(113,'Allu Arjun is so powerful that it looks like there is no real antagonist');
 
 SELECT * FROM reviews;
 
CREATE TABLE artist(
artist_id INT PRIMARY KEY,
movie_id INT,
artist_name VARCHAR(100),
skills VARCHAR(100),
FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

INSERT INTO artist(artist_id,movie_id,artist_name,skills) VALUES
(201,101,'Aamir Khan','Martial Arts'),
(202,101,'Fatima Sana','Dancer'),
(203,102,'Prabhas','Fighter'),
(204,102,'Anushuka','Acting'),
(205,103,'Allu Arjun','Acting'),
(206,104,'Vijay','Singer'),
(207,104,'Vijay','Dancer');

SELECT * FROM artist;

CREATE TABLE roles(
artist_id INT,
artist_role VARCHAR(100),
FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
);

INSERT INTO roles(artist_id,artist_role) VALUES
(201,'Trainer'),
(202,'Student'),
(203,'Hero'),
(204,'Heroine'),
(205,'Thief'),
(205,'Hero'),
(206,'Police');

SELECT * FROM roles;

SELECT movie_id,title,director from movie where release_year IN (2014,2017);

SELECT movie_id,director from movie where director LIKE 'R%';

SELECT movie_id,media_type as media_video, media_url as url FROM media;

UPDATE genre set movie_genre='Epic-War' where movie_id=105;

SELECT user_id,comments FROM reviews where user_id= (SELECT user_id from user LIMIT 1);

SELECT movie_id,COUNT(*) from artist GROUP BY movie_id;

Select title,artist_name from movie 
Inner JOIN artist where movie.movie_id=artist.movie_id;

SELECT  artist_name, artist_role FROM artist
RIGHT JOIN roles on artist.artist_id=roles.artist_id;

DROP TABLE roles;

DROP DATABASE IMDB;
