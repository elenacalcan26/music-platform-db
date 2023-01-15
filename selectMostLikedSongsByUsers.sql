CREATE PROCEDURE likedSongsByUsers
AS
	SELECT s.title AS 'Song Title', count(f.id_song) AS 'Likes'
	FROM Favorite_Songs f JOIN Songs s on s.id = f.id_song
	GROUP BY s.title
	HAVING count(f.id_song) > 2
	ORDER BY COUNT(f.id_song) DESC;

RETURN;
