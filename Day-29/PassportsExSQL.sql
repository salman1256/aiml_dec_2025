create database PassportDb
use PassportDb

create table Person
(PersonId int primary key,
FullName nvarchar(100) not null,
DateofBirth date not null,
Nationality nvarchar(50) not null
)

create table Passports
(PassportId nvarchar(15) primary key,
 PersonId int not null unique foreign key references Person,
 PassportNumber nvarchar(50) not null unique ,
 IssueDate date not null,
 ExpiryDate date not null
 )
 insert into Person (PersonId,FullName,DateofBirth,Nationality)
 values
(1, 'Mohd Sameer', '1985-03-14', 'Indian'),
(2, 'Niti Sharma', '1990-09-20', 'Indian'),
(3, 'Sam John', '1988-12-05', 'Canadian'),
(4, 'Chang Vi', '1988-12-05', 'Malaysia'),
(5, 'Amir A Mkhatib', '1990-12-05', 'Malaysia'),
(6, 'Li Xing', '1989-11-05', 'Malaysia')
select * from Person

insert into Passports values
('PP1001', 1, 'IND-A1234567', '2022-01-10', '2032-01-09'),
('PP1002', 2, 'IND-B7654321', '2023-05-05', '2033-05-04'),
('PP1003', 3, 'CA-C9988776', '2021-09-18', '2026-09-17'),
('PP1004', 4, 'MY-M9988770', '2021-09-18', '2031-09-17'),
('PP1005', 5, 'MY-M9988772', '2021-09-18', '2025-09-17'),
('PP1006', 6, 'M-M9988771', '2021-09-18', '2031-09-17')
select * from Passports

select pr.PersonId,pr.FullName,pr.DateofBirth,pr.Nationality,
pp.PassportNumber,pp.ExpiryDate,pp.IssueDate from Passports pp join Person pr  
on pp.PersonId=pr.PersonId
