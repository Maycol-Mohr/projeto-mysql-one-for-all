SELECT artista.artista_nome AS 'artista', album.album_nome AS 'album'
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album 
ON artista.artista_id = album.artista_id
WHERE artista.artista_nome = 'Elis Regina'
GROUP BY artista.artista_nome, album.album_nome
ORDER BY album.album_nome ASC;
