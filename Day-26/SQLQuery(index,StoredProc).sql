use Jan16Db
create table Emps
(Id int primary key,
Fname nvarchar(50),
Lname nvarchar(50),
Salary decimal(10,2),
Designation nvarchar(50) not null check (Designation in ('Manager','HR','Tester','Developer','Other')),
DOJ date default getdate()
)
insert into Emps values (1,'Sam','Dicosta',90000,'Manager','12/12/2020')
insert into Emps values (2,'Deep','Das',37000,'Tester','12/12/2022')
insert into Emps values (3,'Vinay','Kumar',90000,'Manager','12/12/2021')
insert into Emps values (4,'Rohit','Gaur',86000,'Developer','12/02/2021')
insert into Emps values (5,'Raj','Dixit',76000,'Developer','02/23/2020')
insert into Emps values (7,'Sam','Dicosta',90000,'Manager','12/12/2020')
insert into Emps values (8,'Deepak','Bansal',37000,'Tester','12/12/2022')
insert into Emps values (9,'Zen','S',90000,'Manager','04/10/2023')
insert into Emps values (10,'Soni','Sam',86000,'Developer','08/02/2020')
insert into Emps values (12,'Arsh','Mana',76000,'Developer','12/23/2019')
select * from Emps
select count(*) 'Number of Employees' from Emps where Designation ='Manager'
--------------------------------
create proc usp_DesignationCount
@desig nvarchar(50),
@noe int output
as
select @noe=Count(*) from Emps where Designation=@desig
-------------------------------------------

declare @empCount int
exec usp_DesignationCount 'Developer',@empCount output
print @empCount
-----------------------------
declare @empCount int
exec usp_DesignationCount 'Developer',@empCount output
print concat('Number of Employees are: ',' ',  @empCount)

---------------------------------------------------------------
--nestedPro
create proc usp_nestedPro
@desig nvarchar(50)
as
declare @empCount int
exec usp_DesignationCount @desig,@empCount output
print concat('Number of Employees wroking as',@desig,' are: ',  @empCount)
--------------------------------------------------------------------------------
exec usp_nestedPro 'Tester'
exec usp_nestedPro 'Developer'
--------------------------------------------------------------------------------
--Built In Stored Procedure
exec sp_help
exec sp_help 'Emps'
exec sp_help 'Students'
------------------------
exec sp_tables
---------------------
exec sp_columns 'Emps'
---------------
exec sp_server_info
-----------------
exec sp_databases

-------------------------
exec sp_helptext 'usp_DesignationCount'

exec sp_helptext usp_allStudents
------------------------------
alter proc usp_allStudents
with encryption
 as  
 select  Fname 'First Name',   
 Lname 'Last Name', Dob 'Date of Birth', Fee 'Student Fee'  
 from Students  
-------------------------------
 exec usp_allStudents

 exec sp_helptext usp_allStudents

  exec sp_helptext usp_DelStudentById
  ----------------------------------
  drop proc usp_DelStudentById
  -----------------------------------------
  -- index: used to do the fast fetching of the data
  --- clustered index : one clustered index per table , 
  --- non clustered index:
  create table Emp
  (Id int,
  Name nvarchar(50),
  Salary float)
  insert into Emp values (2,'Sam',9800.50)
  insert into Emp values (12,'Ravi',6500.50)
  insert into Emp values (5,'Raj',8500.50)
  insert into Emp values (6,'Deep',7800.50)
  select * from Emp
  select * from Emp where Id=5
  --create clustered index indexName on <tableName>(columnName)
  create clustered index index_id on Emp(Id)
   select * from Emp
  select * from Emp where Id=5
  --- non clustered index 
  create nonclustered index index_sal on Emp(Salary)
  exec sp_helpindex 'Emp'

 drop index index_sal on Emp

 exec  sp_helpindex 'Emp'

