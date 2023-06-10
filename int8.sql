.mode columns
.headers on
.nullvalue NULL

SELECT a.jogador, j2.NOME, sum(a.golosmarcados)
FROM JOGADOR j2, (SELECT g.JOGADOR, count(*) as GOLOSMARCADOS 
	FROM FFINAL f, JOGO j, GOLO g, VISITADA v
	WHERE j.IDJOGO  = g.JOGO and v.JOGO = j.IDJOGO and v.EQUIPA = f.CAMPEAO 
	GROUP BY 1
	UNION
	SELECT g.JOGADOR, count(*) as GOLOSMARCADOS 
	FROM FFINAL f, JOGO j, GOLO g, VISITANTE v
	WHERE j.IDJOGO  = g.JOGO and v.JOGO = j.IDJOGO and v.EQUIPA = f.CAMPEAO 
	GROUP BY 1) a
WHERE a.jogador = j2.IDJOGADOR 
GROUP BY 1
ORDER BY 3 desc
LIMIT 1