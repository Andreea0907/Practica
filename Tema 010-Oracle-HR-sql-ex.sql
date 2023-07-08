/* 1. Afisati numele si salariile angajatilor.*/
select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES;

/*2. Afisati numele de familie si salariul angajatilor care castiga mai mult de $12,000. */

select LAST_NAME, SALARY from EMPLOYEES 
where SALARY >=12000;

/*3. Afisati numele de familie si salariul pentru toti angajatii al caror salariu nu se afla
in intervalul $5,000 - $12,000. */

select LAST_NAME,SALARY from EMPLOYEES
where SALARY not between 5000 and 12000;

/*4. Afisati numele de familie, loc de munca (job ID) si data de inceput (data angajarii)
pentru angajatii cu numele de familie Smith si Taylor. Ordona?i rezultatele în ordine
cresc?toare dup? data angajarii. */

select LAST_NAME, JOB_ID, HIRE_DATE from EMPLOYEES
where LAST_NAME IN ('Smith', 'Taylor') order by HIRE_DATE ASC;

/*5. Afisati numele de familie si numele departamentului pentru angajatii din
departamentele 20 sau 50 in ordine alfabetica crescatoare dupa nume. */

select LAST_NAME, DEPARTMENT_ID from EMPLOYEES
where DEPARTMENT_ID in ('20', '50') order by LAST_NAME ASC;

/* 6. Afisati numele de familie si denumirea functiei pentru toti angajatii care nu au un
manager.*/

select LAST_NAME, JOB_ID from EMPLOYEES
where MANAGER_ID IS NULL;


/* 7. Afisati numele de familie, salariul si comisionul pentru toti angajatii care castiga
comisioane. Sorta?i datele în ordine descresc?toare a salariilor ?i comisioanelor. */

select LAST_NAME, SALARY, COMMISSION_PCT from EMPLOYEES
where COMMISSION_PCT is not null 
order by SALARY DESC, COMMISSION_PCT DESC;


/*8. G?si?i cel mai mare, cel mai mic salariu ?i salariul mediu al tuturor angaja?ilor.
Eticheta?i coloanele Maxim, Minim, Suma ?i respectiv, Medie. */

select
round(max(salary),0) Maxim,
round(min(salary),0) Minim,
round(sum(salary),0) Suma,
round(avg(salary),0) Medie
from EMPLOYEES;


/*9. Modificati interogarea anterioara pentru a afisa Minim, Maxim, Suma si salariul
mediu pentru fiecare loc de munca (job_ID). */

select job_id,
round(max(salary),0) Maxim,
round(min(salary),0) Minim,
round(sum(salary),0) Suma,
round(avg(salary),0) Medie
from EMPLOYEES
group by job_id;

/* 10. Afisati numarul persoanelor cu acelasi loc de munca.*/

select job_id ,count(*)
from EMPLOYEES
group by job_id;

/*11. Determinati numarul managerilor fara a lista angajatii. Etichetati coloana
Numarul Managerilor. Sugestie: Folositi coloana Manager_ID din tabela cu angajati
pentru a determina numarul managerilor. */

select count(distinct MANAGER_ID) as Numarul_Managerilor 
from EMPLOYEES;

/*12. Gasiti diferenta dintre cel mai mare ?i cel mai mic salariu. Etichetati coloana
Diferenta. */

select MAX(salary) - MIN(salary) as Diferenta 
from EMPLOYEES;

/*13. Gasiti adresele tuturor departamentelor. Utilizati tabelele LOCATIONS si
COUNTRIES. */

select 
 d.DEPARTMENT_NAME,
 l.location_id, 
 l.street_address, 
 l.city,
 c.country_name
from DEPARTMENTS d
 inner join LOCATIONS l 
 on d.LOCATION_ID = l.LOCATION_ID
 inner join COUNTRIES C 
 on l.country_id = c.country_id;


/*14. Afisati la iesire, ID_Locatie, adresa strazii, orasul, statul sau provincia si tara.*/

