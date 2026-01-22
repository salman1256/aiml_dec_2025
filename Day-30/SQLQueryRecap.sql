--create object <objectName>
--create database <databaseName>
create database RecapDb
go
use RecapDb
go
---create table <tableName>(
--ColumnName DataType [Constraint],
-----
---ColumnName DataType [Constraint]
--)
create table Category
(CatId int primary key,
 CatName nvarchar(50) not null unique
 )
 insert into Category(CatId,CatName) values (1,'Electronics')
  insert into Category values (2,'Mobile')
  insert into Category values (3,'Grooming'),(4,'Home Decoration'),(5,'Clothing')
  select * from Category
   select * from Category order by CatId
   go
   create table Product
   (PId int identity(1000,5) primary key,
    Pname nvarchar(50) not null ,
	PPrice decimal(10,2) not null,
	PCategory int foreign key references Category(CatId)
	)
	go
	insert into Product values ('IPhone-16',7500.50,2)
	insert into Product values ('Touch Screen',500.20,1),
	('Samsung Z-Fold',8500.20,2),
	('Pillow',100.25,4),
	('Curatin Set',300.30,4),
	('Balck out Curtain',350.20,4)

	select * from Product
	-------------------------------------------------
	select * from Product,Category where Product.PCategory=Category.CatId

select * from Product p,Category c where p.PCategory=c.CatId

select p.pId,p.Pname,c.CatName from Product p,Category c where p.PCategory=c.CatId
		
		select p.pId 'Product Id',
		p.Pname 'Product Name',
		p.PPrice 'Prodcut Price',
		c.CatName 'Product Category' 
		from Product p,Category c 
		where p.PCategory=c.CatId
	-----------------------------------------------------
	--Constraints
	Create table Emps
	(Id int primary key,   --not null and unique
	Fname nvarchar(50) not null,
	Lname nvarchar(50),
	Salary float check (Salary>=1000 and Salary<=12000), -- will check the salary must be in range 1k to 12K
	Contact varchar(10) unique check (Contact like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	City nvarchar(50) default 'Kuala Lumpur')

	insert into Emps values (1,'Sam','Dicosta',8000.50,'9876543210','California')
	insert into Emps (Id,Fname,Salary,Contact,City) values (2,'Arsh',7600.35,'8899561000','Delhi')
	
	select * from Emps
	
	insert into Emps values (3,'Sam','Dicosta',9000.50,'9876543245','Penang')
	insert into Emps values (4,'Deep','Das',8000.50,'76543246','Mumbai')
	--Msg 547, Level 16, State 0, Line 66
--The INSERT statement conflicted with the CHECK constraint "CK__Emps__Contact__3F466844".
 --The conflict occurred in database "RecapDb", table "dbo.Emps", column 'Contact'.
 insert into Emps values (4,'Deep','Das',8000.50,'7654324611','Mumbai')
 ----------------------------------------------
  insert into Emps values (12,'Ravi','Kiran',900.50,'8654324618','Mumbai')
  --The INSERT statement conflicted with the CHECK constraint "CK__Emps__Salary__3E52440B". 
  --The conflict occurred in database "RecapDb", table "dbo.Emps", column 'Salary'.

   insert into Emps values (12,'Ravi','Kiran',2900.50,'8654324618','Mumbai')
   -----------------------------------------------------------------------------
   insert into Emps (Id,Fname,Lname,Salary,Contact) values (13,'Xi','Chang',5500.89,'5577889900')
   select * from Emps
   select * from Emps
   -----------------------------------------------------------------------------------------
   update Emps set City='Goa' where Id=4
   select * from Emps
    update Emps set City='Hyderabad', Lname='Sharma' where Id=12
	select * from Emps where Id=12
	----------------------------------------------------------------------------------