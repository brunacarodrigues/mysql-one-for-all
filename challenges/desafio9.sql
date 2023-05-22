SELECT COUNT(id_song) AS musicas_no_historico
    FROM play_history AS ph
    INNER JOIN users AS usr
    ON ph.id_user = usr.id_user
    WHERE user_name = 'Barbara Liskov';