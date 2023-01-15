CREATE PROCEDURE popularAlbumsThroughoutYears
AS

DECLARE @AlbumsPopularity TABLE (
	album_name VARCHAR(50),
	release_year INT,
	num_likes INT
)

INSERT INTO @AlbumsPopularity(album_name, release_year, num_likes)
SELECT a1.title AS album_name, YEAR(a1.releASe_date) AS release_year, COUNT(f.id_song) num_likes
FROM Favorite_Songs f
JOIN Songs s ON s.id = f.id_song
JOIN Albums a1 ON a1.id = s.id_album
GROUP BY a1.title, YEAR(a1.releASe_date);

SELECT album_name, release_year, num_likes
FROM (SELECT t.release_year AS yr, MAX(t.num_likes) AS max_like FROM @AlbumsPopularity t GROUP BY t.release_year) b
JOIN @AlbumsPopularity on b.yr = releASe_year AND num_likes = b.max_like
ORDER BY release_year;

RETURN;
