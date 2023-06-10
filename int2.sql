.mode columns
.headers on
.nullvalue NULL

SELECT a.nome as NOME, a.vada+b.vante as TOTAL
FROM (SELECT e.NOME, count(*) as vada
		FROM JOGOPLAYOFF jp, JOGO j, EQUIPA e, VISITADA v1
		WHERE jp.JOGO = j.IDJOGO and v1.JOGO =j.IDJOGO and e.IDEQUIPA = v1.EQUIPA 
		GROUP BY e.NOME ) a, (SELECT e.NOME, count(*) as vante
								FROM JOGOPLAYOFF jp, JOGO j, EQUIPA e, VISITANTE v2
								WHERE jp.JOGO = j.IDJOGO and v2.JOGO =j.IDJOGO and e.IDEQUIPA = v2.EQUIPA 
								GROUP BY e.NOME ) b
where b.nome = a.nome
ORDER BY total DESC ,a.nome ASC 
LIMIT 1