create database ut;

create table animals(
	id bigserial,
	name varchar(20),
	age integer,
	kind varchar(20),
	dob date,
	location varchar(50)
);

table animals;
-- hello --

insert into animals(name, age, kind, dob, location)
values('name1', 1, 'tiger', now(), 'here')

insert into animals(name, age, kind, dob, location)
values('name2', 1, 'elephant', now(), 'here')

insert into animals(name, age, kind, dob, location)
values('name3', 1, 'lion', now(), 'here')

insert into animals(name, age, kind, dob, location)
values('name4', 1, 'cat', now(), 'here')

insert into animals(name, age, kind, dob, location)
values('name5', 1, 'dog', now(), 'here')

select * from animals;