select 
l.location_id,
l.street_address,
l.city,
l.state_province,
c.country_name
from LOCATIONS l
    inner join COUNTRIES c
on l.country_id = c.country_id;

/*15. Afisati numele de familie, locul de munca, numarul departamentului si numele
departamentului pentru toti angajatii care lucreaza in Toronto. */


SELECT e.last_name, e.job_id, e.department_id,
d.department_name,l.city
FROM employees e 
JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id) 
where l.city in 'Toronto';


/* 18. Gasiti numarul angajatilor al caror nume de familie se termina in litera “n”. */

select count(last_name) as Nr_Angajati from employees
where last_name like '%n';
    
    
/*19. Creati o interogare care afiseaza numele, locatia si numarul de angajati pentru
fiecare departament. Asigurati-va ca rezultatul include, de asemenea, si
departamentele fara angajati. */

select 
e.first_name,
e.last_name,
l.location_id,
(select count( distinct department_id) from employees)
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on l.location_id = d.location_id;

/*20. Afisati toti angajatii care au fost angajati in prima jumatate a lunii (inainte de ziua
de 16 a lunii). */

select
  first_name,
  last_name,
  TO_CHAR( hire_date, 'FMMonth DD, YYYY' ) as Day
from employees;

/*??? */




/*21. Creati o interogare pentru a afisa numarul departamentelor cu salariul mediu cel
mai mare. */

select department_id, avg(salary), count(*) 
from employees 
group by department_id;


/*24. Afisati anii si numarul total de angajati care au fost angajati in acel an. */
     
select count(*),to_char(hire_date, 'YYYY') as Ani
from employees
group by to_char(hire_date, 'YYYY')
order by to_char(hire_date, 'YYYY') ASC;

/*25. Afisati tarile si numarul locatiilor in acea tara. */

select country_id, count(*) as Nr_Locatii
from locations
group by country_id;

/*26. Scrieti o interogare in SQL pentru a afisa intreg numele (numele si prenumele) si
salariul pentru acei angajti care castiga sub 6000. */

select first_name || ' ' || last_name as Nume_si_Prenume, salary from employees
where salary < 6000;


/* 27. Scrie?i o interogare în SQL pentru a afi?a numele complet (numele ?i prenumele),
data angajarii, procentul comisionului, e-mailul ?i telefonul, separate de '-' ?i salariul
pentru acei angaja?i care câ?tig? salariul de peste 11000 sau a ?aptea cifr? în num?rul
de telefon este egal cu 3 ?i sorta?i rezultatul într-o ordine descresc?toare dup? nume.*/

select first_name || ' ' || last_name as Nume_si_Prenume,hire_date ||   commission_pct || '-' || email || '-' || phone_number as Dates ,
salary from employees
where salary > 11000 and phone_number like '______3%' 
order by Nume_si_Prenume DESC;


/*29. Scrie?i o interogare pentru a afi?a toate informa?iile angaja?ilor ale c?ror salarii
sunt în intervalul cel mai mic salariu ?i 2500. */

select * from employees
where salary between 0 and 2500;

 /* 30. Scrie?i o interogare pentru a afi?a numele angajatului (numele ?i prenumele) ?i
data de angajare pentru to?i angaja?ii din acela?i departament ca si Clara (prenume).
Excludeti-o pe Clara.*/

select first_name || ' ' || last_name as Nume_si_Prenume, hire_date, department_id from employees
where department_id = any
(select department_id from employees
 where first_name = 'Clara') 
 and first_name <> 'Clara';


/*31. Scrie?i o interogare pentru a afi?a num?rul angajatului, numele (numele ?i
prenumele) ?i titlul postului pentru to?i angaja?ii al c?ror salariu este mai mic decât
orice salariu al acelor angaja?i al c?ror titlu de post este MK_MAN. */

select phone_number, first_name || ' ' || last_name as Nume_si_Prenume, job_id from employees
where salary < any
 ( select salary  
 from employees  
 where job_id = 'MK_MAN' );
 
 




