/*  https://www.hackerrank.com/challenges/the-pads/ */	
-- create database The_PADS;

use The_PADS;

create table OCCUPATIONS(
	Name varchar(10),
    occupation varchar(10));
    
insert into OCCUPATIONS value
('Ashley', 'Professor'),
('Samantha', 'Actor'),
('Julia', 'Doctor'),
('Britney', 'Professor'),
('Maria', 'Professor'),
('Meera', 'Professor'),
('Priya', 'Doctor'),
('Priyanka', 'Professor'),
('Jennifer', 'Actor'),
('Ketty', 'Actor'),
('Belvet', 'Professor'),
('Naomi', 'Professor'),
('Jane', 'Singer'),
('Jenny', 'Singer'),
('Kristeen', 'Singer'),
('Christeen', 'Singer'),
('Eve', 'Actor'),
('Aamina', 'Doctor');

/* ========================================================================
Sample Output

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.
========================================================================*/
-- Giai quyet

select concat(name, '(', left(occupation,1),')' ) as new_col 
from OCCUPATIONS 
order by name, occupation;

select concat('There are a total of ', count(occupation),' ', lower(occupation), 's.') as new_col2
from OCCUPATIONS 
group by occupation
order by count(occupation), occupation;
