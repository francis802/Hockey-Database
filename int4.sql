.mode columns
.headers on
.nullvalue NULL

DROP VIEW IF EXISTS GM;
CREATE VIEW GM AS
SELECT e.NOME, e.IDEQUIPA, count(*) AS GolosMarcados
FROM EQUIPA e, GOLO g
WHERE e.IDEQUIPA = g.EQUIPAAFAVOR 
group by e.NOME;

DROP VIEW IF EXISTS GS;
CREATE VIEW GS AS
SELECT a.nome, a.idequipa, (a.vadasofridos + b.vantesofridos) as GolosSofridos
FROM (SELECT e.NOME, e.IDEQUIPA, sum(j.GOLOSVISITANTE) as VadaSofridos
		FROM EQUIPA e, JOGO j, VISITADA vada 
		WHERE  vada.JOGO = j.IDJOGO and vada.EQUIPA = e.IDEQUIPA
		GROUP BY e.NOME) a, (SELECT e.NOME, e.IDEQUIPA, sum(j.GOLOSVISITADA) as VanteSofridos
								FROM EQUIPA e, JOGO j, VISITANTE vante 
								WHERE  vante.JOGO = j.IDJOGO and vante.EQUIPA = e.IDEQUIPA
								GROUP BY e.NOME) b
WHERE a.nome = b.nome;

DROP VIEW IF EXISTS INFOGOLOS;
CREATE VIEW INFOGOLOS AS
SELECT gm.nome, gm.idequipa, gm.golosmarcados, gs.golossofridos, abs(gm.golosmarcados - gs.golossofridos) AS Diferenca
FROM GM gm, GS gs
WHERE gm.nome = gs.nome;

SELECT p.PONTOS, i.nome, p.VITORIAS, p.EMPATES, p.DERROTAS, i.golosmarcados AS GOLOS_MARCADOS, i.golossofridos AS GOLOS_SOFRIDOS, i.diferenca AS DIFERENCA
FROM POSICAO p, INFOGOLOS i
WHERE p.EQUIPA = i.idequipa and p.JORNADA = 5
ORDER BY 1 DESC, 8 DESC