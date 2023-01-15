CREATE PROCEDURE listenersAboveAgvTime
AS
	SELECT f.username, SUM(DATEDIFF(MINUTE, '00:00:00', s.length)) minutes_spent
	FROM Favorite_Songs f
	JOIN Songs s ON f.id_song = s.id
	GROUP BY f.username
	HAVING SUM(DATEDIFF(MINUTE, '00:00:00', s.length)) > (SELECT sum(DATEDIFF(MINUTE, '00:00:00', s1.length)) / count(distinct f1.username)
															FROM Favorite_Songs f1
															JOIN Songs s1 ON s1.id = f1.id_song)
	ORDER BY 2 DESC;

RETURN;
