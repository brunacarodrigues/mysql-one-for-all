SELECT
    CASE
	WHEN u.user_age < 31 THEN 'Até 30 anos'
	WHEN u.user_age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
	WHEN u.user_age > 60  THEN 'Maior de 60 anos'
    END AS faixa_etaria,
	COUNT(DISTINCT u.id_user) AS total_pessoas_usuarias,
    COUNT(f.id_user) AS total_favoritadas
FROM users AS u
LEFT JOIN fav_songs AS f
ON u.id_user = f.id_user
GROUP BY faixa_etaria
ORDER BY faixa_etaria;