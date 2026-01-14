use Jan14Db
--cross join
-- first table has m record , second table has n record then cross join has m*n records
create table Colors
(CId int primary key ,
Color nvarchar(50) not null unique)
insert into Colors(CId,Color) values (1,'Red'),(2,'Green'),(3,'Blue'),(4,'Yellow')
select * from Colors order by CId
select count(*) 'Number of Rows' from Colors

create table Sizes
(SId int primary key ,
Size nvarchar(50) not null unique)
insert into Sizes(SId,Size) values (1,'Small'),(2,'Medium'),(3,'Large')

select * from Sizes order by SId
select count(*) 'Number of Rows' from Sizes

--cross join
select * from Colors cross join Sizes

select c.Color,s.Size from Colors c cross join Sizes s order by Color

insert into Sizes(SId,Size) values (4,'Extra Large')
select c.Color,s.Size from Colors c cross join Sizes s order by Color
--Self Join
create table Employees 
(EmployeeId int primary key,
EmployeeName nvarchar(50) not null,
ManagerID int)

insert into 
Employees(EmployeeId,EmployeeName) 
values
(1,'Sam')

insert into 
Employees(EmployeeId,EmployeeName,ManagerID) 
values
(2,'Raj',1),
(3,'Rohan',2),
(4,'Arsh',1),
(5,'Dev',2),
(6,'Rishi',3)
select * from Employees

select e.EmployeeName 'Employee',m.EmployeeName 'Manager' from 
Employees e join Employees m on
e.ManagerID=m.EmployeeId

select e.EmployeeName 'Employee',m.EmployeeName 'Manager' from 
Employees e left outer join Employees m on
e.ManagerID=m.EmployeeId

--Computed,persisted Columns
Create table Salary
(CategoryId char(2) primary key,
BasicSalary float not null,
HRA as BasicSalary*0.10,
TA as BasicSalary*0.15,
DA as BasicSalary*0.20
)

insert into Salary (CategoryId,BasicSalary) values ('A',5000)
insert into Salary (CategoryId,BasicSalary) values ('B',4000)
insert into Salary (CategoryId,BasicSalary) values ('C',3000)
select * from Salary
---- union, unionall, intersect , expect
Create table UAEBookStore
(BId int primary key,
BookName nvarchar(50) not null,
BookQty int default 1)

Create table KLBookStore
(BId int primary key,
BookName nvarchar(50) not null,
BookQty int default 1)
insert into UAEBookStore values (1,'The God of Small Things',50)
insert into UAEBookStore values (2,'Harry Potter',10)
insert into UAEBookStore values (3,'You can win',5)
insert into UAEBookStore values (4,'Rich Dad Poor Dad',20)
insert into UAEBookStore values (5,'Psychology of Money',15)

insert into KLBookStore values (2,'Harry Potter',25)
insert into KLBookStore values (3,'You can win',12)
insert into KLBookStore values (10,'Wings of Fire',30)
select * from UAEBookStore
select * from KLBookStore
--union display all distinct books from both bookstore
select BId  'Book Id', BookName from UAEBookStore
union 
select  BId  'Book Id', BookName from KLBookStore

--union display all  books from both bookstore including duplicate as well

select BId  'Book Id', BookName from UAEBookStore
union all
select  BId  'Book Id', BookName from KLBookStore

--intersect: show common records from both tables
select BId  'Book Id', BookName from UAEBookStore
intersect
select  BId  'Book Id', BookName from KLBookStore

--except table1-table2
select BId  'Book Id', BookName from UAEBookStore
except
select  BId  'Book Id', BookName from KLBookStore

--Books in KL
select  BId  'Book Id', BookName from KLBookStore
except
select BId  'Book Id', BookName from UAEBookStore
----------------------------------------------------------
select * from Emps

--Built in functions

--Aggregate functions sum,max,min,avg

select max(Salary)as 'Maximum Salary' from Emps
select min(Salary)  'Minimum Salary' from Emps
select avg(Salary) 'Average Salary' from Emps
select sum(Salary) 'Total of salaries' from Emps

----------------------------------------------------------------
select * from Emps

select Fname +' '+ Lname 'Full Name' from Emps
select Id,Fname,Lname,Fname +'  '+ Lname 'Full Name', Designation,Salary from Emps
