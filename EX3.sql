create database EX3
use EX3;

create table Department
(
	Dno varchar(9) primary key,
	Dname nvarchar(20) unique
);

 create table Student
 (
    Sno varchar(9) primary key,
    Sname nvarchar(20) unique,
    Ssex nvarchar(2) check(Ssex in('男','女')),
    Sdept nvarchar(20),
    foreign key(Sdept) references Department(Dname)
 );
 
 create table Course
 (
	Cno varchar(4) primary key,
	Cname nvarchar(40) not null,
	Cpno varchar(4),
	Ccredit smallint,
	foreign key(Cpno) references Course(Cno) 
 );
 
 create table SC
 (
	Sno varchar(9),
	Cno varchar(4),
	Grade smallint,
	primary key (Sno,Cno),
	foreign key (Sno)references Student(Sno),
	foreign key (Cno)references Course(Cno)
 );
 
 select *
 from Student;
 
 insert into Department(Dno,Dname) values('01','计算机类');
 
 insert into Department(Dno,Dname) values('02','软件工程');
 
 insert into Department(Dno,Dname) values('03','信息安全');
 
 insert into Department(Dno,Dname) values('04','数学类');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702201','甲','女','数学类');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702202','乙','女','计算机类');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702203','丙','女','软件工程');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702204','丁','男','计算机类');

 insert into Student(Sno,Sname,Ssex,Sdept) values('031702205','戊','男','计算机类');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702206','己','男','软件工程');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702207','庚','男','软件工程');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702208','辛','男','信息安全');

 insert into Course(Cno,Cname,Cpno,Ccredit) values('01','高等数学',null,5);
 
 insert into Course(Cno,Cname,Cpno,Ccredit) values('02','大学物理',null,2);
 
 insert into Course(Cno,Cname,Cpno,Ccredit) values('03','c语言',null,3);
 
 insert into Course(Cno,Cname,Cpno,Ccredit) values('04','面向对象','03',3);
 
 insert into SC(Sno,Cno,Grade) values('031702201','01',86);
 insert into SC(Sno,Cno,Grade) values('031702201','02',89);
 insert into SC(Sno,Cno,Grade) values('031702201','03',91);
 insert into SC(Sno,Cno,Grade) values('031702201','04',83);
 insert into SC(Sno,Cno,Grade) values('031702202','01',88);
 insert into SC(Sno,Cno,Grade) values('031702202','02',85);
 insert into SC(Sno,Cno,Grade) values('031702202','03',92);
 insert into SC(Sno,Cno,Grade) values('031702202','04',84);
 insert into SC(Sno,Cno,Grade) values('031702203','01',90);
 insert into SC(Sno,Cno,Grade) values('031702203','02',87);
 insert into SC(Sno,Cno,Grade) values('031702203','03',86);
 insert into SC(Sno,Cno,Grade) values('031702203','04',88);
 insert into SC(Sno,Cno,Grade) values('031702204','01',90);
 insert into SC(Sno,Cno,Grade) values('031702204','02',91);
 insert into SC(Sno,Cno,Grade) values('031702204','03',87);
 insert into SC(Sno,Cno,Grade) values('031702204','04',89);
 insert into SC(Sno,Cno,Grade) values('031702205','01',88);
 insert into SC(Sno,Cno,Grade) values('031702205','02',92);
 insert into SC(Sno,Cno,Grade) values('031702205','03',85);
 insert into SC(Sno,Cno,Grade) values('031702205','04',90);
 insert into SC(Sno,Cno,Grade) values('031702206','01',95);
 insert into SC(Sno,Cno,Grade) values('031702206','02',86);
 insert into SC(Sno,Cno,Grade) values('031702206','03',88);
 insert into SC(Sno,Cno,Grade) values('031702206','04',91);
 insert into SC(Sno,Cno,Grade) values('031702207','01',92);
 insert into SC(Sno,Cno,Grade) values('031702207','02',96);
 insert into SC(Sno,Cno,Grade) values('031702207','03',89);
 insert into SC(Sno,Cno,Grade) values('031702207','04',85);
 insert into SC(Sno,Cno,Grade) values('031702208','01',85);
 insert into SC(Sno,Cno,Grade) values('031702208','02',89);
 insert into SC(Sno,Cno,Grade) values('031702208','03',91);
 insert into SC(Sno,Cno,Grade) values('031702208','04',95);

 select *
 from SC;

 select Student.Sno,Student.Sname,Course.Cname,SC.Grade from Student ,Course,SC where Student.Sno=SC.Sno and Course.Cno=SC.Cno order by Sno asc;

 select max(Grade) 最高分
 from SC
 where Cno='02';
 
 select (Cno)课程号,avg(Grade)平均分
 from SC
 group by Cno;

 select (Sname)姓名
 from Student 
 where Sno in
			(
				select Sno
				from SC
			);


create view view_SC(Sno,Sname,Grade)
as
	select Student.Sno,Student.Sname,SC.Grade
	from Student,SC;

select max(Grade)最高分,min(Grade)最低分
from view_SC;

select *
from view_SC;

 delete
 from Course; 
 
 
 select *
 from SC;
