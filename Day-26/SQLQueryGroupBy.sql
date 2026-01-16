create database Jan16Db
use Jan16Db
create schema wseller

create table wseller.Products
(PId int primary key,
Pname nvarchar(50) not null,
PPrice float ,
PCategory nvarchar(50) not null  check (PCategory in ('Electronics','Clothing','Grooming','Home Decor'))
)
insert into wseller.Products values (9,'T-shirt',200,'Clothing')
insert into wseller.Products values (2,'Shirt',500,'Clothing')
insert into wseller.Products values (3,'Laptop',3500,'Electronics')
insert into wseller.Products values (4,'Face Wash',3000,'Grooming')
insert into wseller.Products values (5,'Face Cream',3000,'Grooming')
insert into wseller.Products values (6,'Table',3000,'Home Decor')
insert into wseller.Products values (10,'Lip balm',3000,'Grooming')
insert into wseller.Products values (12,'Fridge',3000,'Electronics')
select * from wseller.Products
select sum(PPrice) 'Total Purchase Amount' from wseller.Products
select sum(PPrice) 'CategoryWise Total' ,PCategory from wseller.Products group by PCategory

select sum(PPrice) 'CategoryWise Total' , PCategory from wseller.Products where PId>=5 group by PCategory

select sum(PPrice) 'CategoryWise Total' , PCategory from wseller.Products group by PCategory having PCategory='Electronics'

select sum(PPrice) 'CategoryWise Total' ,PCategory from wseller.Products group by PCategory order by PCategory desc