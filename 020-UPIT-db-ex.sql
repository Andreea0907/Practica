/*1. Scrieti o interogare pentru a afisa numele, prenumele, anul de studiu si data
nasterii pentru toti studentii. Ordonati rezultatele dupa nume si prenume. */

select NUME, PRENUME, AN, DATA_NASTERE FROM STUDENTI ORDER BY NUME, PRENUME;

/*2. Afisati nume, prenume, bursa si jumatate din valoarea bursei studentilor la care a
fost adaugat in prealabil 100 (aveti in vedere si precendenta operatorilor). */

select nume,prenume,bursa from studenti
where bursa = (bursa/2)+100 and bursa is not null;
/*!!!*/

/*3. Scrieti o interogare care sa afiseze in mod unic valoarea burselor */

select distinct BURSA from STUDENTI;


/*4. Afisati numele concatenat cu prenumele, urmat de virgula si anul de studiu.
Ordonati crescator dupa anul de studiu. Denumiti coloana: “Studenti / ani de studiu”.*/

select NUME || ' ' || PRENUME || ', ' ||AN "Studenti/ani de studiu" from STUDENTI order by AN ASC;


/* 5. Afisati studentii nascuti intre 1 martie 1996 si 10 noiembrie 1997. Ordonati
descrescator dupa anul de studiu.*/

select * from STUDENTI
where DATA_NASTERE between '01-MAR-1996' and '10-NOV-1997' order by AN DESC;

/* 6. Afisati toti studentii nascuti in 1996.*/

SELECT * 
FROM STUDENTI
WHERE TO_CHAR(DATA_NASTERE, 'YYYY') = '1996';

/*7. Afisati studentii ce nu iau bursa. */

select * from STUDENTI
where BURSA IS NULL;

/*8. Afisati studentii care iau bursa si sunt in anii 2 sau 3 de studiu. Ordonati alfabetic
crescator dupa nume si descrescator dupa prenume. */

select * from STUDENTI
where BURSA IS NOT NULL AND (AN = '2' OR AN = '3')
order by NUME ASC, PRENUME DESC;

/* 9. Afisati studentii care iau bursa precum si valoarea bursei daca aceasta ar fi marita
cu 25%. Valoarea calculata va fi rotunjita (fara zecimale).*/

select NUME,PRENUME,BURSA,
BURSA+round(BURSA*(25/100),0) as BURSA_MARITA from STUDENTI 
where BURSA IS NOT NULL;

/* 10. Afisati studentii al caror nume incepe cu B si nu sunt in anul 1 de studiu*/

select * from STUDENTI
where NUME like 'B%' and AN not like '1%';

/*11. Afisati toate informatiile despre studentii care au doua aparitii ale literei ‘i’ in
prenume */

select * from STUDENTI 
where PRENUME like '%i%i%';

/*12. Afisati toate informatiile despre studentii al caror prenume este “Mihaela”,
“Mihai” sau “Anca” */

select * from STUDENTI 
where PRENUME in ('Mihaela', 'Mihai', 'Anca');

/* 13. Afisati numele si prenumele profesorilor al caror prenume se termina cu litera ‘n’*/

select distinct NUME, PRENUME from PROFESORI
where PRENUME like '%n';

/*14. Scrieti o interogare pentru a afisa data de astazi in forma an / luna / zi. Etichetati
coloana cu “Astazi”. */

SELECT
  TO_CHAR(CURRENT_DATE, 'yyyy-MM-dd') AS Astazi
FROM dual;

/* 15. Pentru fiecare student afisati numele, prenumele, data de nastere si numarul de
luni intre data curenta si data nasterii*/

select NUME,PRENUME,DATA_NASTERE,MONTHS_BETWEEN(CURRENT_DATE, DATA_NASTERE) as "Luni" from STUDENTI;

/*16. Afisati ziua din saptamana in care s-a nascut fiecare student */

select TO_CHAR(DATA_NASTERE, 'D') as Ziua from STUDENTI;

/*17. Folosind concatenarea obtineti o coloana de forma ‘Elevul <Prenume> este in
grupa <grupa>’ */

select 'Elevul' || ' ' || PRENUME || ' ' || 'este in grupa' || ' ' || GRUPA  as Coloana from STUDENTI;

/*25. Afisati studentii, notele lor, cursul si profesorii ce au pus notele. */

select 
s.nume,
s.prenume,
n.valoare,
p.id_prof,
n.id_curs
from studenti s
inner join note n
on n.nr_matricol = s.nr_matricol
inner join profesori p
on p.id_prof = n.id_curs
where valoare is not null;

/*!!!*/


/*26. Afisati studen?ii care au luat nota 10 la materia 'Fundamentele programarii'. */

select 
s.nume,
s.prenume,
c.titlu_curs,
n.valoare,
(select count( distinct nume) from studenti)
from studenti s
inner join note n
on n.nr_matricol = s.nr_matricol
inner join cursuri c
on c.ID_CURS = n.ID_CURS
where c.titlu_curs in 'Fundamentele programarii' and valoare = 10
;
/*!!!*/


