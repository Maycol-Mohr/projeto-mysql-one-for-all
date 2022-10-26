SELECT artista.artista_nome AS 'artista', album.album_nome AS 'album', COUNT(seguidor.artista_id) AS 'seguidores'
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album 
ON artista.artista_id = album.artista_id
INNER JOIN SpotifyClone.usuario_seguindo_artista AS seguidor 
ON album.artista_id = seguidor.artista_id
GROUP BY artista.artista_nome, album.album_nome
ORDER BY seguidores DESC, artista.artista_nome ASC, album.album_nome ASC;
