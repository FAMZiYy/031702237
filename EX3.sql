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
    Ssex nvarchar(2) check(Ssex in('��','Ů')),
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
 
 insert into Department(Dno,Dname) values('01','�������');
 
 insert into Department(Dno,Dname) values('02','�������');
 
 insert into Department(Dno,Dname) values('03','��Ϣ��ȫ');
 
 insert into Department(Dno,Dname) values('04','��ѧ��');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702201','��','Ů','��ѧ��');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702202','��','Ů','�������');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702203','��','Ů','�������');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702204','��','��','�������');

 insert into Student(Sno,Sname,Ssex,Sdept) values('031702205','��','��','�������');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702206','��','��','�������');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702207','��','��','�������');
 
 insert into Student(Sno,Sname,Ssex,Sdept) values('031702208','��','��','��Ϣ��ȫ');

 insert into Course(Cno,Cname,Cpno,Ccredit) values('01','�ߵ���ѧ',null,5);
 
 insert into Course(Cno,Cname,Cpno,Ccredit) values('02','��ѧ����',null,2);
 
 insert into Course(Cno,Cname,Cpno,Ccredit) values('03','c����',null,3);
 
 insert into Course(Cno,Cname,Cpno,Ccredit) values('04','�������','03',3);
 
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

 select max(Grade) ��߷�
 from SC
 where Cno='02';
 
 select (Cno)�γ̺�,avg(Grade)ƽ����
 from SC
 group by Cno;

 select (Sname)����
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

select max(Grade)��߷�,min(Grade)��ͷ�
from view_SC;

select *
from view_SC;

 delete
 from Course; 
 
 
 select *
 from SC;
