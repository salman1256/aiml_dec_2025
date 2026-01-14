create database Jan14Db
use Jan14Db
--globally unique identifier
create table Person
(PId uniqueidentifier primary key,
Pname nvarchar(50) not null,
PContact varchar(10))

insert into Person values (NEWID(),'Sam','9876543210')
insert into Person values (NEWID(),'Ali','9876543777')
insert into Person values (NEWID(),'Arsh','8886543210')

select * from Person
--------------------------------
drop table Person
-------------------------
create table Person
(PId uniqueidentifier primary key default NEWID(),
Pname nvarchar(50) not null,
PContact varchar(10))

insert into Person(Pname,PContact) values ('Sam','9876543210'),('Ali','9876543777'),('Arsh','8886543210')
select * from Person
--foreign key: ensures referential integrity i.e. It guarantees that the value in child table must exist in parent table
--parent table :category
create table Category  
(CId int primary key,
 CName nvarchar(50) not null unique)
 insert into Category values (1,'Electronics'),(2,'Mobile'),(3,'Home Decor'),(4,'Other')
 select * from Category order by CId
 select * from Category order by CId desc
 --child table : product
 -- Column datatype forieng key references ParentTable(Column)
 create table Product 
 (PId int primary key,
  Pname nvarchar(50) not null,
  Pprice float ,
  Pcategory int foreign key references Category(CId)
  )
  insert into Product values (1,'IPhone',5000,2)
    insert into Product values (2,'Waching Machine',2000,1)
	insert into Product values (3,'Fridge',1500,1)
	insert into Product values (4,'Herbal Shampoo',100,6)
	--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Product__Pcatego__3E52440B".
	--The conflict occurred in database "Jan14Db", table "dbo.Category", column 'CId'.
	
	select * from Product

	select * from Category,Product  where Category.CId= Product.Pcategory

	select p.PId,p.Pname,p.Pprice,p.Pcategory,c.CName from Category c,Product p where c.CId= p.Pcategory

	------------------------------------------------------------------------------------------------------------------
	create table StudentReg
	(SId int primary key,
	 Fname nvarchar(50) not null,
	 Lname nvarchar(50) not null,
	 Age int not null)

	 create table StudentFee
	 (SId int not null foreign key references StudentReg(SId),
	 FMonth int not null,
	 FYear int not null,
	 FAmount float not null,
	 constraint Fee_PK primary key (SId,FMonth,FYear)
	 )

	 insert into StudentReg values (1,'Sam','Dicosta',10),(5,'Naina','Mhajan',6),(7,'Disha','Verma',9),(8,'Ali','Khan',8)
	 select * from StudentReg
	 insert into StudentFee values (5,2,2025,2000.50)
	  insert into StudentFee values (5,4,2025,2000.50)
	   insert into StudentFee values (1,2,2025,2000.50)
	  insert into StudentFee values (1,4,2025,2000.50)
	  insert into StudentFee values (7,1,2025,2500)
	  insert into StudentFee values (7,2,2025,2500)
	
	--Create a table Author: AuthorId, AuthorName
	-- Create a table Book: BookId, BookName, BookPrice, BookAuthor
	--Create relationship between these two tables
	-- insert at least 3 records in Author table
	--  insert at least 2-2 books for each author
	--Hint: Use Author as parent able AuthorId as primary key
	-- Book as child table BookAuthor as foriegn key 
	select * from StudentReg
	select * from StudentFee

delete from StudentReg where SId=8
select * from StudentReg
delete from StudentReg where SId=7
--The DELETE statement conflicted with the REFERENCE constraint "FK__StudentFee__SId__440B1D61". 
-- The conflict occurred in database "Jan14Db", table "dbo.StudentFee", column 'SId'.
drop table StudentFee
drop table StudentReg
---
create table StudentReg
	(SId int primary key,
	 Fname nvarchar(50) not null,
	 Lname nvarchar(50) not null,
	 Age int not null)
	 create table StudentFee
	 (SId int not null foreign key references StudentReg(SId) on delete cascade on update cascade,
	 FMonth int not null,
	 FYear int not null,
	 FAmount float not null,
	 constraint Fee_PK primary key (SId,FMonth,FYear)
	 )
	 insert into StudentReg values (1,'Sam','Dicosta',10),(5,'Naina','Mhajan',6),(7,'Disha','Verma',9),(8,'Ali','Khan',8)
	 select * from StudentReg
	 insert into StudentFee values (5,2,2025,2000.50)
	  insert into StudentFee values (5,4,2025,2000.50)
	   insert into StudentFee values (1,2,2025,2000.50)
	  insert into StudentFee values (1,4,2025,2000.50)
	  insert into StudentFee values (7,1,2025,2500)
	  insert into StudentFee values (7,2,2025,2500)
		select * from StudentReg
	select * from StudentFee
	delete from StudentReg where SId=7
	delete from StudentReg where SId=1
	update StudentReg set SId=19 where Fname='Naina'