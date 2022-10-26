SELECT COUNT(DISTINCT cancao.cancao_id) AS 'cancoes', COUNT(DISTINCT album.artista_id) AS 'artistas', COUNT(DISTINCT album.album_id) AS 'albuns'
FROM SpotifyClone.cancao AS cancao
INNER JOIN SpotifyClone.album AS album 
ON cancao.album_id = album.album_id
INNER JOIN SpotifyClone.artista AS artista 
ON album.artista_id = artista.artista_id;
