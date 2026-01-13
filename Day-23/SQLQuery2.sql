use Jan13Db
--default:automatically applies default value during insert statement if the value is not given fro that column
-- for example
create table Emps
(Id int primary key,
 Fname nvarchar(50) not null,
 Salary float ,
 City nvarchar(50) default 'KL')
 insert into Emps values (1,'Sam',5000,'California')
 select * from Emps
 insert into Emps(Id,Fname) values (2,'Adila')
 select * from Emps
  insert into Emps(Id,Fname,Salary) values (4,'Sunil',3000)
  -- identity
  drop table Emps
  -- identity(seed,increment)
  -- 1,1

 create table Emps
(Id int identity primary key,
 Fname nvarchar(50) not null,
 Salary float ,
 City nvarchar(50) default 'KL')
insert into Emps values ('Sunil',3000,'Delhi')
insert into Emps values ('Sam',8000,'California')
select * from Emps
 insert into Emps(Fname,Salary) values ('Deep',3000)
------------------------------------------
 drop table Emps 

 create table Emps
 (Id int identity(100,5) primary key,
 Fname nvarchar(50) not null,
 Salary float ,
 City nvarchar(50) default 'KL')

insert into Emps values ('Sunil',3000,'Delhi')
insert into Emps values ('Sam',8000,'California')
insert into Emps(Fname,Salary) values ('Deep',3000)

select * from Emps

insert into Emps values ('Alina',7000,'Kabul')
----------------------------------------------------------
--create database ProductsDb
-- inside the database Create table Products
-- Table have following Columns
-- ProductId  int  identity starts from 1000 and next record is 1010 , 1020 and so..
-- ProductName  nvarchar(50) not null and unique
-- ProductQuantity  int should not be negative or more than 100 , default is 1
--insert at least 5 records
create database ProductsDb

use ProductsDb

Create table Products
(ProductId int identity(1000,10) primary key,
ProductName nvarchar(50) not null unique,
ProductQuantity int  check (ProductQuantity>1 and ProductQuantity<=100) default 1
)
insert into Products values ('IPhone',2),('Laptop',3),('Earphone',13),('HeadPhone',20),('Keyboard',3)
select * from Products