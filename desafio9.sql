SELECT COUNT(repro.cancao_id) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.historico_de_reproducao AS repro
INNER JOIN SpotifyClone.usuario AS usuario 
ON repro.usuario_id = usuario.usuario_id
WHERE usuario.usuario_nome = 'Barbara Liskov'
GROUP BY 'quantidade_musicas_no_historico';
