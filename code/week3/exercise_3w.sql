/*
온라인 쇼핑몰

[Entities]
Product

[Product properties]
id bigserial
name varchar(50)
kind varchar(20)
price numeric
stock numeric

*/

create table product (
	id bigserial,
	name varchar(50),
	kind varchar(20),
	price numeric,
	stock numeric
)

insert into product(name, kind, price, stock)
values
	('shirt', 'clothes', 50000, 100),
	('pants', 'clothes', 10000, 20),
	('cookie', 'food', 500, 3000),
	('galaxy s25', 'device', 1000000, 100),
	('galaxy s10 ultra', 'device', 1300000, 5)

select * from product;

select * from product order by price;

select * from product where stock <= 50;