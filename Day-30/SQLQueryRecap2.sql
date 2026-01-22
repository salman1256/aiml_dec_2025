-- trigger, stored procedures, functions , joins or indexes 
 --functions: built in , user defined functions
 use RecapDb
 --Built In functions:
-- aggergate functions: max, min, avg, sum
select * from Emps
select max(Salary) 'Maximum Salary'from Emps
select min(Salary) 'Minimum Salary'from Emps
select avg(Salary) 'Average Salary'from Emps
select sum(Salary) 'Total Salary'from Emps

--- 
select round(12.383434,2) 'Round'
select ceiling(12.383434) 'Ceiling'
select floor(12.383434) 'Floor'
select Id,Fname, Lname ,Salary , round(Salary,2) 'Round', floor(Salary) 'Floor  Salary ',ceiling(Salary) 'Ceiling Salary'
from Emps
--------------------------------------------------------
select count(Id)'Number of Employees' from Emps
---------------------------------------------------------
---string 
select Fname,upper(Fname) 'UpperCase'from Emps
select Fname,lower(Fname)'Lower Case' from Emps
select Fname,left(Fname,2) 'First Two Ch'from Emps
select Fname,right(Fname,2)'Last Two ch' from Emps
select Fname,Lname,concat(Fname,' ',Lname) 'Full Name' from Emps
select Fname,Lname,concat(left(Fname,1),' .', left(Lname,1),'.') 'Initial' from Emps
select Fname,len(Fname) 'Length',Lname, len(Lname) 'Length' from Emps

-------------------------------------------------------------------------------------------
--date
select getdate()
--datepart
select DATEPART(MONTH,getdate()) 'Month'
select DATEPART(Year,getdate()) 'Year'
select DATEPART(Day,getdate()) 'Day'
----------------------------------------
select DATEDIFF(Day,'12/12/2012',getdate()) 'Days'
select DATEDIFF(Month,'12/12/2012',getdate()) 'Months'
select DATEDIFF(Year,'12/12/2012',getdate()) 'Years'
use PassportDb
select * from Passports
select PassportId,PassportNumber,ExpiryDate,DATEDIFF(Day,getdate(),ExpiryDate) 'Days To Expire' from Passports
select PassportId,PassportNumber,ExpiryDate,DATEDIFF(MONTH,getdate(),ExpiryDate) 'Months To Expire' from Passports
select PassportId,PassportNumber,ExpiryDate,DATEDIFF(Year,getdate(),ExpiryDate) 'Year To Expire' from Passports
-----------------------------------------------------------------------------
--user defined functions
--create function [schemaName.] functionName(parameters_list)
--returns datatype
--as
--begin
--statements
-- return value
--end
--------------------------------------------
use RecapDb
create function FullName (@fn nvarchar(50), @ln nvarchar(50))
returns nvarchar(101)
as
begin
return @fn+' '+@ln
end
-----------------------------------------
select dbo.FullName('Niti','Singh') 'Full Name'
-----------------------------------------------
select Id,Fname,Lname,dbo.fullName(Fname,Lname) 'Full Name' ,Salary from Emps
---------------------------------------------------------------------------
create function calcTax (@amount decimal(10,2))
returns decimal(10,2)
as
begin     
	declare @tax decimal(10,2)
	if(@amount>=5000)
		begin
		set @tax=@amount*0.20
		end
	else
		begin
		set @tax=@amount*0.10
		end
return @tax
end              
------------------------------------------
select dbo.calcTax(4000) 'Tax for 4K'
select dbo.calcTax(10000) 'Tax for 10K'
------------------------------------------
select Fname,LName,Salary,dbo.calcTax(Salary) 'Tax Amount' from Emps
----------------------------------------------------------------------------
-----------------------------------------------------------------------
--create proc|procedure <procedureName>
-- parameters
--as
--Sql Statements

--execute|exec procedureName  parameters
create proc usp_selectPro
as
select * from Emps 
-----------------------------
exec usp_selectPro
--------------------------
create proc usp_insertPro
@id int,
@fn nvarchar(50),
@ln nvarchar(50),
@salary float,
@contact varchar(10),
@city nvarchar(50)
as
insert into Emps(Id,Fname,Lname,Contact,Salary,City)
values(@id,@fn,@ln,@contact,@salary,@city)

execute usp_insertPro 21,'Neeraj','Kumar',8500.24,'9955448800','Delhi'
---------------------------------------------------------------------
select * from Emps
-------------------------------------
