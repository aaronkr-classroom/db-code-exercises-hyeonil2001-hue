/*
[Entities / 개체]
Professor

[Properties / 속성 ]
id (bigserial)
name (varchar(30))
dept (varchar(50))
salary (numeric)	
salary_level (numeric)
hire_date (date)

*/

create table prof(
	id bigserial,
	name varchar(30),
	dept varchar(50),
	salary numeric,
	salary_level numeric,
	hire_date date
)

table prof;

-- select * from prof;

insert into prof(name, dept, salary, salary_level, hire_date) values('name1', 'dept1', '1000', '99', '2001-01-01')

insert into prof(name, dept, salary, salary_level, hire_date)
values
	('name2', 'dept2', '1000', '99', now()),
	('name3', 'dept2', '1000', '99', now()),
	('name4', 'dept2', '1000', '99', now()),
	('name5', 'dept1', '1000', '99', now())

select name, salary from prof order by salary desc;
select * from prof where salary >= 1000;
select name from prof where name like 'name%'

select * from prof where dept like 'dept%' order by name asc;

select name, salary from prof where salary between 1000 and 2000
