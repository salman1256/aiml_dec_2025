create database ExerciseDB
use ExerciseDB
 
create table CompanyInfo
(CId int primary key,
CName nvarchar(50) not null unique)
insert into CompanyInfo values (1,'Samsung'),(2,'HP'),(3,'Apple'),(4,'Dell'),(5,'Toshiba'),(6,'Redmi')
 
select * from CompanyInfo order by CId
 
create table ProductInfo
(PId int primary key,
PName nvarchar(50) not null,
PPrice float,
PMDate Date,
CId int)
 
insert into ProductInfo values (101,'Laptop',4999.99,'12/01/2024',1)
insert into ProductInfo values (102,'Laptop',3500,'01/01/2026',2)
insert into ProductInfo values (103,'Mobile',3599.00,'12/12/2025',2)
insert into ProductInfo values (104,'Laptop',4599.00,'11/30/2023',3)
insert into ProductInfo values (105,'Mobile',3999.99,'12/01/2024',3)
insert into ProductInfo values (106,'Laptop',2999.99,'06/01/2022',5)
insert into ProductInfo values (107,'Mobile',2999.99,'09/01/2024',5)
insert into ProductInfo values (108,'Earpod',2999.99,'02/14/2025',3)
insert into ProductInfo values (109,'Laptop',2999.99,'01/10/2026',6)
insert into ProductInfo values (110,'Mobile',2999.99,'05/20/2025',1)
 insert into ProductInfo values (113,'Shampoo',120,'09/12/2021',null)
select * from ProductInfo
 
 
-- Show All Companies Name and their products detail
select
c.CName 'Company Name',
p.PId 'Product Id',
p.PName 'Product Name',
p.PPrice 'Product Price',
p.PMDate 'Product Manufactured Date'
from CompanyInfo c
left outer join ProductInfo p
on c.CId=p.CId
 
--Show All Products Name and their respective company name
select
p.PName 'Product Name',
c.CName 'Company Name'
from CompanyInfo c
right outer join ProductInfo p
on p.CId=c.CId