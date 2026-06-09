/*
-- 문화센터 예시

-- 릴레이션 스키마
	강사(강사번호, 이름, 전문분야, 연락처)
	강좌(강좌번호, 강좌명, 수강료, 최대인원, 강사번호)
	회원(회원번호, 이름, 전화번호, 가입일)
	수강신청(회원번호, 강좌번호, 신청일)

-- 간단한 erd
	강사 -- 1:n -- 강좌 -- n:m -- 회원 (기존) 
	강사 -- 1:n -- 강좌 -- 1:n -- 수강신청 -- n:1 -- 회원 (변경)
*/

create table instructors (
	id int primary key,
	name varchar(30) not null,
	speciality varchar(50),
	phone varchar(13)
);

create table classes (
	id int primary key,
	name varchar(50) not null,
	fee int check(fee >= 0),
	max_student int check(max_student between 5 and 50),
	instructor_id int,
	foreign key(instructor_id) references instructors(id)
);

create table members(
	id int primary key,
	name varchar(30) not null,
	phone varchar(13),
	join_date date
);

create table registrations (
	member_id int,
	class_id int,
	register_date date,
	primary key(member_id, class_id),
	foreign key(member_id) references members(id)
		on delete cascade,
	foreign key(class_id) references classes(id)
		on delete cascade
);

insert into instructors values
(1, '김영희', '요가', '010-1234-1234'),
(2, '김영희', '요가', '010-1234-1235');


insert into classes values
(101, '아침 요가', 50000, 20, 1),
(102, '아침 요가', 50000, 20, 1);

insert into members values
(1001, '홍길동', '010-9999-9999', '2026-01-01'),
(1002, '김철수', '010-1234-1234', '2026-12-12');

insert into registration values
(1001, 101, '2026-01-01'),
(1001, 103, '2026-03-05');

select m.name, c.name
from registrations r 
join members m on r.id = m.id
join classes c on r.id = c.id;

insert into members(name, phone, join_date)
select
	'Member_' || g,
	'010-' || LPAD((random()*9999)::int::text,4,'0')
		|| '-'
		|| LPAD((random()*9999)::int::text,4,'0'),
	CURRENT_DATE - ((random()*1000::int))
from generate_series(1,100000) g;

insert into members(name, phone, join_date)
values('홍길동', '010-1234-5678', current_date);

table members;


explain analyze
select * from members
where name = '홍길동';

create index idx_members_name
on members(name);

create view registrations_view as
select
	m.name as 회원명,
	c.class_name as 강좌명,
	r.register_date as 신청일
from registrations r
join members m on r.id = m.id
join classes c on r.id = c.id;