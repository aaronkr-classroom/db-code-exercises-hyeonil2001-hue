--- 1
alter table users
add constraint chk_usr_level
check (users_level >= 1 and user_level <= 100);

update users 
set user_level = 101
where usesr_id = 1;

--- 2 접속상태는 online or offline만 가능하다
select status from users;

alter table users
add constraint chk_user_status
check (status in ('online', 'offline', 'connecting'))

table users;

update users
set status = 'sleeping'
where user_id=2;

--- 3 아이템가격은 0원 이상이어야한다
select price from items;

alter table items
add constraint chk_item_price
check (price >= 0);

update items
set price = -10
where item_id = 1001;


--- 4 아이템 등급을 정해진 값만 가능하다 (S, A, B, C, D, E, F)
alter table items
add constraint chk_item_grade
check (grade in ('S', 'A', 'B', 'C', 'D', 'E', 'F'));

--- 5 닉네임은 중복 되면 안된다
alter table users
add constraint uq_users_nickname
unique (nickname);

insert into users values
(6, '홍길동', 'DragonKing', 10, '2026-05-16', 'home@home.com', 'offline');

--
select constraint_name, table_name
from information_schema.table_constraints
where constraint_type = 'FOREING KEY'
and table_name = 'plays';

select constraint_name, table_name
from information_schema.table_constraints
where constraint_type = 'FOREING KEY'
and table_name = 'user_items';

alter table plays
drop constraint plays_user_id_fkey;

alter table plays
drop constraint plays_game_id_fkey;

alter table user_items
drop constraint user_items_user_id_fkey;

alter table user_items
drop constraint user_items_item_id_fkey;

-- 1 유저가 삭제되면 플레이기록도 삭제되게 하기
alter table plays
add constraint fk_plays_users
foreign key (user_id)
references users(user_id)
on delete cascade;

-- 2 게임은 플레이 기록이 있으면 삭제하지 못하게 하기
alter table plays
add constraint fk_plays_users
foreign key (game_id)
references games(game_id)
on delete restrict;

-- 3 유저가 삭제되면 보유 아이템 기록도 삭제되게 하기
alter table user_items
add constraint fk_user_items_users
foreign key (user_id)
references users(user_id)
on delete cascade;

-- 4 아이템 누군가 보유중이면 삭제하지 못하게 하기
alter table user_items
add constraint fk_user_items_items
foreign key (item_id)
references items(item_id)
on delete restrict;

-- cascade 테스트
select * from plays where user_id = 1;
select * from user_items where user_id = 1;

delete from uers where user_id = 1;

table games;

-- restrict 테스트
table games;

delete from games where game_id = 101;
delete from items where items_id = 1004;

