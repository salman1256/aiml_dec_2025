-- Joins in SQL Server
use Jan14Db
create table Depts 
(DId int primary key,
 DName nvarchar(50) not null unique)
  insert into Depts values (1,'App-Development'),(2,'Web-Development'),(3,'HR'),(4,'Account'),(5,'Agile-Scrum')
  select * from Depts order by DId

  create table Emps
  (Id int primary key,
  Fname nvarchar(50) not null,
  Lname nvarchar(50) not null,
  Designation nvarchar(50),
  Salary float,
  Department int )
  insert into Emps values (4,'Rohit','Kumar','Developer',8000.25,2)
  insert into Emps(Id,Fname,Lname,Salary) values (2,'Ali','Karim',6000)
  insert into Emps values (15,'Naina','Viz','Developer',8000.25,2)
  insert into Emps values (13,'Arsh','Maan','HR',8000.25,3)
  insert into Emps(Id,Fname,Lname,Salary) values (14,'Niti','Gaur',6000)
   insert into Emps values 
   (1,'Aamir','Khan','Developer',6000.25,1)
   ,(16,'Jai','Kumar','Developer',5000.25,1),
   (3,'Zoya','Aalif','Developer',7000.55,1)
  select * from Depts order by DId
  select * from Emps order by Id
  select count(DId) from Depts
  select count (Id) from Emps
  --select * from table1 join table2 on table1.CommonColumn=table.CommonColumn
  select * from Depts inner join Emps on Depts.DId=Emps.Department

  select * from Depts d inner join Emps e on d.DId=e.Department

   select e.Id,e.Fname,e.Lname,e.Designation,e.Department,d.DName from Depts d inner join Emps e on d.DId=e.Department
  --- 
   select e.Id 'Employee Id',
   e.Fname 'First Name',
   e.Lname 'Last Name',
   e.Designation  'Designation'  ,
   e.Department 'Department Id',
   d.DName 'Department Name'
   from Depts d 
    join Emps e
   on d.DId=e.Department

   --outer join 1. left outer join, 2. right outer join, 3. full outer join
   --left outer join 
   select e.Id 'Employee Id',
   e.Fname 'First Name',
   e.Lname 'Last Name',
   e.Designation  'Designation'  ,
   d.DId 'Department Id',
   d.DName 'Department Name'
   from Depts d 
    left outer join Emps e
   on d.DId=e.Department
      --right outer join
   select e.Id 'Employee Id',
   e.Fname 'First Name',
   e.Lname 'Last Name',
   e.Designation  'Designation'  ,
   d.DId 'Department Id',
   d.DName 'Department Name'
   from Depts d 
    right outer join Emps e
   on d.DId=e.Department
      --full outer join
    select e.Id 'Employee Id',
   e.Fname 'First Name',
   e.Lname 'Last Name',
   e.Designation  'Designation'  ,
   d.DId 'Department Id',
   d.DName 'Department Name'
   from Depts d 
    full outer join Emps e
   on d.DId=e.Department