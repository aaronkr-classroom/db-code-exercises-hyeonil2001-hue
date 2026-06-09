-- 사원 릴레이션
create table 사원 (
	사원번호 int primary key,
	이름 varchar(20) not null,
	입사일 date not null,
	호봉 int not null,
	휴대폰 varchar(13)
);

insert into 사원 values
(1101, '김정아', '2022-03-01', 20, '010-3452-0022'),
(1102, '이가원', '2022-03-01', 18, '010-3452-0022'),
(1103, '박영종', '2022-03-01', 15, '010-3452-0022'),
(1201, '최강희', '2022-03-01', 21, '010-3452-0022'),
(1202, '조현수', '2022-03-01', 14, '010-3452-0022'),
(1203, '박제성', '2022-03-01', default, '010-3452-0022'),
(1312, '김민수', '2022-03-01', default, '010-3452-0022');

select * from 사원;

-- 부서 릴레이션
create table 부서 (
	부서번호 int primary key,
	부서명 varchar(10) not null default '인사부',
	부서장 int unique,
	사무실 varchar(4) not null unique,
	전화번호 varchar(13) unique
)

insert into 부서 values
(100, '기획실', 1101, 'A402', '02-233-1234'),
(200, '비서실', 1102, 'A502', '02-233-1235'),
(300, '총부부', 1201, 'B311', '02-233-1236'),
(400, '인사부', 1203, 'B201', '02-233-1237'),
(500, '자재부', default, 'A102', '02-233-1238');

select * from 부서
table 부서

-- 근무하다 릴레이션
create table 근무하다 (
	사번 int,
	부서번호 int,
	직책 varchar(2) not null,
	primary key(사번, 부서번호),
	foreign key(사번) references 사원(사원번호),
	foreign key(부서번호) references 부서(부서번호)
);

insert into 근무하다 values
(1101, 100, '부장'),
(1102, 200, '과장'),
(1103, 300, '대리'),
(1104, 400, '부장'),
(1105, 500, '사원');

table 근무하다
select * from 근무하다 where 직책='사원';

