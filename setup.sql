PRAGMA foreign_keys = ON; -- this is for SQLite only

DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS artist_album;

CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    album_id INT REFERENCES album(id)
);

CREATE TABLE artist_album (
    artist_id INT REFERENCES artist(id),
    album_id INT REFERENCES album(id)
);

INSERT INTO album (title, release_year) VALUES ("Super Awesome Album", 1990);
INSERT INTO album (title) VALUES ("Super Funky Album");
INSERT INTO album (title, release_year) VALUES ("Super Disco Album", 1978);
INSERT INTO album (title, release_year) VALUES ("Super Hairband Album", 1984);
INSERT INTO album (title) VALUES ("Super Dubstep Album");

INSERT INTO artist (name) VALUES ("Luke and the Droidtones");
INSERT INTO artist (name) VALUES ("Leia and the Ewoks");
INSERT INTO artist (name) VALUES ("Han Solo");

INSERT INTO artist_album (artist_id, album_id) VALUES (1, 5);
INSERT INTO artist_album (artist_id, album_id) VALUES (1, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 1);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 3);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 4);

INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 1", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 2", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 3", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 4", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 5", 1);

INSERT INTO track (title, album_id) VALUES ("Super Funky Track 1", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 2", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 3", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 4", 2);

INSERT INTO track (title, album_id) VALUES ("Super Disco Track 1", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 2", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 3", 3);

INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 1", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 2", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 3", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 4", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 5", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 6", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 7", 4);

INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 1", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 2", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 3", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 4", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 5", 5);

SELECT title FROM album;

SELECT title FROM album WHERE release_year BETWEEN 1975 AND 1990;

SELECT title FROM album WHERE title LIKE 'Super D%';

SELECT title FROM album WHERE release_year is NULL;

SELECT track.title FROM track, album WHERE track.album_id = album.id
   AND album.title IS 'Super Funky Album';

SELECT track.title AS Track_Title FROM track, album
   WHERE track.album_id = album.id
   AND album.title IS 'Super Funky Album';

SELECT album.title FROM album, artist, artist_album
    WHERE artist_album.artist_id = artist.id 
    AND artist_album.album_id = album.id
    AND artist.name IS "Han Solo";

SELECT AVG(release_year) FROM album; -- OR --
SELECT avg(release_year) FROM album, artist, artist_album
    WHERE artist.name = 'Leia and the Ewoks'
    AND artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id;

SELECT COUNT(*) FROM artist;

SELECT COUNT(*) FROM album JOIN track
    WHERE track.album_id = album.id
    AND album.title = 'Super Dubstep Album'; -- OR --
SELECT COUNT(*) FROM track, album WHERE track.album_id = album.id AND album.id = 5;




