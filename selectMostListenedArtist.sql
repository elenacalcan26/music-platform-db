CREATE PROCEDURE mostListenedArtist
AS

SELECT TOP(10) COUNT(s.id) num_songs_liked, a.name
FROM Favorite_Songs f
JOIN Songs s ON s.id = f.id_song
JOIN Artists a ON s.id_artist = a.id
GROUP BY a.name
ORDER BY COUNT(s.id) desc;

RETURN;
