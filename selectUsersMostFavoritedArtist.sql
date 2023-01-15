CREATE PROCEDURE usersMostFavoritedArtist
AS

declare @FavoriteArtists table (
	username varchar(30),
	artist_name varchar(50),
	num_likes int
)

insert INTO @FavoriteArtists (username, artist_name, num_likes)
SELECT f.username, a.name, COUNT(s.id) num_likes
FROM Favorite_Songs f
JOIN Songs s on s.id = f.id_song
JOIN Artists a on a.id = s.id_artist
GROUP BY f.username, a.name;

SELECT t.username, t.artist_name, t.num_likes
FROM (SELECT username,  MAX(num_likes) max_likes FROM @FavoriteArtists GROUP BY username) b
JOIN @FavoriteArtists t on t.username = b.username AND t.num_likes = b.max_likes
ORDER BY t.num_likes desc;

RETURN;
