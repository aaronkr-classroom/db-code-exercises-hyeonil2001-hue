create table users(
	user_id int primary key,
	email varchar(100),
	password varchar(100)
);

create table character(
	character_id int primary key,
	user_id int,
	name varchar(50),
	level int,
	stats varchar(255),
	class varchar(50),
	foreign key(user_id) references users(user_id)
);

create table item(
	item_id int primary key,
	name varchar(100),
	type varchar(50)
);

create table inventory(
	character_id int,
	item_id int,
	quantity int,
	primary key(character_id, item_id),
	foreign key(character_id) references character(character_id),
	foreign key(item_id) references item(item_id)
);