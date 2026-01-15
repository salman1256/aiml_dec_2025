create database Day15JanDb
use Day15JanDb
create table Customers
(CId int primary key,
 Fname nvarchar(50) not null,
 Lname nvarchar(50) not null,
 SDate  date not null,
 SEDate date not null,
 AAmount float  default 500)

 insert into Customers values (1,'sam','dicosta','12/20/2024','01/20/2025',250.50),
 (2,'raj','kiran','01/01/2026','01/20/2027',250.50),
 (5,'arsh','maan','02/01/2025','01/20/2027',1250.00),
  (7,'shweta','verma','09/15/2024','09/15/2025',1000.50),
   (8,'danish','waani','10/20/2024','10/20/2026',750.70),
    (10,'ruhee','nazir','01/25/2025','10/20/2026',550.50)
	select * from Customers
	 insert into Customers values (4,'Niraj','KUMAR','12/20/2024','01/20/2025',100.344550)
	 select * from customers
	 ---Built in Functions
	 -- Mathematical Functions
	 select ABS(-12)  'Absolute Value'
	 select round(123.4555,2) 'Round off'

	 select  CId,Fname,Lname,SDate,SEDate,AAmount from Customers

	 select  CId,Fname,Lname,SDate,SEDate,round(AAmount,2) 'Round A. Amount' from Customers
	 select  CId,Fname,Lname,SDate,SEDate,ceiling(AAmount) 'Ceiling A. Amount' from Customers
	 select  CId,Fname,Lname,SDate,SEDate,floor(AAmount) 'Floor A. Amount' from Customers
	 select CEILING(23.45) 'Ceiling'
	 select FLOOR(23.45) 'floor'
	 select round(23.45888,2) 'round'

	 select POWER(2,3) 'Power example'
     select POWER(5,2) 'Power example'
	 select SQRT(625) 'Sqrt Example'
	  -- Aggregate Functions
	   select count(*) 'Number of Customers' from Customers
	   select AVG(AAmount) 'Avg.A.Amount' from Customers
	   select round(AVG(AAmount),2) 'Avg.A.Amount' from Customers
	   select max(AAmount) 'Max.A.Amount' from Customers
	   select min(AAmount) 'Min.A.Amount' from Customers
	    select sum(AAmount) 'Total.A.Amount' from Customers
--String Functions

select len('AI and Machine Learning') as 'Number of Characters'
select upper('AI and Machine Learning') as 'Upper case'
select lower('AI and Machine Learning') as 'lower case'

select Fname,len(Fname) 'Fname Length'from Customers
select upper(Fname) 'First Name', upper(lname) 'Last Name' from Customers
select lower(Fname) 'First Name', lower(lname) 'Last Name' from Customers

-- left ,--right
select left('AI and Machine Learning',2) 'Left 2'
select right('AI and Machine Learning',8) 'right 8'

select Fname,Lname, left(Fname,1) +'.'+left(Lname,1)+ '.' 'Initial'
from Customers

select concat ('AI',' ','ML')  'Concat Example'
select concat ('AI','/','ML','using Python') 'Concat Example'

 select  Fname,Lname,concat(Fname,' ',Lname) 'Full Name' from Customers

 select concat(CID,'-> ',Fname,' ->',Lname,'->',SDate,'->',SEDate,'->',AAmount) 'Customer Details' from Customers
 ---
 select REPLACE('I love Taj Mahal','Taj Mahal','Twin Towers') 'Replace Example'

 select substring('I love Taj Mahal',3,4) 'Substring Example'

 select SUBSTRING(Fname,0,5) 'First 2 characters' from Customers
create table Employees
(EmpId int primary key,
Fname nvarchar(50) not null,
Lname varchar(50) not null,	
EmpBasic float,	
DOJ date,
HRA as EmpBasic*.10,
TA as EmpBasic*.05,
DA as EmpBasic*.30)

insert into Employees values (110,'Sam','Dicosta',	42000,	'12/02/2014'),
(121,	'Ravi',	'Kumar',	20000,	'11/03/2015'),
(101,	'anita','Kumari',30000,	'11/04/2010')
select * from Employees

select
EmpId,
upper(left(Fname,1)) +' .'+upper(left(Lname,1))+'. '	'Initial', 	
EmpBasic, 
EmpBasic+HRA+TA+DA,'EmpSalary',	
DOJ
from Employees

--Date functions
select * from Customers
select * from Employees

-- getdate()
select getdate()
select YEAR(getdate())  'Current Year'
select month(getdate())  'Current Month'
select day(getdate())  'Current date'

--datediff
select datediff(Year,'12/26/1987',getdate()) as 'Age in Years'
select datediff(month,'12/26/1987',getdate()) as 'Age in total months'
select datediff(day,'12/26/1987',getdate()) as 'Age in total days'

select CId,Fname,Lname, SDate,SEDate, DATEDIFF(month,SDate,SEDate) 'Plan Validity in Months' from Customers

