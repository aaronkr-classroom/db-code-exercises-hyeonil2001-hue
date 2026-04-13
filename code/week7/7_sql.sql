--customer table
create table customer (
	customer_id int primary key,
	name varchar(100),
	phone varchar(13),
	address varchar(100)
);

--restaurant table
create table restaurant(
	restaurant_id int primary key,
	name varchar(100),
	phone varchar(13),
	address varchar(100)
);

--orders table
create table orders (
	order_id int primary key,
	customer_id int,
	restaurant_id int,
	order_date timestamp,
	total numeric,
	foreign key (customer_id) references customer(customer_id),
	foreign key (restaurant_id) references restaurant(restaurant_id)
);

--delivery table
create table delivery(
	delivery_id int primary key,
	order_id int,
	driver_name varchar(100),
	status int,
	foreign key(order_id) references orders(order_id)
);

--data 삽입
insert into customer values
(1, 'alice', '010-1234-1234', '충주'),
(2, 'adam', '010-2345-4567', '청주');

insert into restaurant values
(1, 'pizza school', '010-1234-1234', '세종'),
(2, '김밥천국', '010-2345-2345', '전주');

insert into orders values
(1, 1, 1, '2026-04-13 15:17:00', 24000),
(2, 2, 2, '2026-04-13 12:16:00', 8000);

insert into delivery values
(1, 1, '지석준', 1),  -- 0 받음 1조리 2배달중 3배달완료 4취소
(2, 2, '송지현', 2);

--db 쿼리
select * from orders;
select * from orders order by  total desc;
select * from dorders where total >= 10000;
select * from delivery where status=3;
