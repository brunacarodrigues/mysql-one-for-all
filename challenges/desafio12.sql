SELECT 
    a.artist_name AS artista,
    CASE
        WHEN COUNT(*) < 2 THEN '-'
        WHEN COUNT(*) BETWEEN 1 AND 2 THEN 'C'
        WHEN COUNT(*) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(*) > 4 THEN 'A'
    END AS ranking
FROM
    fav_songs AS f
        INNER JOIN
    songs AS s ON f.id_song = s.id_song
        RIGHT JOIN
    artists AS a ON s.id_artist = a.id_artist
GROUP BY artista
ORDER BY IF(ranking = '-', 'D', ranking) , artista;