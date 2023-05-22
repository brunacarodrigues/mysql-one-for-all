SELECT 
    artist_name AS artista, album_name AS album
FROM
    artists AS ar
        JOIN
    albuns AS al ON al.id_artist = ar.id_artist
WHERE
    ar.artist_name = 'Elis Regina';