SELECT usuario.usuario_nome AS 'usuario', COUNT(historico.cancao_id) AS 'qt_de_musicas_ouvidas', 
ROUND(SUM(cancao.duracao_segundos)/60, 2) AS 'total_minutos'
FROM SpotifyClone.usuario AS usuario
INNER JOIN SpotifyClone.historico_de_reproducao AS historico 
ON usuario.usuario_id = historico.usuario_id
INNER JOIN SpotifyClone.cancao AS cancao 
ON historico.cancao_id = cancao.cancao_id
GROUP BY usuario.usuario_nome;
