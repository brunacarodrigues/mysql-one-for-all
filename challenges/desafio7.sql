SELECT 
    ar.artist_name AS artista,
    al.album_name AS album,
    COUNT(f.id_artist) AS pessoas_seguidoras
FROM
    artists AS ar
        INNER JOIN
    albuns AS al ON ar.id_artist = al.id_artist
        INNER JOIN
    follow AS f ON ar.id_artist = f.id_artist
GROUP BY artista , album
ORDER BY pessoas_seguidoras DESC , artista , album;