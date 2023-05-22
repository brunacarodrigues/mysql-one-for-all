SELECT
    IF(MIN(pr.plan_value) = 0, '0.00', MIN(pr.plan_value)) AS faturamento_minimo,
    CONVERT(ROUND(MAX(pr.plan_value), 2), CHAR) AS faturamento_maximo,
    CONVERT(ROUND(AVG(pr.plan_value), 2), CHAR) AS faturamento_medio,
    CONVERT(ROUND(SUM(pr.plan_value), 2), CHAR) AS faturamento_total
FROM
    users AS usr
    INNER JOIN plans AS pr
    ON usr.id_plan = pr.id_plan;