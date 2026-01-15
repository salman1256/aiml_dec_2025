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
------------------------------------------------------------------------------------------------------------------------------
select DATEADD(Day,20,getdate())
select DATEADD(Year,10,getdate())
select DateAdd(Month,3,getdate())


update Customers set SEDate=dateadd(YEAR,1,getdate()) where CId=1

select * from Customers

update Customers set SEDate=dateadd(Month,3,getdate()) where CId=4
--------------------------------------------------------------------------
create table Customers
(CustomerId int primary key,
 FName nvarchar(50) not null,
 LName nvarchar(50) not null)
 
 create schema bank

 create table bank.Customers
(CustomerId int primary key,
 FName nvarchar(50) not null,
 LName nvarchar(50) not null)

 select * from Customers

 select * from dbo.Customers

 select * from bank.Customers
 ---------------------------------------------------------
 create function fullName
 (@fn nvarchar(50),
 @ln nvarchar(50))
 returns nvarchar(101)
 as
 begin
 return @fn+ ' '+@ln
 end
 ------------------------------------------
 select dbo.fullName('Raj','Kumar') as 'Full Name'
 ---------------------------------------------------------

 select Fname,Lname,dbo.fullName(Fname,Lname) 'Employee Name ' from Employees 
 -------------------------------------------------------------------
 --begin {  }end
 alter function calcTax
 ( @amount float)
 returns float
 as
 begin
 declare @tax float
 if(@amount>=500)
 begin
 select @tax=@amount*0.20
 end
 else
 begin
 select @tax=@amount*0.10
 end
 return @tax
 end
 
 select dbo.calcTax(1000) 'Tax 1K'

 select dbo.calcTax(400) 'Tax 400 RM'
 select calcTax(1200) 'Tax 1200' --'calcTax' is not a recognized built-in function name.
 select dbo.calcTax(1200) 'Tax 1200'

  select CId,Fname,Lname,AAmount, 
  dbo.calcTax(AAmount) 'Tax', 
  AAmount+ dbo.calcTax(AAmount) 
  'Bill with Tax' from Customers
  ------------------------------------------------------------------------
  -- Group by
 
  create table Students
  (SId  nvarchar(10) primary  key,
   SName nvarchar(50) not null,
   Course nvarchar(50) not null)
   insert into Students values 
   ('S-01','Sam','AIML'),   ('S-02','Ravi','Python'),   ('S-03','Sam','AIML'),
   ('S-04','Ravi','AIML'),   ('S-05','Ali','Power BI'),   ('S-06','Farha','Power BI'),
    ('S-07','Zoya','AIML'),   ('S-91','Mithun','SQL Server'),   ('S-108','Aditi','Power BI'),
   ('S-117','Sandeep','SQL Server'),   ('S-12','Mithun','AIML')

   select * from Students

   select count(*) 'Number of Students' from Students

   select distinct Course from Students

   select Course,Count(SId)'Students Count' from Students group by Course

   create table SalesReport
   (SalesId int primary key identity(1000,1),
   Region nvarchar(50) not null check (Region in('North','South','East','West')),
   SalesAmount float not null)
   insert into SalesReport(Region,SalesAmount) values 
   ('North',200.25),   ('West',300.25),   ('North',500.25),   ('East',600.89),
   ('West',1500.55),   ('East',500.75),   ('North',900.25),   ('South',500.21),
   ('South',700.25),   ('North',200.25),   ('North',500.25),('West',1300.25)

   select * from SalesReport
   select sum(SalesAmount) as 'Total Sales' from SalesReport

   select Region ,sum(SalesAmount) 'Region wise sales' from SalesReport group by Region

   select Region ,sum(SalesAmount) 'Region wise sales' from SalesReport group by Region order by Region desc
   select Region ,sum(SalesAmount) 'Region wise sales' from SalesReport group by Region having Region='North' or Region='South'