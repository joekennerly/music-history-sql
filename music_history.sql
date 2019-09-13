--Query all of the entries in the Genre table

SELECT *
FROM Genre;

--Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (null, "Joe Lizzo", 2019);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (null, "Back in Business", "09/14/2019", 3020, "NSS Records", 28, 5);

--Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "P-P-P-Python", 60, "09/14/2019", 5, 28, 28);

--Write a SELECT query that provides the song titles, album title, 
--and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, 
--and the WHERE keyword to filter the results to the album and artist you added.

SELECT s.Title, a.Title, ar.ArtistName
FROM Song s
LEFT JOIN Album a
ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar
ON s.ArtistId = ar.ArtistId
WHERE ar.ArtistName = "Joe Lizzo";

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.Title, COUNT(s.SongId) AS "Number"
FROM Album a
JOIN Song s
ON a.AlbumId = s.AlbumId
GROUP BY a.Title;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.ArtistName, COUNT(s.Title) AS "Songs"
FROM Artist a
JOIN Song s
ON a.ArtistId = s.ArtistId
GROUP BY a.ArtistName;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label, COUNT(s.Title) AS "Number of Songs"
FROM Genre g
JOIN Song s
ON g.GenreId = s.GenreId
GROUP BY g.Label;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT Title, MAX(AlbumLength) AS "MAX Album"
FROM Album;

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT Title, MAX(SongLength) AS "MAX Song"
FROM Song;

--Modify the previous query to also display the title of the album.

SELECT s.Title AS "Song Title", a.Title AS "Album Title", MAX(SongLength) AS "MAX Song"
FROM Song s
LEFT JOIN Album a
ON s.ArtistId = a.ArtistId;

--THESE ARE QUICK REFs TO THE WHOLE COLLECTIONS
SELECT * from Artist;
SELECT * from Album;
SELECT * from Genre;
SELECT * from Song;
