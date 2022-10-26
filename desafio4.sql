SELECT usuario.usuario_nome AS 'usuario',
IF(YEAR(MAX(repro.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.usuario AS usuario
INNER JOIN SpotifyClone.historico_de_reproducao AS repro 
ON usuario.usuario_id = repro.usuario_id
GROUP BY usuario.usuario_nome
ORDER BY usuario.usuario_nome;
