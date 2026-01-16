use Jan16Db
select * from wseller.Products
create table  Students
(SId int primary key,
 Fname nvarchar(50) not null,
 Lname nvarchar(50) not null,
 Dob date not null,
 Fee decimal(10,2) not null)
 
 insert into Students values (1,'Sam','Dicosta','12/26/2010',500.50)
 insert into Students values (2,'Ravi','Kumar','12/25/2009',450.75)
 insert into Students values (5,'Arsh','Maan','05/19/2010',500.50)
 insert into Students values (9,'Zoya','Aalif','03/11/2009',450.75)

 select * from Students
 --------------------------------------
 -- create procedure|proc <proceduter>
 -- parameters
 -- as 
 -- SQL Statements
 --------------------------------
 create procedure usp_sallStudents
 as
 select * from Students
 ---------------------
  execute usp_sallStudents
 -----------------------

 create proc usp_allStudents
 as
 select SId 'Student Id', Fname 'First Name', 
 Lname 'Last Name', Dob 'Date of Birth', Fee 'Student Fee'
 from Students
 -------------------------
 exec usp_allStudents
 ---------------------------
 create proc usp_searchStudentById
 @id int
 as
 select * from Students where SId=@id
------------------------------------------
 exec usp_searchStudentById 2
 exec usp_searchStudentById 8
  exec usp_searchStudentById 5
-----------------------------------------
 create proc usp_StudentById
 @id int =1
 as
 select SId 'Student Id', Fname 'First Name', 
 Lname 'Last Name', Dob 'Date of Birth', Fee 'Student Fee'
 from Students  where SId=@id
 ---------------------------------------

 exec usp_StudentById 5
 exec usp_StudentById 2
 exec usp_StudentById 8
 exec usp_StudentById 
 --------------------------------------
 select * from Students
 -----------------------------------------------
 create proc usp_insertStudent
 @id int,
 @fn nvarchar(50),
 @ln nvarchar(50),
 @dob date,
 @fee decimal(10,2)
 as
 insert into Students(SId,Fname,Lname,Dob,Fee) values (@id,@fn,@ln,@dob,@fee)
 if(@@ERROR<>0)
 print 'Error Occurred'
 else
 print 'Student '+@fn +'Registration Success'
--------------------------------------------------------------
 exec usp_insertStudent 6,'Danish','Waani','10/12/2012',375.75
 exec usp_allStudents
 -------------------------------------------------------------
  exec usp_insertStudent 5,'Raj','Kiran','10/12/2012',375.75
  ---------------------------------------------------------------
--update student Record 
 create proc usp_updateStudent
 @id int,
 @fn nvarchar(50),
 @ln nvarchar(50),
 @dob date,
 @fee decimal(10,2)
 as
update Students set Fname=@fn, Lname=@ln,Dob=@dob ,Fee=@fee where SId=@id
 if(@@ERROR<>0)
 print 'Error Occurred'
 else
 print 'Student  Record updated '
 -----------------------------------
 exec usp_allStudents
 -------------------------
 exec usp_updateStudent 9,'Zoya','Aamir','1/21/2010',560.30
 exec usp_updateStudent 6,'Neha','Mahajan','02/21/2010',830.50

 select * from Students
 --Create one stored procedure to delete the record from Students table based on SId
 -- check the procedure by deleting SId 6
 create proc usp_DelStudentById
 @id int
 as
 delete from Students where SId=@id
 if(@@ERROR<>0)
 print 'Error Occurred'
 else
 print 'Student  Record Deleted '
 ---------------------------------
 exec usp_DelStudentById 6
 -----------------------
 execute usp_allStudents
 ---------------------------