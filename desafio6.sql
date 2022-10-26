SELECT MIN(plano.plano_valor) AS 'faturamento_minimo', MAX(plano.plano_valor) AS 'faturamento_maximo', 
ROUND(AVG(plano.plano_valor), 2) AS 'faturamento_medio', SUM(plano.plano_valor) AS 'faturamento_total'
FROM SpotifyClone.usuario AS usuario
INNER JOIN SpotifyClone.plano AS plano 
ON usuario.plano_id = plano.plano_id;
