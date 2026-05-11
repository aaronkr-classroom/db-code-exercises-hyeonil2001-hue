--user, game, item, play, useritem
create table users(
	user_id int primary key,
	name varchar(30) not null,
	nickname varchar(30) not null,
	level int,
	join_date date
);

create table games(
	game_id int primary key,
	name varchar(30) not null,
	genre varchar(20),
	release_date date
);

create table items(
	item_id int primary key,
	name varchar(30) not null,
	price int,
	grade char 
);

create table plays (
	user_id int references users(user_id),
	game_id int references games(game_id),
	start_date date,
	play_time int, --time.now()
	primary key (user_id, game_id)
);

create table user_items(
	user_id int references users(user_id),
	item_id int references items(item_id),
	acquired_date date,
	quantity int,
	primary key (user_id, item_id)
);

insert into users values
(1, 'name1', 'nickname1', 1, now()),
(2, 'name2', 'nickname2', 1, now());

insert into games values
(1, 'game1', 'genre1', now()),
(2, 'game2', 'genre1', now()),
(3, 'game3', 'genre1', now());

insert into items values
(1, 'name1', 1000, 'a'),
(2, 'name2', 2000, 'a'),
(3, 'name3', 30000, 'a');

insert into palys values
(1, 1, now(), 1000),
(1, 2, now(), 33000),
(2, 3, now(), 200);

insert into user_items values
(1, 1, now(), 100),
(1, 2, now(), 33),
(2, 3, now(), 20);

table users;
table games;
table items;
table plays;
table user_items;

--기본 조회 연습
--1 전체 유저조회
select * from users;

--2 레벨 높은 순서로 조회
select * from users order by level desc;

--3 레벨이 10이상인 유저 조회
select * from users where level >= 10;

--4 S 등급아이템 조회
select * from items where grade='S';

--테이블 수정할떄 alter table
--1 게임 회사에서 유저의 이메일도 저장하기로 함
alter table users add column email varchar(50);

--2 유저에게 현재 접속상태를 저장해야 함
alter table users add column status varchar(10) default 'offline';

--3 아이템 테이블에 판매 가능 여부를 추가해야 함
alter table items add column is_sellable boolean;

--4 게임 테이블에 게임 등급 정보를 추가해야함
alter table games add column age_rating varchar(10);

-- 테이블에 있는 값을 변경할때 update
--1 김민준 유저의 이메일을 추가
update users set email='a@a.com' where name='김민준';

--2 이서연 유저의 레벨을 25로
update users set level=25 where name='이서연';

--3 모든 유저의 기본접속 상태를 online으로 설정
update users set status='online';

--4 dragonking 유저가 현재접속중임
update users set status='online' where nickname='dragonking';

--5 회복포션의 가격을 700으로 변경
update items set price=700 where item_name='회복포션';

--6 Gran Turismo 의 이용가능 연령을 12세이상으로 설정한다
update games set age_rating=12 where name='Gran Turismo';

