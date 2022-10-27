SELECT cancao.cancao_nome AS nome_musica,
	CASE
		WHEN cancao.cancao_nome LIKE '%Bard%' THEN REPLACE(cancao.cancao_nome, 'Bard', 'QA')
		WHEN cancao.cancao_nome LIKE '%Amar%' THEN REPLACE(cancao.cancao_nome, 'Amar', 'Code Review')
		WHEN cancao.cancao_nome LIKE '%Pais%' THEN REPLACE(cancao.cancao_nome, 'Pais', 'Pull Requests')
		WHEN cancao.cancao_nome LIKE '%SOUL%' THEN REPLACE(cancao.cancao_nome, 'SOUL', 'CODE')
		WHEN cancao.cancao_nome LIKE '%SUPERSTAR%' THEN REPLACE(cancao.cancao_nome, 'SUPERSTAR', 'SUPERDEV')
	END AS 'novo_nome'
FROM SpotifyClone.cancao AS cancao
INNER JOIN SpotifyClone.cancao AS nova_cancao 
ON cancao.cancao_id = nova_cancao.cancao_id
GROUP BY cancao.cancao_nome
HAVING novo_nome IS NOT NULL
ORDER BY cancao.cancao_nome DESC;
