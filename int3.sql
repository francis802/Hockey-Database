.mode columns
.headers on
.nullvalue NULL

SELECT e.NOME, t.nome, max(t.golos) as GOLOS_MARCADOS
FROM EQUIPA e, (SELECT j.NOME, g.EQUIPAAFAVOR, count(*) as golos
				FROM JOGADOR j , GOLO g 
				WHERE j.IDJOGADOR = g.JOGADOR
				GROUP BY j.NOME ) t 
WHERE e.IDEQUIPA = t.equipaafavor
group by e.NOME 