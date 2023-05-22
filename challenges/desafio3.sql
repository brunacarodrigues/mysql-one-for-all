SELECT 
	usr.user_name AS pessoa_usuaria,
    COUNT(ph.id_user) AS musicas_ouvidas,
    ROUND(SUM(sg.song_duration)/60, 2) AS total_minutos
FROM users AS usr
INNER JOIN play_history AS ph
ON usr.id_user = ph.id_user
INNER JOIN songs AS sg
ON ph.id_song = sg.id_song
GROUP BY user_name
ORDER BY user_name;