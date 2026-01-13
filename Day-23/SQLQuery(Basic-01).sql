-- create object objectName
 --create database databaseName
 create database Jan13Db
 use Jan13Db
 --create table <tableName>
 --(columnName Datatype [Constraint],
 --ColumnName Datatype [Constraint],
 ---)
 --primary key: not null and unique , we can write one primary key per table,
 --We can make primary key using multiple columns i.e. composit primary key 

 Create table Employee
 (Id int primary key,
 Fname nvarchar(50) not null,
 Lname nvarchar(50),
 Salary float)
  select * from Employee
  
  --insert into <tableName> values(v1,v2...)
  --insert into <tableName>(columnName....) values (v1...)
  insert into Employee values (1,'Sam','Dicosta',5000.50)

  select * from Employee

  insert into Employee values (2,'Neha','Sharma',3000.45),
  (3,'Alina','Dar',4000.50),
  (7,'Xi','Chan',5000.25),
  (9,'Sadiq','Mohammad',4500.25)

  insert into Employee(Id,Fname) values (11,'Sam')
  insert into Employee(Id,Fname) values (10,'Mithun')
  select * from Employee
  insert into Employee (Id,Lname,Salary) values (15,'John',8000.7)
  --Cannot insert the value NULL into column 'Fname', table 'Jan13Db.dbo.Employee'; 
  --column does not allow nulls. INSERT fails.
  insert into Employee values (2,'Deep','Das',3500.55)
  --Violation of PRIMARY KEY constraint 'PK__Employee__3214EC07A2B13727'. 
  --Cannot insert duplicate key in object 'dbo.Employee'. The duplicate key value is (2).

   insert into Employee values (8,'Deep','Das',3500.55)
   select * from Employee
   --drop table : drop table structure with record means everthing gone
   drop table Employee
   select * from Employee
      --- delete
   Create table Employee
 (Id int primary key,
 Fname nvarchar(50) not null,
 Lname nvarchar(50),
 Salary float)
 insert into Employee values (2,'Neha','Sharma',3000.45),
  (3,'Alina','Dar',4000.50),
  (7,'Xi','Chan',5000.25),
  (9,'Sadiq','Mohammad',4500.25)
  select * from Employee
  delete from Employee where Id=7
  select * from Employee
  delete from Employee
  select * from Employee
  insert into Employee values (2,'Neha','Sharma',3000.45)
  insert into Employee (Fname,Lname,Salary) values('Deep','Gupta',3500)
  --Cannot insert the value NULL into column 'Id', table 'Jan13Db.dbo.Employee'; column does not allow nulls. INSERT fails.
    -----------------------------------
  --not null, primary key
  -- unique: no duplicate value is allowed, we can insert null but only once, we can have multiple unique per table
  create table Customers
  (Id int primary key,
  Cname nvarchar(50) not null,
  Contact varchar(10) unique,
  Email nvarchar(100) unique,
  OdLimit float not null)
  insert into Customers values (1,'Sam','9876543210','sam@yahoo.com',50000)
  insert into Customers values (2,'Raj','8822100500','raj_prince@gmail.com',90000)
  select * from Customers
  insert into Customers values (3,'Aamir','9876543210','aamir@mail.com',65000)
  --Violation of UNIQUE KEY constraint 'UQ__Customer__F7C04665BC038731'. 
  --Cannot insert duplicate key in object 'dbo.Customers'. The duplicate key value is (9876543210).
   select * from Customers
  
  insert into Customers(Id,Cname,Email,OdLimit) values (3,'Aamir','amir1256@mail.com',65000)
  select * from Customers
  insert into Customers(Id,Cname,Contact,OdLimit) values (15,'Alina','6745230910',76000)
 select * from Customers
 --
 insert into Customers(Id,Cname,Contact,OdLimit) values (20,'Seen','8745230910',89000)

 --Violation of UNIQUE KEY constraint 'UQ__Customer__A9D10534BE8FA7BE'. 
 --Cannot insert duplicate key in object 'dbo.Customers'. The duplicate key value is (<NULL>).

 ---not null and unique 
 drop table Customers

  create table Customers
  (Id int primary key,
  Cname nvarchar(50) not null,
  Contact varchar(10) unique not null,
  Email nvarchar(100) unique not null,
  OdLimit float not null)
  
  insert into Customers values (1,'Sam','9876543210','sam@yahoo.com',50000)
  insert into Customers values (2,'Raj','8822100500','raj_prince@gmail.com',90000)
  
  select * from Customers
  insert into Customers(Id,Cname,Email,OdLimit) values (3,'Aamir','amir1256@mail.com',65000)
  --Cannot insert the value NULL into column 'Contact', table 'Jan13Db.dbo.Customers'; 
  --column does not allow nulls. INSERT fails.

  --Check: it will check the value or pattern before inserting, if its valid then only it will insert.
  drop table Employee
  Create table Employee
 (Id int primary key,
 Fname nvarchar(50) not null,
 Lname nvarchar(50),
 Salary float check (Salary>=1000 and Salary<=15000)
 )
   
   insert into Employee values (2,'Neha','Sharma',3000.45)
   select * from Employee
    insert into Employee values (3,'Deep','Das',900)
	--The INSERT statement conflicted with the CHECK constraint "CK__Employee__Salary__4222D4EF". 
	--The conflict occurred in database "Jan13Db", table "dbo.Employee", column 'Salary'.
    insert into Employee values (3,'Deep','Das',25000)
	 --The INSERT statement conflicted with the CHECK constraint "CK__Employee__Salary__4222D4EF". 
	  --The conflict occurred in database "Jan13Db", table "dbo.Employee", column 'Salary'.

 insert into Employee values (3,'Deep','Das',2500)
 --one more example
 
 create table Products
 (PId int primary key,
  Pname nvarchar(50) not null,
  PCompany nvarchar(50) not null check (PCompany in ('Apple','Samsung','Accer','Toshiba')),
  PPrice float not null)

  insert into Products values (1,'Mobile','Samsung',2000)
  insert into Products values (2,'Touch Screen','Accer',3600)
  select * from Products

  insert into Products values (3,'Laptop','Dell',2300)
  --The INSERT statement conflicted with the CHECK constraint "CK__Products__PCompa__47DBAE45". 
-- The conflict occurred in database "Jan13Db", table "dbo.Products", column 'PCompany'.

--Default constraint