CREATE PROCEDURE topListenedArtistsByGenre
AS

DECLARE @mostListenedGenre INT

SELECT TOP(1) @mostListenedGenre=s.id_genre
FROM Favorite_Songs f
JOIN Songs s ON f.id_song = s.id
GROUP BY s.id_genre
ORDER BY COUNT(f.id_song) DESC;

SELECT a.name, COUNT(s.id_artist)
FROM Favorite_Songs f
JOIN Songs s ON s.id = f.id_song
JOIN Artists a ON a.id = s.id_artist
WHERE s.id_genre = @mostListenedGenre
GROUP BY a.name
ORDER BY COUNT(s.id_artist) DESC;

RETURN;
