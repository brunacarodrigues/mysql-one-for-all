SELECT
	usr.user_name AS pessoa_usuaria,
	IF(ph.date_play >= '2021-01-01', 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM users AS usr
INNER JOIN (SELECT id_user, MAX(date_play) date_play FROM play_history GROUP BY id_user) AS ph
ON usr.id_user = ph.id_user
    GROUP BY pessoa_usuaria, status_pessoa_usuaria
    ORDER BY usr.user_name;
