INSERT OR REPLACE INTO POSICAO (EQUIPA,NUMERO,JORNADA,VITORIAS,EMPATES,DERROTAS) VALUES (2007,1,1,1,0,0);

.print ''
.print 'Foi introduzido a seguinte posição:'
.print ''

select *
from POSICAO p 
where p.NUMERO = 1 and p.JORNADA = 1;


INSERT OR REPLACE INTO POSICAO (EQUIPA,NUMERO,JORNADA,VITORIAS,EMPATES,DERROTAS) VALUES (2001,12,2,0,0,0);

.print ''
.print 'Foi introduzido a seguinte posição:'
.print ''

select *
from POSICAO p 
where p.NUMERO = 12 and p.JORNADA = 2;