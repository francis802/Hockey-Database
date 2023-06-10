.mode columns
.headers on
.nullvalue NULL

SELECT a.nome as EQUIPA, b.jognome as JOGADOR, ROUND	((1.0*b.best)/(1.0*a.golosequipa)*100,2) as PERCENTAGEM
FROM (SELECT e.NOME, count(*) as golosequipa
		FROM EQUIPA e, GOLO g 
		WHERE e.IDEQUIPA = g.EQUIPAAFAVOR
		group by e.NOME ) a, (SELECT e.NOME eqnome, t.nome as jognome, max(t.golos) as best
								FROM EQUIPA e, (SELECT j.NOME, g.EQUIPAAFAVOR, count(*) as golos
												FROM JOGADOR j , GOLO g 
												WHERE j.IDJOGADOR = g.JOGADOR
												GROUP BY j.NOME ) t 
								WHERE e.IDEQUIPA = t.equipaafavor
								group by e.NOME 
) b
WHERE a.nome = b.eqnome