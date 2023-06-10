.mode columns
.headers on
.nullvalue NULL

select d1.nome as NOME, (d1.diff + d2.diff) as DIFERENCA
from (select e.nome, sum(j.GOLOSVISITANTE - j.GOLOSVISITADA) as diff
from EQUIPA e, JOGO j, VISITANTE v
where j.idjogo = v.jogo and e.idequipa = v.equipa
group by 1) d1, (select e.nome, sum(j.GOLOSVISITADA - j.GOLOSVISITANTE) as diff
from EQUIPA e, JOGO j, VISITADA v
where j.idjogo = v.jogo and e.idequipa = v.equipa
group by 1) d2
where d1.nome = d2.nome
order by DIFERENCA asc
limit 1