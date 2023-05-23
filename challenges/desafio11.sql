SELECT 
    a.album_name AS album, COUNT(a.album_name) AS favoritadas
FROM
    fav_songs AS f
        INNER JOIN
    songs AS s ON f.id_song = s.id_song
        INNER JOIN
    albuns AS a ON s.id_album = a.id_album
GROUP BY a.album_name
ORDER BY favoritadas DESC , album
LIMIT 3;