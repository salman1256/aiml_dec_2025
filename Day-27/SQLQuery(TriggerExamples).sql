create database Day27Db
use Day27Db

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Salary float not null ,
Designation nvarchar(50),
DOJ date)


create table Emps_LogInfo
(LogId int primary key identity,
Id int,
Fname nvarchar(50) ,
Lname nvarchar(50) ,
Salary float ,
Designation nvarchar(50),
DOJ date,
LogtAction nvarchar(100),
ActionTime datetime)
select * from Emps
select * from Emps_LogInfo
---syntax to create DML Trigger
-- create trigger triggerName
  --- on tablename
   --{for insert|update|delete} as
   ---SqlStatement

  -- after insert 
  create trigger trgAfterInsertEmp
  on Emps
  after insert
  as
  declare @id int
  declare @fn nvarchar(50)
  declare @ln nvarchar(50)
  declare @sal float
  declare @desig nvarchar(50)
  declare @doj date
  select @id=Id,@fn=Fname,@ln=Lname,@sal=Salary,@desig=Designation,@doj=DOJ from inserted
  insert into Emps_LogInfo(Id,Fname,Lname,Designation,DOJ,Salary,ActionTime,LogtAction) 
  values(@id,@fn,@ln,@desig,@doj,@sal,getdate(),'Trigger Action: Record Inserted ')
  print 'After Trigger Says : Record Inserted and Action Captured in LogTable'


  select * from Emps
  select * from Emps_LogInfo
  insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (1,'Arsh','Maan','Developer','12/12/2022',8000.45)
  insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (2,'Sam','Dicosta','Manager','02/12/2023',7000.55)
  -------------------------------------------------------------------------------------------------
  create trigger trgAfterDeleteEmp
  on Emps
  after delete
  as
  declare @id int
  declare @fn nvarchar(50)
  declare @ln nvarchar(50)
  declare @sal float
  declare @desig nvarchar(50)
  declare @doj date
  select @id=Id,@fn=Fname,@ln=Lname,@sal=Salary,@desig=Designation,@doj=DOJ from deleted

  insert into Emps_LogInfo(Id,Fname,Lname,Designation,DOJ,Salary,ActionTime,LogtAction) 
  values(@id,@fn,@ln,@desig,@doj,@sal,getdate(),'Trigger Action: Record deleted ')

  print 'After Delete Trigger Says : Record Deleted and Action Captured in LogTable'
  -----------------------------------------------------------------------------------------
   select * from Emps
  select * from Emps_LogInfo
  delete from Emps where Id=9
  truncate table Emps
  truncate table Emps_LogInfo
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (1,'Arsh','Maan','Developer','12/12/2022',8000.45)
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (2,'Sam','Dicosta','Manager','02/12/2023',7000.55)
alter trigger trgAfterDeleteEmp
  on Emps
  after delete
  as
  begin
if exists(select 1 from deleted)
	  begin
		  declare @id int
		  declare @fn nvarchar(50)
		  declare @ln nvarchar(50)
		  declare @sal float
		  declare @desig nvarchar(50)
		  declare @doj date
		  select @id=Id,@fn=Fname,@ln=Lname,@sal=Salary,@desig=Designation,@doj=DOJ from deleted

		  insert into Emps_LogInfo(Id,Fname,Lname,Designation,DOJ,Salary,ActionTime,LogtAction) 
		  values(@id,@fn,@ln,@desig,@doj,@sal,getdate(),'Trigger Action: Record deleted ')

		  print 'After Delete Trigger Says : Record Deleted and Action Captured in LogTable'
	   end
 end
 ----
  delete from Emps where Id=9
  delete from Emps where Id=2
   select * from Emps
  select * from Emps_LogInfo

  ---------------------------------------------------------------------------
  --Write one trigger for update : if record updated then it will captured information and store in Emps_LogInfo table
 create trigger trgAfterUpdateEmp
  on Emps
  after update
  as
  begin
if exists(select 1 from inserted)
	  begin
		  declare @id int
		  declare @fn nvarchar(50)
		  declare @ln nvarchar(50)
		  declare @sal float
		  declare @desig nvarchar(50)
		  declare @doj date
		  select @id=Id,@fn=Fname,@ln=Lname,@sal=Salary,@desig=Designation,@doj=DOJ from inserted

		  insert into Emps_LogInfo(Id,Fname,Lname,Designation,DOJ,Salary,ActionTime,LogtAction) 
		  values(@id,@fn,@ln,@desig,@doj,@sal,getdate(),'Trigger Action: Record Updated ')

		  print 'After Update Trigger Says : Record Updated and Action Captured in LogTable'
	   end
 end
   truncate table Emps
  truncate table Emps_LogInfo
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (1,'Arsh','Maan','Developer','12/12/2022',8000.45)
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (2,'Sam','Dicosta','Manager','02/12/2023',7000.55)
select * from Emps
select * from Emps_LogInfo
update Emps set Fname='Sam',Lname='J.Kingley',Designation='CTO' where Id=2
select * from Emps
select * from Emps_LogInfo
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (4,'Anil','Maan','Developer','09/12/2022',3000.4)
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (5,'Adi','Goyal','Tester','05/25/2024',2000.65)
insert into Emps(Id,Fname,Lname,Designation,DOJ,Salary) values (9,'Niti','Viz','HR','11/21/2024',5000.75)
----------------------------------------------------------------------------------------------------------------
--instead of trigger
-----------------------------------------------------------------------------------------------
create trigger trgInsDelEmp
on Emps
instead of delete
as
begin
	declare @id int 
	declare @fn nvarchar(50)
	declare @ln nvarchar(50)
	declare @sal float
	declare @desg nvarchar(50)
	declare @doj date
	select @id=Id,@fn=Fname,@ln=Lname,@sal=Salary,@desg=Designation,@doj=DOJ from  deleted
	if(@sal>=7000)
	begin
	 raiserror('You can not delete this record ,Need CEO permission',16,1)
	end
	else
	begin
	  delete from Emps where Id=@id
	  insert into Emps_LogInfo(Id,Fname,Lname,Designation,DOJ,Salary,ActionTime,LogtAction) 
	  values(@id,@fn,@ln,@desg,@doj,@sal,getdate(),'Trigger Action: Record Updated ')
	  print 'Instead of Delete Says : Record Deleted and Action Captured in LogTable'
	end
	end
----------------------------------
	delete from Emps where Id=2
	delete from Emps where Id=1
	delete from Emps where Id=5
	select * from Emps
	select * from Emps_LogInfo