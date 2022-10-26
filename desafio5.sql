SELECT cancao.cancao_nome AS 'cancao', COUNT(repro.cancao_id) AS 'reproducoes'
FROM SpotifyClone.cancao AS cancao
INNER JOIN SpotifyClone.historico_de_reproducao AS repro 
ON cancao.cancao_id = repro.cancao_id
GROUP BY cancao.cancao_nome
ORDER BY reproducoes DESC, cancao.cancao_nome ASC
LIMIT 2;
