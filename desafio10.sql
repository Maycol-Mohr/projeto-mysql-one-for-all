SELECT cancao.cancao_nome AS 'nome', COUNT(repro.cancao_id) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducao AS repro
INNER JOIN SpotifyClone.cancao AS cancao 
ON repro.cancao_id = cancao.cancao_id
INNER JOIN SpotifyClone.usuario AS usuario 
ON repro.usuario_id = usuario.usuario_id
INNER JOIN SpotifyClone.plano AS plano 
ON usuario.plano_id = plano.plano_id
WHERE plano.plano_nome = 'gratuito' OR plano.plano_nome = 'pessoal' 
GROUP BY cancao.cancao_nome
ORDER BY cancao.cancao_nome ASC;
