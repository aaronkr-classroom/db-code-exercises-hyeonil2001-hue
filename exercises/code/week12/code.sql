
---
alter table users
add constraint chk_usr_level
check (users_level >= 1 and user_level <= 100);

update users 
set user_level = 101
where usesr_id = 1;

--- 2 접속상태는 online or offline만 가능하다
alter table use
