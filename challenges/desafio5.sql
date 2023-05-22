SELECT sg.song_name AS cancao, COUNT(ph.id_user) AS reproducoes
FROM songs AS sg
INNER JOIN play_history AS ph
ON sg.id_song = ph.id_song
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;