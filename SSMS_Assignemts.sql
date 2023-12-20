t
SELECT NAME, FILENAME FROM SYS.SYSALTFILES

CREATE DATABASE Payroll
Use Payroll


drop table tblDepartments
                                  
--------------------------------------------------------------------------------
--EMPLOYEE CREATION 

Create Table tblEmployee
( 
EmployeeID int primary key,
EmployeeName varchar(50) not null,
Role varchar(50) not null,
Hiredate date default getdate(),
EmailID varchar(50) not null unique,
location varchar(50),
Salary int check(salary>15),
DepartmentID int Foreign  key references tblDepartment2(departmentID),
);
 
 --INSERCTIONS TABLE EMPLOYEE

 insert into tblEmployee values(2926,'Nishanth','DB','10/16/2023','nishanth@excelindia.com','Mysore',18000,10)
 insert into tblEmployee values(2927,'Sagar','Software Engineer Trainee','10/28/2023','sagar@excelindia.com','Tumkur',30000,20)
 insert into tblEmployee values(2928,'Ganesh','Back end','11/20/2023','ganesh@excelindia.com','Tipturu',18000,30)
 insert into tblEmployee values(2929,'Pavithra','HR','10/08/2023','pavithra@excelindia.com','Bangalore',20000,40)
 insert into tblEmployee values(2929,'Amjali','HR','10/08/2023','anjali@excelindia.com','Bangalore',20000,40)
 insert into tblEmployee values(2931,'Prajwal','Front end','10/16/2023','prajwal@excelindia.com','Mysore',10000,60)
 insert into tblEmployee values(2932,'Bhommika','DB','10/08/2023','bhoomika@excelindia.com','Tumkur',45000,70)
 insert into tblEmployee values(2933,'Rajshaker','Software Trainee','08/28/2016','rajshaker@excelindia.com','Hebbal',15000,80)
 insert into tblEmployee values(2934,'Manoj','PHP developer','04/23/2012','manoj@excelindia.com','Kolar',90000,90)
 insert into tblEmployee values(2935,'Mandara','Sales','03/15/2023','Mandara@excelindia.com','Shimoga',15000,10)

 select *
 from tblEmployee
 select *
 from tblDepartments

-- DEPARTMENT TABLE CREATION

Create Table tblDepartments
( 

DepartmentID int,
EmployeeName varchar(50),
Loction varchar(50)
);

--INSERCTIONS TABLE DEPARTMENT

 insert into tblDepartments values(10,'DB','Mysore')
 insert into tblDepartments values(20,'Software Engineer Trainee','Tumkur')
 insert into tblDepartments values(30,'Back end','Tipturu')
 insert into tblDepartments values(40,'HR','Bangalore')
 insert into tblDepartments values(50,'HR','Bangalore')
 insert into tblDepartments values(60,'Front end','Mysore')
 insert into tblDepartments values(70,'DB','Tumkur')
 insert into tblDepartments values(80,'Software trainee','Hebbal')
 insert into tblDepartments values(90,'PHP developer','Kolar')
 insert into tblDepartments values(10,'Sales','Shimoga')


 alter tblEmployee
 delete tblEmployee where employee=2926
 insert into tblEmployee values(2929,'Manu','DB',11/16/2023,'manu@excelindia.com','mandya',18000,10)

 update tblEmployee
 set DepartmentID=40
 where EmployeeName='Manu'
---------------------------------------------------------------------------------------------------------------------------
                                          Assignemt- 1
-----------------------------------------------------------------------------------------------------------------------------
 --1.Insert 10 records into each table. 

--2.Display Table information. 

select *
from tblEmployee;
select *
from tblDepartments;
--3. Display Employee’s name,  EmployeeId, departmentId  from tblEmployee 

select employee_name,employeeid,departmentid from tblemployee;
 
--4. Display Employee’s name,  EmployeeId, departmentId  of department 20 and 40.

select employee_name,employeeid,departmentid FROM tblemployee where departmentid in(20,40);
 
 
--5.Display information about all ‘ Trainees Software Engineer’  having salary less than 20000. 

select * from tblemployee where designation='Trainees Software Engineer' and salary <20000;
 
--6. Display information about all employees of department 30 having salary greater than 
--20000. 

select * from tblemployee where department_id=30 and salary >20000;
 
--7.Display list of employees who are not allocated with Department. 

select * from tblemployee where department_id = null;
 
--8.Display name and department of all ‘ Business Analysts’. 

select employeename from tblemployee where designation='Business Analysts';
 
--9.Display name, Designation and salary of all the employees of department 30 who earn 
--more than 20000 and less than 40000. 

select employeename,designation,salary
from tblemployee
where departmentid=30 and salary>20000 and salary <40000;

--10.Display unique job of tblEmployee.

select distinct designation from tblemployee;

--11.Display list of employees who earn more than 20000 every year of department 20 and 30. 

select employeename from tblemployee where salary*12>20000 and departmentid in(20,30)

--12.  List Designation, department no and Joined date in the format of Day, Month, and Year of 
--department 20. 

 select designation,departmentId,format(joindate,'YYYYMMDD')
FROM tblemplopyee
where departmentid=10;

select designation,departmentId,JOINDATE,DATEPART(DAY,JOINDATE),DATEPART(MONTH,JOINDATE),DATEPART(YEAR,JOINDATE)
FROM TBLEMPLOYEE
where departmentid=10;

--13.Display employees whose name starts with an vowel 

select employeename
from tblemployee
where substring(employeename,1,1) in ('a','e','i','o','u');

--14.Display employees whose name is less than 10 characters

select employeename from tblemployee where len(employeename)<10;

--15.Display employees who have ‘N’ in their name

select employeename
from tblemployee
where employeename like '%n%';
 
--16.Display the employees with more than three years of experience 

select employeename
from tblemployee
where datediff(YYYY,getdate(),joindate)>3;

--17.Display employees who joined on Monday 

select employeename
from tblemployee
where DAY(joindate)=2;

--18.Display employees who joined on 1st.

select *
from tblemployee
where day(joindate)=1;

--19.Display all Employees joined in January 

select * from tblemployee where month(joindate)=1;

--20.Display Employees with their Initials. 

select *
from tblemployee
where employeename like '% %'; --'% _ % _ %';

select employeeName
from tblemployee
where employeename like '% _% _%';

-----------------------------------------------------------------------------------------------------
     or like '% _ _'

21. alter table tblemployee
add bonus int

22. update tbldepartments
set departmentname='' 
23. update tblemployee 
set bonus=10000
where datediff(YYYY,joindate,getdate())>=2

24. select salary+ ISNULL(bonus,0) as totalsalary       or isnull---> coalesce
from tblemployee

(to rename column)
exec sp_rename 'tbldepartments.employeename','departmentname','column'
------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
 16.  select *
 from tblemployee
 where datediff (year,joindate,'2023-10-19')>3

 17. select *
 from tblemployee
 where datepart(DW,joindate)=2

 

 15 SELECT EMPLOYEENAME 
 FROM TBLEMPLOYEE
 WHERE EMPLOYEENAME LIKE '%N%'

 . SELECT *
 FROM TBLEMPLOYEE
 WHERE datepart(wk, joindate) =1

 19 SELECT *
 FROM TBLEMPLOYEE
 WHERE Month(joindate)=1

 14. select *
 from tblemployee
 where Employeename like '_________'

 15. select employeename
 from tblemployee
 where employeename like 'A%'

 
20. select employeename
from tblemployee
where employeename like '% %'; or like '% _ _'

21. alter table tblemployee
add bonus int

22. update tbldepartments
set departmentname=null
where departmentname='software engineer trainee'

23. update tblemployee 
set bonus=10000
where (dateadd(YYYY,joindate,getdate()))>=2

24.  select sum(salary)+bonus
from tblemployee
where salary=(select sum(salary)from 
group by employeename

update table tbldepartments
rename column employeename to departmentname

-------------------------------------------------------------------------------------------------------------------------
1. select getdate()
 
2. select datepart (month,getdate())

3. select employeename
from tblemployee
where employeename like '%t'

4. select EmployeeName
from tblEmployee
where EmployeeName like '%y%'

5. select employeename+location as 'emp loc', salary,salary*.5 as ' hike'
from tblemployee

3. CREATE TABLE STUDENT (
     STUDENTID INT UNIQUE,
	 STUDENTNAME VARCHAR(50) NOT NULL,
	 STUDENTLOCATION VARCHAR(50) NOT NULL,
	 AGE INT ,
	 CONSTRAINT CHK_AGE CHECK(AGE>20))

	 INSERT INTO STUDENT (STUDENTID,STUDENTNAME,STUDENTLOCATION,AGE)
	 VALUES(10,'SAGAR','MYSORE',22)

	 SELECT *
	 FROM STUDENT

23. create table emp(
      id int,
	  lastname varchar(50) not null,
	  firstname varchar(50) not null,
	  age int,
	  constraint pk_id primary key (id,lastname))

	 INSERT INTO emp (id,lastname,firstname,AGE)
	 VALUES(10,'sagar','chowdesh',22)
	 INSERT INTO emp (id,lastname,firstname,AGE)
	 VALUES(10,'nishanth','sagar',22)
	 
	 SELECT *
	 FROM emp

----------------------------------------------------------------------------------------------
	                                   Assignment -2
-----------------------------------------------------------------------------------------------------
 Create Table tblEmployee2
( 
EmployeeID int primary key,
EmployeeName varchar(50) not null,
Role varchar(50) not null,
Hiredate date default getdate(),
EmailID varchar(50) not null unique,
Salary int check(salary>15),
DepartmentID int Foreign  key references tblDepartment2(departmentID),
);


\insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0021,'Nishanth','DB','10/16/2023','nishanth@excelindia.com',18000,2926)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0023,'Ganesh','Back End','11/10/2018','ganesh@excelindia.com',50000,2928)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0024,'Anjali','HR','07/08/2025','anjali@excelindia.com',46000,2929)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0025,'Rajshaker','PHP Developer','02/14/2023','rajshaker@excelindia.com',65000,2930)
insert into tblEmployee2(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0022,'Pooja','Software Engineer Trainee','02/25/2021','pooja@excelindia.com',25000,2927)

SELECT*
from tblemployee2;
---------------------------------------------------------------------------------------------------------------
 
create table tblDepartment2
(
DepartmentID int primary key ,
DepartmentName varchar(50) not null,
Location varchar(50) not null
);

insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2926,'DB','mysore')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2927,'Software Engineer Trainee','tumkur')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2928,'Back End','shivamogga')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2929,'HR','managlore')
insert into tblDepartment2(Departmentid,Departmentname,Location)
values (2930,'PHP Developer','bangalore');

select *
from tblDepartments;

--------------------------------------------------------------------------------

create table tblSubject
(
SubjectID int primary key,
SubjectName Varchar(50) not null
);

insert into tblSubject(SubjectID,SubjectName)
values(101,'English')
insert into tblSubject(SubjectID,SubjectName)
values(102,'Kannada')
insert into tblSubject(SubjectID,SubjectName)
values(103,'Social')
insert into tblSubject(SubjectID,SubjectName)
values(104,'Science')
insert into tblSubject(SubjectID,SubjectName)
values(105,'Maths');

select *
from tblSubject;
---------------------------------------------------------------------------
create table tblStudent
(
StudentID int primary key,
StudentName Varchar(50) not null
);

insert into tblStudent(StudentID,StudentName)
values(001,'Sagar')
insert into tblStudent(StudentID,StudentName)
values(002,'Nishanth')
insert into tblStudent(StudentID,StudentName)
values(003,'Pooja')
insert into tblStudent(StudentID,StudentName)
values(004,'Anjali')
insert into tblStudent(StudentID,StudentName)
values(005,'Rajshaker')

select*
from tblStudent
---------------------------------------------------------------------------
create  table tblStudentSubMarks
(
StudentID int foreign key references tblStudent(StudentId),
SubjectID int Foreign Key references tblSubject(SubjectID),
Grade char(1) foreign key references tblGrade(grade)
Constraint primarykey_id primary key(studentid,subjectiD),
Marks decimal not null
)

insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(001,101,98.42)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(002,102,82.34)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(003,103,90.12)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(004,104,77.98)
insert into tblStudentSubMarks(StudentID,SubjectID,Marks)
values(005,105,65.55);

select*
from tblStudentSubMarks;

-----------------------------------------------------------------------------------------------------------------
                              25\10\23
------------------------------------------------------------------------------------------------------------------
1. select employeename, max(salary)
from tblemployee2
where salary=(select max(salary)
       from tblemployee2);

2. select designation, departmentID, count(*)
from tblemployee
group by designation ,departmentID
having designation,departmentID
order by count(*) desc;
-------------------------------------------------------------------------------------------------
                                       Assignment-3

====================================================================================================


--1.Display all the employees data by sorting the date of joining in the ascending order and 
--then by name in descending order. 
select *
from tblemployee
order by joindate asc,employeename desc;

--2.Modify the column name EmployeeName to Employee_FirstName and also add another 
column Employee_LastName 
exec sp_rename 'tblemployee.employeename','first_name','column'
alter  tblemployee
add lastname varchar(50);

--3.Write a query to change the table name to Employees. 
exec sp_rename 'tblemployee','tbldepartment';

--4.Write a query to update the salary of those employees whose location is ‘Mysore’ to 35000. 
update tblemployee
set salary=35000
where location='mysore';

--5.Write a query to disassociate all trainees from their department  
update tblemployee
set designation=' '
where designation ='trainee';

--6.Write a query which adds another column ‘Bonus’ to the table Employees where the bonus 
is equal to the salary multiplied by ten. Update the value only when the experience is two ;

--7.Display name and salary of top 5 salaried employees from Mysore and Hyderabad. 
select top 5 salary,employeename
from tblemployee
where location in ('mysore','hyderabad');

select * from tblemployee;

--8.Display name and salary of top 3 salaried employees(Include employees with ties) 
select top 3 with ties salary,employeename
from tblemployee
order by salary desc ;

--9.Display top 1% salaried employees from Noida and Bangalore 
select top 1 percent salary
from tblemployee
where location in ('noida','bangalore')
order by salary desc;

--10.Find average and total salary for each job. 
select avg(salary),sum(salary),designation
from tblemployee
group by designation ;

--11.Find highest salary of all departments. 
select distinct designation,employeename,max(salary)
from tblemployee
group by designation,employeename

--12. Find minimum salary of all departments. 
select distinct designation,employeename,min(salary)
from tblemployee
group by designation,employeename;
--13. Find difference in highest and lowest salary for all departments.
select max(salary)-min(salary),designation
from tblemployee
group by designation ;

--14.  Find average and total salary for trainees 
select avg(salary),sum(salary)
from tblemployee
where designation='trainess';

--15.  Count total different jobs held by dept no 30 
select count(distinct designation)
from tblemployee
where departmentid=30;

--16. Find highest and lowest salary for non-managerial job 
select max(salary),min(salary)
from tblemployee
where designation not like'%manager%';

--17.Count employees and  average annual salary of each department.
select count(employee),avg(salary)*12,designation
from tblemployee
group by designation;

--18.Display the number of employees sharing same joining date.
select count(employee)
from tblemployee
group by joindate
having count(employee)>1;

--19.Display number of employees with same experience 
select count(employee)
from tblemployee;


--20.Display total number of employees in each department with same salary
select designation,count(employee),salary
from tblemployee
group by designation,salary;

--21.Display the  number of Employees above 35 years in each department 
select count(employee),designation
from tblemployee
where datediff(YYYY,getdate(),joindate)>35
group by designation;

=====================================================================================================================
                               ASSIGNMENT 4- JOINS   26/10/23
============================================================================================================================
CREATE TABLE Salesmen(
Snum int primary key,
Sname varchar(20),
city varchar(20),
Comission decimal(6,2));

select*
from salesmen;

CREATE TABLE orders(
Onum int primary key,
OAmt decimal(7,2),
Odate datetime ,
Cnum int references customers(cnum),
Snum int references salesmen(Snum));

select *
from orders;

select *
from Customers;

Create table customers(
Cnum int primary key,
Cnam varchar(20),
City varchar(20),
Rating int,
Snum int references salesmen(Snum));

--1.Display the following information about each order.
--a.Order No, Customer Name, Order Amount, Order Date 

select onum,cnam,oamt,odate
from orders join customers
on orders.cnum=customers.cnum
group by onum,cnam,oamt,odate;
--2.Display customers associated with each Salesman

select count(cnum),sname
from customers c join salesmen s on c.snum=s.snum
group by sname;

--3.Display following information about each order: 
--a.OrderNo , Customer Name, Salesman Name, Order Amount, Order 
--Date 

select sname,cnam,onum,oamt,odate
from salesmen s join customers c on s.snum=c.snum
join orders o on o.cnum=c.cnum;

--4.Display salesman with their order details in the decreasing order 
--value(Include salesman who has not captured any order) 
--a.Salesman name, Customer name,Ordervalue

select sname,cnam,oamt
from salesmen s left join orders o on s.snum=o.snum left join customers c on c.cnum=o.cnum
order by oamt desc;

--5.Display customers with their orders in the ascending order of date(Include 
--customers who hasn’t booked any order) 
--a.Customer Name, Order Value Order date 

select cnam,oamt,odate
from customers c left join orders o on c.cnum=o.cnum
order by odate asc;

--6.List the number of customers handled by each salesman.(Sales man 
--name, Number of Customers handled)

select sname,count(cnum)
from salesmen s join customers c on s.snum=c.snum
group by sname;

--7.List the customers(Name of the customer) who have placed more than 
--one order 

select cnam,count(cnum)
from customers
group by cnam
having count(cnum)>1;

--8.Display sum of orders from each city from each customer and salesman 

select sum(onum),c.city,c.cnam,s.sname
from salesmen s join customers c on s.snum=c.snum
join orders o on o.cnum=c.cnum
group by c.city,c.cnam,s.sname;


=============================================================================
1. Select EmployeeName,DepartmentName
   From tblEmployee1 inner join tblDepartment1
   ON DepartmentID.tblEmployee1=DepartmentID.tblDepartment1

   alter table tblemployee
   add ManagerID int null

   select *
   from tblemployee

======================================================================================
                             self join
=========================

1. SELECT E1.employeename,E2.employeename as 'manager'
   from tblemployee E1 left JOIN tblEmployee E2
   ON E1.managerID=E2.employee
   
 ----->  NO OF EMPLOYEE REPORTING TO MANAGER

2. SELECT E2.managerID,count(E1.employee)
   from tblemployee E1 RIGHT JOIN tblEmployee E2
   ON E1.managerID=E2.employee   
   group by E2.Managerid
                              
   -------------- at least onE
3. SELECT E2.managerID,count(E1.employee)
   from tblemployee E1 INNER JOIN tblEmployee E2
   ON E1.managerID=E2.employee   
   group by E2.Managerid
   having count(e1.employee)>0



   ON E1.employee=E2.managerID

===================================================================================================================
                                         27/10/23 Toys ASSIGNMENT-5
==========================================================================================================================
Create drop table tblCustomers(
CustID int Primary Key,                       ----------------->C
CustName Varchar(10) NOT NULL,
CustType Char(1));

select *
from tblcustomers;

Create Table tblCategory(     ----------------c1
CID char(4) primary key,
CName varchar(10));

select *
from tblcategory;

Create Table tblToys(            ------------------>t1
ToyID char(5) primary key ,
ToyName Varchar(50) unique not null,
CID char(4) references tblcategory(CID) not null,
Price int not null,
Stock int not null);
-
select *
from tbltoys;

Create table tblTransaction(          ----------->T
TxnID int primary key,
CustID int references tblcustomers(custID),
ToyID char(5) references tblToys (toyId),
Quantity int,
TxnCost int);

select *
from tbltransaction;

--1.Display CustName and total transaction cost as TotalPurchase for those customers 
--whose total transaction cost is greater than 1000. 

select C.CustName , Sum(T.TxnCost) AS 'TotalPurchase'
from tblCustomers C inner join tblTransaction T
ON C.CustID=T.CustID 
group by C.CustName
having count(T.TxnCost)>1000;

--2.List all the toyid, total quantity purchased as 'total quantity' irrespective of the 
--customer. Toys that have not been sold should also appear in the result with total units as 
--0 

 Select T1.ToyID, Count(T.Quantity) AS 'Total Quantity' ----> coalesce (count(T1.quantity),0)
from tblToys T1 inner join tblTransaction T
ON T1.ToyID=T.ToyID
group by T1.ToyID;

--3.The CEO of Toys corner wants to know which toy has the highest total Quantity sold. 
--Display CName, ToyName, total Quantity sold of this toy.

select TOP 1 C1.CName, T1.ToyName,sum(T.Quantity) 
from tblTransaction T  inner join tbltoys T1
On T.ToyID=T1.ToyID inner join tblcategory C1
ON  T1.CID=C1.CID
group by T1.ToyName,C1.CName
order by sum(T.Quantity) desc;





=========================================================================================================================
                                     Hospital Assignment
-----------------------------------------------------------------------------------------

Create Table tblPatient(
PatientID  char(5) primary key,
Pname varchar(50),
City varchar(50));

Select *
from tblPatient;

Create table tblDoctor(
DoctorID char(5) primary key,
Dname varchar(50),
Dept varchar(50),
salary int);

select *
from tbldoctor;

Create Table tblConsultation(
ConsultationID int unique,
PatientID char(5) references tblPatient(patientID),
DoctorID char(5) references tblDoctor(doctorID),
Fee int);

 select*
from tblconsultation;


-- 1. name for the identified consultation details.


SELECT tblPatient.pname AS Patient_Name,tbldoctor.dname AS Doctor_Name
FROM tblPatient
inner JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
inner JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
WHERE tblPatient.pname LIKE '%e%' AND tbldoctor.dept = 'Cardiology';


-- 2 Identify the doctors who have provided consultation to patients from the cities ‘Boston’
--and ‘Chicago’. Write a SQL query to display department and number of patients as
--PATIENTS who consulted the identified doctor(s).


SELECT tbldoctor.doctorid,tbldoctor.dname AS Doctor_Name,tblPatient.city
FROM tblPatient
JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
WHERE tblPatient.city IN ('Boston','Chicago');


-- 3 Identify the cardiologist(s) who have provided consultation to more than one patient.
--Write a SQL query to display doctor’s id and doctor’s name for the identified
--cardiologists.


SELECT tbldoctor.doctorid,tbldoctor.dname AS Doctor_Name
FROM tblPatient
JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
WHERE tbldoctor.dept = 'Cardiology'
GROUP BY tbldoctor.doctorid,tbldoctor.dname
HAVING COUNT(tbldoctor.doctorid) >1;



-- 4 Write a SQL query to combine the results of the following two reports into a single report.
--The query result should NOT contain duplicate records.
--Report 1 – Display doctor’s id of all cardiologists who have been consulted by
--patients.
--Report 2 – Display doctor’s id of all doctors whose total consultation fee charged
--in the portal is more than INR 800.


SELECT tbldoctor.doctorid
FROM tblPatient
JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
GROUP BY tbldoctor.doctorid,tbldoctor.dname
HAVING COUNT(tbldoctor.doctorid) >=1
UNION
SELECT tbldoctor.doctorid
FROM tblPatient
JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
WHERE tblconsultation.fee  > 800;




--5 Write a SQL query to combine the results of the following two reports into a single report.
--The query result should NOT contain duplicate records.
--Report 1 – Display patient’s id belonging to ‘New York’ city who have consulted
--with the doctor(s) through the portal.
--Report 2 – Display patient’s id who have consulted with doctors other than
--cardiologists and have paid a total consultation fee less than INR 1000.



SELECT tblPatient.patientid
FROM tblPatient
JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
WHERE tblPatient.city = 'New York'
UNION
SELECT tblPatient.patientid
FROM tblPatient
JOIN tblconsultation
ON tblconsultation.patientid = tblPatient.patientid
JOIN tbldoctor
on tblconsultation.doctorid = tbldoctor.doctorid
WHERE tblconsultation.fee  < 1000 AND tbldoctor.dept != 'cardiologist';

-----------------------------------------------------------------------------------------------------------------------------

--------------> display 4th Maximum salary
1. Select max(salary) As 'maxsalary'
from tblemployee
where salary=(select max(salary)
from tblemployee
where salary<(select max(salary)
from tblemployee
where salary<(select max(salary)
from tblemployee
where salary<(select max(salary)
from tblemployee))));


===================================================================================================================================
                         Banking application  Assignment 30/10/23
==================================================================================================================================
--- Create the CustomerDetails table

CREATE TABLE CustomerDetails (
    AccNo INT PRIMARY KEY,
    CustName VARCHAR(50),
    Address VARCHAR(50),
    AccType INT,
    FOREIGN KEY (AccType) REFERENCES AccountType (AccType)
);

-- Create the AccountType table

CREATE TABLE AccountType (
    AccType INT PRIMARY KEY,
    AccountName VARCHAR(50)
);

-- Create the TransactionType table

CREATE TABLE TransactionType (
    TransType INT PRIMARY KEY,
    TransName VARCHAR(50)
);

-- Create the AccountTransaction table

CREATE TABLE AccountTransaction (
    Tid INT PRIMARY KEY,
    AccNo INT,
    Amount MONEY,
    DateOfTrans DATETIME,
    TransType INT,
    FOREIGN KEY (AccNo) REFERENCES CustomerDetails (AccNo),
    FOREIGN KEY (TransType) REFERENCES TransactionType (TransType)
);

INSERT INTO AccountType (AccType, AccountName)
VALUES
    (1, 'Savings Account'),
    (2, 'Checking Account'),
    (3, 'Fixed Deposit'),
    (4, 'Credit Card'),
    (5, 'Loan Account');


INSERT INTO TransactionType (TransType, TransName)
VALUES
    (1, 'Deposit'),
    (2, 'Withdrawal'),
    (3, 'Transfer'),
    (4, 'Payment'),
    (5, 'Purchase');


*INSERT INTO CustomerDetails (AccNo, CustName, Address, AccType)
VALUES
    (101, 'John Smith', '123 Main St', 1),  
    (102, 'Jane Doe', '456 Elm St', 2),     
    (103, 'Robert Johnson', '789 Oak St', 1),  
    (104, 'Alice Brown', '101 Pine St', 3),   
    (105, 'Michael Davis', '222 Cedar St', 4);


INSERT INTO AccountTransaction (Tid, AccNo, Amount, DateOfTrans, TransType)
VALUES
    (1, 101, 100.00, '2023-10-30 09:00:00', 1), 
    (2, 102, 50.00, '2023-10-30 10:15:00', 2),  
    (3, 103, 200.00, '2023-10-30 11:30:00', 1), 
    (4, 104, 1000.00, '2023-10-30 13:45:00', 4), 
    (5, 105, 500.00, '2023-10-30 15:00:00', 5); 

--1.List the Customer with transaction details who has done third lowest 
--transaction

SELECT Top 1 CustomerDetails.CustName,AccountTransaction.Amount
FROM CustomerDetails
INNER JOIN AccountTransaction
ON AccountTransaction.AccNo = CustomerDetails.AccNo
WHERE AccountTransaction.Amount NOT IN (SELECT TOP 2 AccountTransaction.Amount
FROM AccountTransaction
ORDER BY AccountTransaction.Amount Asc)
ORDER BY AccountTransaction.Amount DESC;



--2.List the customers who has done more transactions than average number of 
--transaction 

select count([tid])[NumofTrans]
from  [AccountTransaction]
group by [AccNo]) As 
----------------------------------------------
SELECT AccountTransaction.AccNo,COUNT(AccountTransaction.AccNo) 
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo
HAVING COUNT(AccountTransaction.AccNo) >(SELECT AVG(accountTransaction.accno)
FROM (SELECT COUNT(AccountTransaction.Tid)
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo ))AS TransactionCount


--3.List the total transactions under each account type. 

SELECT AccountTransaction.AccNo,COUNT(AccountTransaction.Tid) AS NUM_OF_TRANS
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo;

--4.List the total amount of transaction under each account type 
SELECT AccountTransaction.AccNo,SUM(AccountTransaction.Amount) AS NUM_OF_TRANS
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo;


--5. List the total tranctions along with the total amount on a Sunday. 

SELECT Tid,COUNT(Tid),SUM(AccountTransaction.Amount) AS NUM_OF_TRANS
FROM AccountTransaction
WHERE DATENAME(DW,DateOfTrans) = 'sunday';

--6. List the name, address, account type and total deposit from each customer
--account. 

SELECT CustomerDetails.CustName,CustomerDetails.address,AccountType.ACCOUNTName,SUM(AccountTransaction.Amount) AS total_deposit
FROM CustomerDetails
INNER JOIN AccountType
ON AccountType.AccType = CustomerDetails.AccType
INNER JOIN AccountTransaction
ON AccountTransaction.AccNo = CustomerDetails.AccNo
GROUP BY CustomerDetails.CustName,CustomerDetails.address,AccountType.ACCOUNTName;


--7. List the total amount of transactions of Mysore customers.


SELECT SUM(AccountTransaction.Amount) AS Total_Amt
FROM AccountTransaction
INNER JOIN CustomerDetails
ON CustomerDetails.AccNo = AccountTransaction.AccNo
WHERE CustomerDetails.address = 'Mysore';



--8.List the name,account type and the number of transactions performed by each customer


SELECT CustomerDetails.CustName,AccountType.ACCOUNTName,COUNT(AccountTransaction.Tid) AS NUM_OF_Transaction
FROM CustomerDetails
INNER JOIN AccountTransaction
ON CustomerDetails.AccNo = AccountTransaction.AccNo
INNER JOIN AccountType
ON CustomerDetails.AccType = AccountType.AccType
GROUP BY CustomerDetails.CustName,AccountType.ACCOUNTName;


--9. List the amount of transaction from each Location. 

SELECT CustomerDetails.address,COUNT(AccountTransaction.Tid)
FROM AccountTransaction
INNER JOIN CustomerDetails
ON CustomerDetails.AccNo = AccountTransaction.AccNo
GROUP BY CustomerDetails.address;


---10. Find out the number of customers  Under Each Account Type 

SELECT AccountType.ACCOUNTName,COUNT(AccountType.AccType) AS Number_Of_Customer
FROM AccountType
GROUP BY AccountType.ACCOUNTName;

==============================================================================================================================
--1 List the Customer with transaction details who has done third lowest  transaction
select   c.CustName ,at.Amount
from CustomerDetails c  inner join Account_Transaction at
on at.AccNo=c.AccNo
      where Amount=(select MIN(amount)
                    from Account_Transaction
                    where Amount>
					              (select MIN(amount)
                                   from Account_Transaction
                                   where Amount>
                                               (select MIN(amount)
                                                from Account_Transaction)));

--2List the customers who has done more transactions than average number of  transaction 

select * from Account_Transaction;
select * from TransactionType;
select * from CustomerDetails;
select * from AccountType;

SELECT CD.CustName, COUNT(AT.Tid) AS NumberOfTransactions
FROM CustomerDetails CD
JOIN Account_Transaction AT 
ON CD.AccNo = AT.AccNo
GROUP BY CD.CustName
HAVING 
     COUNT(AT.Tid) > (SELECT AVG(TransactionCount)
                      FROM 
                      (SELECT COUNT(Tid) AS TransactionCount 
	                  FROM Account_Transaction GROUP BY AccNo) 
	                                         AS AverageTransactions);



--3-List the total transactions under each account type.



SELECT AT.AccountName, COUNT(AT1.Tid) AS TotalTransactions
FROM AccountType AT LEFT JOIN CustomerDetails CD
ON AT.AccType = CD.AccType
                         LEFT JOIN Account_Transaction AT1 
						 ON CD.AccNo = AT1.AccNo
                         GROUP BY AT.AccountName;

SELECT AT.AccountName, COUNT(AT1.Tid) AS TotalTransactions
FROM AccountType AT LEFT JOIN CustomerDetails CD
ON AT.AccType = CD.AccType
                         LEFT JOIN Account_Transaction AT1 
						 ON CD.AccNo = AT1.AccNo
                         GROUP BY AT.AccountName;


--4 List the total amount of transaction under each account type

select at.AccType,at.AccountName,SUM(txn.amount) as sum
from CustomerDetails c inner join AccountType at
on c.AccType=at.AccType inner join 
Account_Transaction txn
on txn.AccNo=c.AccNo
group by at.AccType,at.AccountName;


--5 List the name, address, account type 
--and total deposit from each customer account.

select c.CustName,c.Address,at.AccountName,ty.TransType,SUM(tr.amount) as sum_deposit
from CustomerDetails c inner join AccountType at
on c.AccType=at.AccType inner join  Account_Transaction tr
on tr.AccNo=c.AccNo inner join TransactionType ty
on ty.TransType=tr.TransType 
where ty.TransName='Deposit'
group by at.AccountName,at.AccountName,ty.TransType,c.CustName,c.Address;


select * from Account_Transaction;
select * from TransactionType;
select * from CustomerDetails;
select * from AccountType;

--6 List the total tranctions along with the total amount on a Sunday.
SELECT COUNT(AT1.Tid) AS TotalTransactions,SUM(AT1.Tid) AS sumOfTransactions
FROM AccountType AT LEFT JOIN CustomerDetails CD
ON AT.AccType = CD.AccType
                         LEFT JOIN Account_Transaction AT1 
						 ON CD.AccNo = AT1.AccNo
						 where DATENAME(dw,dateOfTrans)='sunday'
                         GROUP BY AT.AccountName;

--7 List the total amount of transactions of Mysore customers.

select SUM(at.amount) as sum 
from CustomerDetails c inner join accountTransaction at
on c.AccNo=at.AccNo
where c.Address ='Mysore';

--8 List the name,account type and the number of transactions performed by each customer.

SELECT CD.CustName,AT.AccountName ,COUNT(AT1.Tid) AS TotalTransactions
FROM AccountType AT LEFT JOIN CustomerDetails CD
ON AT.AccType = CD.AccType
                         LEFT JOIN AccountTransaction AT1 
						 ON CD.AccNo = AT1.AccNo
                         GROUP BY AT.AccountName,CD.CustName;

--9 List the amount of transaction from each Location.

  select c.Address,count(txn.Tid) as count
  from CustomerDetails c inner join AccountType at
  on c.AccType=at.AccType inner join 
  Account_Transaction txn
  on txn.AccNo=c.AccNo
  group by c.Address;


select c.Address,sum(txn.Amount) as sum
from CustomerDetails c inner join AccountType at
on c.AccType=at.AccType inner join 
Account_Transaction txn
on txn.AccNo=c.AccNo
group by c.Address;

--10 Find out the number of customers  Under Each Account Type

select c.AccType,at.AccountName,count(txn.Tid) as count
from CustomerDetails c inner join AccountType at
on c.AccType=at.AccType inner join 
Account_Transaction txn
on txn.AccNo=c.AccNo
group by c.AccType,at.AccountName;


----------------------------------------------------------------------------------------------------------
	                                salesmen Assignment
================================================================================================================

-- Create the Salesman table

CREATE TABLE Salesman (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50),
    Location VARCHAR(50);
);

-- Create the Product table

CREATE TABLE Product (
    Prodid INT PRIMARY KEY,
    Pdesc VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    Discount DECIMAL(5, 2)
);

-- Create the Sale table

CREATE TABLE Sale (
    Saleid INT PRIMARY KEY,
    Sid INT,
    Sldate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (Sid) REFERENCES Salesman(Sid)
);

-- Create the Saledetail table

CREATE TABLE Saledetail (
    Saleid INT,
    Prodid INT,
    Quantity INT,
    FOREIGN KEY (Saleid) REFERENCES Sale(Saleid),
    FOREIGN KEY (Prodid) REFERENCES Product(Prodid)
);


INSERT INTO Salesman (Sid, Sname, Location)
VALUES
    (1, 'John Smith', 'New York'),
    (2, 'Jane Doe', 'Los Angeles'),
    (3, 'Robert Johnson', 'Chicago'),
    (4, 'Alice Brown', 'Houston'),
    (5, 'Michael Davis', 'Miami');


INSERT INTO Product (Prodid, Pdesc, Price, Category, Discount)
VALUES
    (101, 'Laptop', 800.00, 'Electronics', 0.10),
    (102, 'Smartphone', 500.00, 'Electronics', 0.05),
    (103, 'Desk Chair', 100.00, 'Furniture', 0.15),
    (104, 'Coffee Maker', 50.00, 'Appliances', 0.08),
    (105, 'T-shirt', 20.00, 'Clothing', 0.20);


INSERT INTO Sale (Saleid, Sid, Sldate, Amount)
VALUES
    (1001, 1, '2023-10-30', 720.00),
    (1002, 2, '2023-10-30', 475.00),
    (1003, 3, '2023-10-30', 95.00),
    (1004, 4, '2023-10-30', 42.00),
    (1005, 5, '2023-10-30', 15.00);

INSERT INTO Saledetail (Saleid, Prodid, Quantity)
VALUES
    (1001, 101, 2),
    (1002, 102, 1),
    (1003, 103, 4),
    (1004, 104, 3),
    (1005, 105, 5);

	select*
	from salesman

	select*
	from product
	select*
	from sale

	select*
	from saledetail


---1  Display the sale id and date for most recent sale. 

	select sid, sldate from Sale
	where sldate=(select max(Sldate) from Sale );


---2  Display the names of salesmen who have made at least 2 sales. 
SELECT Sname
FROM Salesman
WHERE Sid IN (
    SELECT Sid
    FROM Sale
    GROUP BY Sid
    HAVING COUNT(*) >= 2);

3. select top 1 with ties prodid
from saledetail
group by prodid
order by sum(quantity);


---- 4.Display SId, SName and Location of those salesmen who have total sales 
---amount greater than average sales amount of all the sales made. Amount can 
----be calculated from Price and Discount of Product and Quantity sold. 

select m.Sid,m.Sname,m.Location
From Salesman s
where Sid in (Select Sid
              from Sale
			  group by location
			  having sum((Price-discount)*quantity)>(select Avg (totalSales)
			                                            from (select sum(p.price),s.location
														from sale s inner join salesman M
														ON s.sid=m.sid
														group by m.location));
	

	

	select * from sale;
	select * from saledetail;
	select * from salesman;
	select * from product;

	
--Corelated Subquery 
--5.Display the product id, category, description and price for those products whose 
--price is maximum in each category. 


SELECT p.Prodid, p.Category, p.Pdesc, p.Price
FROM Product p
WHERE p.Price = (
    SELECT MAX(p2.Price)
    FROM Product p2
    WHERE p2.Category = p.Category
);


---6.Display the names of salesmen who have not made any sales. 

SELECT Sname
FROM Salesman
WHERE Sid NOT IN (
    SELECT DISTINCT Sid
    FROM Sale
);

--7.Display the names of salesmen who have made at least 1 sale in the month of 
---Jun 2015. 

SELECT DISTINCT Sname
FROM Salesman s
JOIN Sale sa ON s.Sid = sa.Sid
WHERE sa.Sldate >= '2015-06-01' AND sa.Sldate <='2015-06-30';


======================================================================================================================
---------------------->                            Views
=========================================================
Create Table Emp
( 
EmployeeID int primary key,
EmployeeName varchar(50) not null,
Role varchar(50) not null,
Hiredate date default getdate(),
EmailID varchar(50) not null unique,
Salary int check(salary>15),
DepartmentID int Foreign  key references Dept(departmentID),
);


\insert into Emp(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0021,'Nishanth','DB','10/16/2023','nishanth@excelindia.com',18000,2926)
insert into Emp(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0023,'Ganesh','Back End','11/10/2018','ganesh@excelindia.com',50000,2928)
insert into Emp(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0024,'Anjali','HR','07/08/2025','anjali@excelindia.com',46000,2929)
insert into Emp(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0025,'Rajshaker','PHP Developer','02/14/2023','rajshaker@excelindia.com',65000,2930)
insert into Emp(EmployeeID,EmployeeName,Role,Hiredate,EmailID,Salary,DepartmentID)
values(0022,'Pooja','Software Engineer Trainee','02/25/2021','pooja@excelindia.com',25000,2927);

SELECT*
from emp;
---------------------------------------------------------------------------------------------------------------
 
create table Dept
(
DepartmentID int primary key ,
DepartmentName varchar(50) not null,
Location varchar(50) not null
);

insert into Dept(Departmentid,Departmentname,Location)
values (2926,'DB','mysore')
insert into Dept(Departmentid,Departmentname,Location)
values (2927,'Software Engineer Trainee','tumkur')
insert into Dept(Departmentid,Departmentname,Location)
values (2928,'Back End','shivamogga')
insert into Dept(Departmentid,Departmentname,Location)
values (2929,'HR','managlore')
insert into Dept(Departmentid,Departmentname,Location)
values (2930,'PHP Developer','bangalore');

select *
from Dept;

1. Create view view_Emp
AS
select *
from emp

select *
from view_emp

Create view view_dept
AS
select *
from dept

select *
from view_dept


2. Create view view_ex2
As
select e.employeeID
from emp e inner join dept d
on e.departmentID=d.departmentID
group by e.employeeid

--to get output in textformat

sp_helptext view_ex2

3. alter table emp
add Gender char(10);

 sp_refreshview view_ex2

4. Create view view_ex4
with SCHEMABINDING
AS
SELECT e.EmployeeID,e.Employeename,e.Salary,d.DepartmentName
from dbo.emp e inner join dbo.dept d
on E.departmentId=D.departmentid

5. Create view view_ex5
with Encryption
as
select e.employeeid,e.employeename,e.salary,d.departmentID
from emp  e inner join dept d
ON e.departmentID=d.departmentID

---------------------------------------------------------------------------
create table tblSubject
(
SubjectID int primary key,
SubjectName Varchar(50) not null
)

insert into tblSubject(SubjectID,SubjectName)
values(101,'English')
insert into tblSubject(SubjectID,SubjectName)
values(102,'Kannada')
insert into tblSubject(SubjectID,SubjectName)
values(103,'Social')
insert into tblSubject(SubjectID,SubjectName)
values(104,'Science')
insert into tblSubject(SubjectID,SubjectName)
values(105,'Maths')

select *
from tblSubject
---------------------------------------------------------------------------
create table tblStudent
(
StudentID int primary key,
StudentName Varchar(50) not null
)

insert into tblStudent(StudentID,StudentName)
values(001,'Sagar')
insert into tblStudent(StudentID,StudentName)
values(002,'Nishanth')
insert into tblStudent(StudentID,StudentName)
values(003,'Pooja')
insert into tblStudent(StudentID,StudentName)
values(004,'Anjali')
insert into tblStudent(StudentID,StudentName)
values(005,'Rajshaker')

select*
from tblStudent
---------------------------------------------------------------------------
create  table tblStudentSubMarks
(
StudentID int foreign key references tblStudent(StudentId),
SubjectID int Foreign Key references tblSubject(SubjectID),
Grade char(1) foreign key references tblGrade(grade)
Constraint primarykey_id primary key(studentid,subjectiD),
Marks decimal not null
)

insert into tblStudentSubMarks(StudentID,SubjectID,Marks,grade)
values(001,101,98.42,'A')
insert into tblStudentSubMarks(StudentID,SubjectID,Marks,grade)
values(002,102,82.34,'B')
insert into tblStudentSubMarks(StudentID,SubjectID,Marks,grade)
values(003,103,90.12,'c')
insert into tblStudentSubMarks(StudentID,SubjectID,Marks,grade)
values(004,104,77.98,'D')
insert into tblStudentSubMarks(StudentID,SubjectID,Marks,grade)
values(005,105,65.55,'F')

select*
from tblStudentSubMarks

Create table tblGrade(
lbound int,
Ubound int,
Grade char(1) primary key)

insert into tblgrade(lbound,ubound,grade)
values(90,100,'A'),
      (80,89,'B'),
	  (70,79,'c'),
	  (60,69,'D'),
	  (0,59,'F');

Select s.StudentName,su.subjectName,ss.Marks,g.grade
from tblstudentsubmarks ss inner join tblstudent s
ON s.studentId=s.studentID inner join tblstudentsubmarks ss
ON ss.grade=g.grade inner join tblgrade G
ON ss.marks between g.lbound and g.ubound

---------------------------------------------------------------------------------------------------------------------
                                              02/11/2023
====================================================================================================
DELETE  tblTransactionDemo
Begin Reansaction T1
 insert into tblTransactiondemo default values
 insert into tbltransationDemo default values
 Select 'before rollbacl'
 select * from tblTransactionDemo;
 Rollbacl tran T1 
 select 'after rollback'
 select * from tblTransactiondemo;
 Begin 
 




 ------------------------------------------------------------------------------------------------------------------------
                              T-SQL  03/11/2023
===========================================================================================

1. Declare @Count int
SET @count=1
while @count<20
Begin
print 'Aquire Skills'
SET @count=@count+1
If @count>10
Break
else
Continue
end;

2. first 100 even numbers 
declare @num int 
set @num=1
while @num<=100
begin 
if @num%2=0
begin
print @num
end 
set @num=@num+1
end;

3. even or odd number
declare @num int 
set @num=20
begin 
if(@num%2=0)
print 'is even number'
else
print 'is odd number'
set @num=@num+1
end;

4. fibonaacci series first 50 numbers
declare @num int=0 @num1 int=1
declare @count int=0
print @num
print @num1
begin
while (@count<=50);

4. select employeename,location
case
when ocation in (Noida,Pune) then 'tier1 city'
else 'tier2 city'
end As tier city from tblemplyee;

5.select EmployeeName
case
when salary>1000 then 'category A'
when salary<100 and salary >=50000 then 'category B'
else 'category c'
end as category from tblemployee;

6. Declare @Month varchar(25)
select @month =datename(Month,getdate())
if @month ='november'
select employeeName,salary,salary+1000 as SalaryWithBonus
from tblEmployee
else
Begin
Print 'No Bonus i this Month'
Print @month
End;
==========================================================================
                                       T-SQL Assignment
----------------------------------------------------------------------------------
2. Create table tblstudentdetails(
StudentID int Primary Key,
StudentName varchar(50) not null,
DateOfBirth date,
Gender char(1));

Create Table Grade(
StudentID int references tblStudentdetails(StudentId),
MarksObtained int ,
Grade char(1));


3. select s.StudentName,s.StudentiD,g.Marksobtained,
case
When MarksObtained >=90 then 'A'
when MarksObtained>=80 then 'B'
when MarksObtained>=70 then 'c'
when marksObtained >=60 then 'D'
when marksObtained >=50 then 'f'
else 'failed'
end as Grade
from Grade G,tblstudentdetails S
 
 4. select EmployeeName, JoinDate,
 case
 when DatePart(Month,Joindate)=1 then 'january'
 when DatePart(Month,Joindate)=2 then 'february'
 when DatePart(Month,Joindate)=3 then 'march'
 when DatePart(Month,Joindate)=4 then 'april'
 when DatePart(Month,Joindate)=5 then 'may'
 when DatePart(Month,Joindate)=6 then 'june'
 when DatePart(Month,Joindate)=7 then 'july'
 when DatePart(Month,Joindate)=8 then 'august'
 when DatePart(Month,Joindate)=9 then 'september'
 when DatePart(Month,Joindate)=10 then 'october'
 when DatePart(Month,Joindate)=11 then 'november'
 when DatePart(Month,Joindate)=12 then 'december'
END AS joindate
from tblemployee

5. DECLARE @NUM INT =0
DECLARE @NUM INT =1001
WHILE

6. Update tblemployee
SET Bonus =
CASE
WHEN DATEDIFF(YY,GETDATE(),JOINDATE)>10 then salary
WHEN DATEDIFF(YY,GETDATE(),JOINDATE) BETWEEN 5 AND 10 THEN 0.5*SALARY
ELSE 5000
END

 SELECT SALARY, BONUS
 FROM TBLEMPLOYEE


=========================================================================================================
                    ,,,,,,,,,Exception Handling   06/11/2023
           ===================================================


declare 
	@cid int=101, 
	@lstock int=0,
	@toyID varchar(5)='T1001',
	@quantity int =3

declare 
	@IsCus INT=-1;

SELECT
	@IsCus=[CustID]
FROM
	[tblCustomers]
WHERE
	[custID] = @cid;

IF @IsCus=-1
BEGIN
	PRINT 'Invalid Customer'
	GOTO EOP
END

--TOY CONFIRMATION
declare 
	@IsToy VARCHAR='';

SELECT
	@IsToy=[ToyID]
FROM
	[tblToys]
WHERE
	[ToyID] = @toyID;

IF @IsToy=''
BEGIN
	PRINT 'Invalid Toy'
	GOTO EOP
END

-- CHECK IF STOCK AVAILABLE
declare 
	@StockAvailable int;

SELECT
	@StockAvailable=[Stock]
FROM
	[tblToys]
WHERE
	[ToyID] = @toyID;

IF @StockAvailable<@quantity
BEGIN
	PRINT 'OUT OF STOCK !!'
	GOTO EOP
END

-- START THE TRANSACTION
--	UPDATE THE STIOCKS as STOCK = STOCK - QUANTITY
--	ADD the TRANSACTION RECORD TO TRANSACTION TABLE

BEGIN TRANSACTION [UpdateRecords]
	BEGIN
	update tbltoys            
		set stock=stock-@Quantity
		where toyid='t1001'
	END 
	--BEGIN CATCH
--		ROLLBACK [UpdateRecords]
--	END CATCH
--COMMIT TRANSACTION [UpdateRecords]

--select 
--	@lstock= stock
--from 
--	tbltoys
--WHERE 
--	ToyId=@toyID
--print @lstock

EOP:
	PRINT 'Thank you for visiting'


--IF @cID IS NULL OR @TOyID IS NULL
--    BEGIN
--        PRINT 'Customer and Toy does not exist'
--    END
--	Else 
--		begin 
--			IF @lStock IS NULL OR @lStock < 1
--			BEGIN
--            PRINT 'Insufficient stock ';
--			END
--		EnD
--		 DECLARE @Stock INT
--		 SELECT @Stock=@lStock
--		 FROM tblToys

--		 UPDATE tblTOYS
--		 SET 
		  
--Declaring toy
Declare @toyid varchar(20)
declare @cid varchar(20)
Declare @Quantity int
Declare @Stock int
Declare @txnid int=1014
Declare @custid int=102
Declare @txncost int 
Declare @price int =500
--setting value for a toyid
	set @toyid=(select toyid from tbltoys toyID='t1001')
--setting value for quantity
	set @Quantity=5
	print concat(@toyid,'is bought by the customer')
	begin
		
--update toys table
		update toys                       
		set stock=stock-@Quantity
		where toyid='t1001'

--set txncost =price * quantity
		set @txncost=@price*@Quantity
--after updating the toys table
--inserting the values that we got while execution
		insert into transactions values(@txnid,@custid,@toyid,@Quantity,@txncost)
		
		set @Stock=(select stock from toys where toyid ='t1001')

		print concat('current stock is' ,@Stock)
		print 'toys table updated'
		select * from tbltoys
		print 'transactions table got inserted'
		select * from tbltransaction      
		end

------------------------------------------------------------------------------------------
                            STORE PROCEDURE
==============================================================
Create Procedure uspEx1
AS
BEGIN
SELECT * FROM TBLEMP  LOYEE
SELECT * FROM TBLDEPARTMENT
END

for execution 
1. uspEX1
2. execute uspEX1
3. exec uspEX1

Alter Procedure uspEx1
AS
BEGIN
SELECT * FROM TBLEMPLOYEE where empID=4
SELECT * FROM TBLDEPARTMENT
END



SELECT * into #TBLEMPLOYEE
(



===================================================================================================================
 CREATE TABLE tblProject 
( 
   ProjectId BIGINT PRIMARY KEY, 
   PName VARCHAR(100) NOT NULL, 
   PCode NVARCHAR(50) NOT NULL, 
   ExamYear SMALLINT NOT NULL 
); 
 
 ss




CREATE TABLE tblExamCentre  
( 
  ExamCentreId BIGINT PRIMARY KEY, 
  ECode VARCHAR(100) NULL, 
  EName VARCHAR(100)  NULL 
); 
 
CREATE  TABLE tblProjectExamCentre 
( 
   ProjectExamCentreId BIGINT PRIMARY KEY, 
   ExamCentreId BIGINT NOT NULL FOREIGN KEY REFERENCES tblExamCentre(ExamCentreId), 
   ProjectId BIGINT FOREIGN KEY REFERENCES tblProject(ProjectId) 
); 
 
 
 
 
 
 
INSERT INTO tblProject(ProjectId,PName,PCode,ExamYear) VALUES 
(1,'8808-01-CW-YE-GCEA-2022','PJ0001',2022), 
(2,'6128-02-CW-YE-GCENT-2022','PJ0002',2022), 
(3, '7055-02-CW-YE-GCENA-2022','PJ0003',2022), 
(4,'8882-01-CW-YE-GCEA-2022','PJ0004',2022), 
(5,'7062-02-CW-YE-GCENT-2022','PJ0005',2022), 
(8,'6128-02-CW-YE-GCENT-1000','PJ0008',1000), 
(9,'7062-02-CW-YE-GCENT-5000','PJ0009',5000), 
(10,'8808-01-CW-YE-GCEA-2023','PJ0010',2023), 
(11,'8808-01-CW-YE-GCEA-2196','PJ0011',2196), 
(15,'6073-02-CW-YE-GCENA-2022','PJ0015',2022), 
(16,'8808-01-CW-YE-GCE0-2022','PJ0016',2022); 
 
 
INSERT INTO tblExamCentre(ExamCentreId,EName,ECode) VALUES 
(112,'VICTORIA SCHOOL-GCENA-S','2711'), 
(185,'NORTHBROOKS SECONDARY SCHOOL-GCENA-S','2746'), 
(227,'YIO CHU KANG SECONDARY SCHOOL-GCENA-S','2721'), 
(302,'CATHOLIC JUNIOR COLLEGE','9066'), 
(303,'ANGLO-CHINESE JUNIOR COLLEGE','9067'), 
(304,'ST. ANDREW''S JUNIOR COLLEGE','9068'), 
(305,'NANYANG JUNIOR COLLEGE','9069'), 
(306,'HWA CHONG INSTITUTION','9070'), 
(1,NULL,'2011'), 
(2,'NORTHBROOKS SECONDARY SCHOOL-GCENA-S',NULL); 
 
 
INSERT INTO tblProjectExamCentre(ProjectExamCentreId,ProjectId,ExamCentreId) VALUES 
(44,1,112), 
(45,1,227), 
(46,1,185), 
(47,2,112), 
(48,2,227), 
(49,2,185), 
(50,3,112), 
(51,3,227), 
(52,3,185), 
(69,4,112); 
 
select * from tblProject 
select * from tblExamCentre 
select * from tblProjectExamCentre 

----1.Write a procedure to fetch the ProjectId, ProjectName, ProjectCode, ExamCentreName 
--and ExamCentreCode from the tables tblProject and  
--tblExamCentre based on the ProjectId and ExamCentreId passed as input parameters. 
 CREATE or ALTER PROCEDURE usp_Question7
 @projectId int,
 @ExamcentreId int
 AS
 BEGIN
   
	DECLARE @PNAME VARCHAR(50)
	DECLARE @PCODE CHAR(10)
	DECLARE @ENAME VARCHAR(50)
	DECLARE @ECODE CHAR(10)

    SELECT @PROJECTID=PROJECTID,@PNAME=PNAME,@PCODE=PCODE
    FROM TBLPROJECT 
    WHERE PROJECTID=@PROJECTID
    SELECT @ENAME=ENAME,@ECODE=ECODE
    FROM TBLEXAMCENTRE
    WHERE ExamCentreId=@ExamCentreId
END
 EXECUTE USP_QUESTION7 1,112
----------------------------------------
 CREATE  PROCEDURE usp_Question8
 @projectId int,
 @ExamcentreId int,
 @EXAMYEAR DATE
 AS
 BEGIN

    SELECT PROJECTID,PNAME,PCODE,EXAMYEAR
    FROM TBLPROJECT 
    WHERE PROJECTID=@PROJECTID
    SELECT ENAME,ECODE
    FROM TBLEXAMCENTRE
    WHERE ExamCentreId=@ExamCentreId
END

USP_QUESTION8 1,112,'2022-10-10'

 --2. 2.Write a procedure to insert values into the table tblProject when the data for the 
--ProjectId  
--which is being inserted does not exist in the table. 

CREATE PROCEDURE USP_QUESTION9
@PROJECTID INT,
@PNAME VARCHAR(50),
@PCODE VARCHAR(10),
@EXAMYEAR INT
AS
BEGIN
   IF NOT EXISTS(SELECT PROJECTID,PNAME,PCODE
                      FROM TBLPROJECT
					  WHERE PROJECTID=@PROJECTID)

					 INSERT INTO TBLPROJECT(PROJECTID,PNAME,PCODE,EXAMYEAR)
					 VALUES (@PROJECTID,'8808-01-CW-YE-GCE9-2020','PJ0017',2020)
					 END

EXECUTE USP_QUESTION9 @PROJECTID=17,@PNAME='8808-01-CW-YE-GCE9-2020',@PCODE='PJ0017',@EXAMYEAR=2020
    
 
-- 3.Write a procedure to update the columns-Code and Name in tblExamCentre when 
--either of the Code or the Name column is NULL  
--and also delete the records from the table tblProjectExamCentre when ProjectId IS 4. 

CREATE PROCEDURE USP_QUESTION10

AS
BEGIN
UPDATE tblExamCentre
SET Ecode=4211
WHERE ECODE IS NULL

UPDATE tblExamCentre
SET Ename='abbs'
WHERE ENAME IS NULL

   delete  from tblPROJECT where PROJECTID=4

   end 
  EXECUTE USP_QUESTION10 

  SELECT*
  FROM TBLPROJECT

  ---4.Write a procedure to fetch the total count of records present in the table tblProject 
--based on the ProjectId AS OUTPUT parameter 
--and also sort the records in ascending order based on the ProjectName. 

CREATE OR ALTER PROCEDURE USP_QUEATION11
@COUNT INT OUTPUT
AS
BEGIN

--DECLARE @COUNT INT
SELECT @COUNT= (SELECT COUNT(*) FROM TBLPROJECT)
PRINT @COUNT
SELECT *  FROM TBLPROJECT ORDER BY PNAME ASC

END

DECLARE @COUNT INT 
EXEC USP_QUEATION11 @COUNT = @COUNT OUTPUT
SELECT @COUNT

--5.Write a procedure to create a Temp table named Students with columns- 
--StudentId,StudentName and Marks where the  
--column StudentId is generated automatically  
--and insert data into the table and also retrieve the data. 
CREATE OR ALTER PROCEDURE USP_STUDENTS
AS
BEGIN
CREATE TABLE #STUDENTS(
STUDENTID INT IDENTITY(1,1),
STUDENTNAME VARCHAR(50),
MARKS INT
)
INSERT INTO #STUDENTS(STUDENTNAME,MARKS)
VALUES('SAGAR',90),
      ('NISHANTH',95),
	  ('RAJ',78)

	  SELECT STUDENTID,STUDENTNAME,MARKS
	  FROM #STUDENTS
END

EXEC USP_STUDENTS

--6.Write a procedure to perform the following DML operations on the column - 
--ProjectName in tblProject table by using a varibale.  
--Declare a local variable and initialize it to value 0, 
--1. When the value of the variable is equal to 2, then insert another record into the table 
--tblProject. 
--2. When the value of the variable is equal to 10, then change the ProjectName to 
--'Project_New' for input @ProjectId 

create or ALTER PROCEDURE USP_QUESTION12
@PEOJECTID INT,
@NEWPROJECTNAME VARCHAR(50)
AS
BEGIN
DECLARE @VARIABLE INT=0
IF @VARIABLE=2
BEGIN
INSERT INTO TBLPROJECT (PNAME)
VALUES ('SETUNION')
SET @VARIABLE =0
END
IF @VARIABLE=10
BEGIN
UPDATE TbLPROJECT
SET PNAME=@NEWPROJECTNAME
WHERE PROJECTID=@PEOJECTID

END
END

EXECUTE USP_QUESTION12 @PEOJECTID=1,@NEWPROJECTNAME='SETUNION'

SELECT*
FROM TBLPROJECT

--7.In the next part of the stored procedure, return all the fields of the table 
--tblProject(ProjectId,ProjectName,Code and Examyear) 
--based on the ProjectId and for the column ExamYear display it as given using CASE 
--statement. 
--1.If the ExamYear is greater than or equal to 2022 then display 'New' 
--2.If the ExamYear is lesser than or equal to 2022 then display 'Old' 
 CREATE PROCEDURE USP_QUESTION13
 @PROJECTID INT
 AS
 BEGIN
 SELECT PROJECTID,PNAME,PCODE,
 CASE
 WHEN EXAMYEAR>='2022' THEN 'NEW'
 WHEN EXAMYEAR<='2022' THEN 'OLD'
 END AS EXAMYEAR
 FROM TBLPROJECT
 WHERE PROJECTID=@PROJECTID
 END

 execute USP_QUESTION13 @PROJECTID=1
 execute USP_QUESTION13 @PROJECTID=2
  execute USP_QUESTION13 @PROJECTID=8



 ================================================================================
                               TRIGGERS 08/11/23	
					======================================

CREATE TRIGGER TR1INSERTTRIGGER
ON TBLEMPLOYEE
FOR INSERT 
AS
BEGIN
    PRINT 'RECORD INSERTED'
	END
	INSERT INTO TBLEMPLOYEE VALUES
	(2936,'MANJUNATH','Technical Engineer',getdate(),'manju@egmail.com','mysore',450000,10,1000,2928)


CREATE TABLE tblEmployeeAudiT(
ID INT,
NAME VARCHAR(50),
SALARY INT,
GENDER VARCHAR(10),
DEPARTMENTID INT)

CREATE TABLE EmployeeAudit​
(​
 Id int identity(1,1) primary key,​
 AuditData nvarchar(1000)​
) 


select * from employeeaudit
 
CREATE TRIGGER tr_tblEMployee_ForInsert​
ON tblEmployeeAudiT
FOR INSERT​
AS​
BEGIN​
Declare @id int​
Select @id = id from inserted​

insert into EmployeeAudit ​
values('New employee with id  = ' + Cast(@id as nvarchar(5)) + ' is added at ' + 
cast(Getdate() as nvarchar(20)))​
END 


 insert into tblEmployeeAudiT values(2,'nishanth',2600,'male',4)
 (1,'sagar',2300,'male',3),
                                     (2,'nishanth',2600,'male',4)
						insert into tblEmployeeAudiT value		 (3,'nisha',2700,'frmale',5),
insert into tblEmployeeAudiT values(4,	'sagarika',2800,'frmale',6)
 select *
 from EmployeeAudiT


CREATE TRIGGER tr_tblEMployee_ForDelete​
ON tblEmployeeAudiT​
FOR DELETE​
AS​
BEGIN​
Declare @Id int​
Select @Id = Id from deleted​
​
insert into EmployeeAudit ​
values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' 
+ Cast(Getdate() as nvarchar(20)))​
END 

alter trigger tr_tblEmployee_ForUpdate​
on tblEmployeeAudiT​
for DELETE​
as​
Begin​
Select * from deleted​
--Select * from inserted ​
End

SELECT * FROM tblEmployeeAudiT

DELETE FROM tblEmployeeAudiT
WHERE ID IN (2)

Update tblEmployeeAudiT set Name = 'Tods', Salary = 2000,  
Gender = 'Female' where Id = 4 


-------------------------------------------------------------
Alter trigger tr_tblEmployee_ForUpdate
on tblEmployeeAudiT
for Update
as
Begin
      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldSalary int, @NewSalary int
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @OldDeptId int, @NewDeptId int
    
      Declare @AuditString nvarchar(1000)
      
      Select *
      into #TempTable
      from inserted
     
      While(Exists(Select Id from #TempTable))
      Begin 
      Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
      if(@OldName <> @NewName)
      Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
      if(@OldGender <> @NewGender)
      Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
      if(@OldSalary <> @NewSalary)
      Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
                  
      if(@OldDeptId <> @NewDeptId)
      Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
           
      insert into employeeaudit values(@AuditString)
      delete from #temptable where id=@id
	  end
	  end

	  CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
);

CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    AvailableQuantity INT NOT NULL,
);

CREATE TABLE PurchaseDetails (
    PurchaseId INT IDENTITY (10,1)PRIMARY KEY,
    EmailId VARCHAR(255) REFERENCES Users(Email),
    ProductId INT REFERENCES Products(ProductId),
    QuantityPurchased INT NOT NULL,
    PurchaseDate DATE
 
);

INSERT INTO Users (UserId, Email)
VALUES
    (1, 'SAGAR.S@gmail.com'),
    (2, 'NISHANTH.N@gmail.com');

INSERT INTO Products (ProductId, ProductName, AvailableQuantity)
VALUES
    (101, 'Product A', 100),
    (102, 'Product B', 150);
	
INSERT INTO PurchaseDetails(EmailId,ProductId,QuantityPurchased,PurchaseDate)
VALUES 
    ('SAGAR.S@gmail.com',101,5,'2022-12-07'),
	('NISHANTH.N@gmail.com',102,10,'2023-11-09')

     
 ====================================================================================================================
                                   assignment 10            10/11/2023
------------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_ex1_FORINSERT
ON TBLEMPLOYEEAUDIT
FOR INSERT
AS
BEGIN

    DECLARE @ID INT
	SELECT @ID=ID FROM INSERTED

	INSERT INTO EMPLOYEEAUDIT
	VALUES('NEW EMPLOYEE WITH ID='+CAST(@ID AS NVARCHAR(20))+'IS ADDED AT'+CAST(GETDATE() AS NVARCHAR(20)))
	
	END


--1.Consider table tblEmployeeDtls and write a stored procedure to generate 
--bonus to employees for the given date  as below: 
--A)One month salary  if Experience>10 years  
--B)50% of salary  if experience between 5 and 10 years  
--C)Rs. 5000  if experience is less than 5 years 
--Also, return the total bonus dispatched for the year as output parameter. 

CREATE OR ALTER PROCEDURE USP_QUS1
@BONUSDATE DATE,
@TOTELBONUS DECIMAL OUTPUT
AS
BEGIN
SET @TOTELBONUS=0
UPDATE TBLEMPLOYEE
SET BONUS =
CASE
WHEN DATEDIFF (YY,GETDATE(),JOINDATE)>10 then salary
WHEN DATEDIFF (YY,GETDATE(),JOINDATE) BETWEEN 5 AND 10 THEN 0.5*SALARY
ELSE 5000 
END
WHERE JOINDATE<=@BONUSDATE
SELECT @TOTELBONUS=SUM(BONUS)
FROM TBLEMPLOYEE
WHERE YEAR(JOINDATE)=YEAR(@BONUSDATE)
END

     DECLARE @TOTELBONUS DECIMAL
     EXEC USP_QUS1 '2023-10-10',@TOTELBONUS OUTPUT
	 SELECT @TOTELBONUS;
	 


	 SELECT employeename
	 
	 FROM TBLEMPLOYEE

--2.Create a stored procedure that returns a sales report for a given time period 
--for a given Sales Person. Write commands to invoke the procedure 

--3.Also generate the month and maximum ordervalue booked by the given 
--salesman(use output parameter) 
--Tables 
--SALESMAN 
--SalesmanNo, Customerno, Orderno 
--Customers 
--CustomerNo,CustomerName, SalesmanNo, OrderNo 
--Orders 
--Orderno, ProductNo, Qty, CustomerNo, OrderDate 
--Products 
--ProdctNo, ProductName, UnitPrice,Discount 

CREATE TABLE TBLSales (
    SaleID INT PRIMARY KEY,
    SalesPerson NVARCHAR(50),
    SaleDate DATE,
    OrderValue MONEY
);


INSERT INTO TBLSales (SaleID, SalesPerson, SaleDate, OrderValue)
VALUES
    (1, 'SAGAR', '2023-01-05', 5000.00),
    (2, 'NISHANTH ', '2023-01-15', 8000.00),
    (3, 'Roshith', '2023-02-10', 6500.00),
    (4, 'MANJU', '2023-01-20', 7500.00),
    (5, 'AKASH', '2023-02-05', 6200.00),
    (6, 'RAKESH', '2023-03-12', 9500.00);

CREATE or alter  PROCEDURE usp_ques2
    @SalesPersonName NVARCHAR(50),
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    
    SELECT
        SaleDate,SaleID,
        OrderValue
    FROM TBLSales
    WHERE SalesPerson = @SalesPersonName
        AND SaleDate BETWEEN @StartDate AND @EndDate;
END;




--4.Consider Toy Centre database 
--Procedure Name : usp_UpdatePrice 
--Description:    This procedure is used to update the price of a given product. 
 
--Input Parameters: 
--∙ProductId 
--∙Price 
--Output Parameter 
--    UpdatedPrice 
--Functionality: 
--∙Check if the product id is valid, i.e., it exists in the Products table 
--∙If all the validations are successful, update the price in the table Products appropriately 
--∙Set the output parameter to the updated price 
--∙If the update is not successful or in case of exception, undo the entire operation and set the 
--output parameter to 0 
--Return Values: 
--∙1 in case of successful update 
--∙-1 in case of any errors or exception


 ALTER PROC usp_UpdatePrice
      @productId VARCHAR(10),
      @price INT,
      @updatedprice INT OUTPUT
AS
BEGIN
BEGIN TRANSACTION
	IF(@productId IN (SELECT ToyID FROM TBLTOYS))
	BEGIN
		UPDATE TBLTOYS
		SET Price = @price
		WHERE ToyID = @productId
		COMMIT
		SELECT @updatedprice = Price
		FROM TBLTOYS
		WHERE ToyID = @productId
		RETURN 1
	END
	ELSE 
	BEGIN
	ROLLBACK
	RETURN -1
	END
END 

DECLARE @update INT,@STATUS INT 
EXEC usp_UpdatePrice 'T1008',2500,@update OUTPUT
PRINT @update

SELECT * FROM TBLTOYS


--5. Procedure Name: usp_InsertPurchaseDetails

--Description:
--This procedure is used to insert purchase details into the PurchaseDetails table and update the available quantity of the product in the Products table. It includes necessary validations based on business requirements.

--Input Parameters:

--EmailId
--ProductId
--QuantityPurchased
--Output Parameter:
--PurchaseID

--Functionality:

--Check if all input parameters are not null.
--Validate the EmailId: Check if the Email exists in the Users table.
--Validate the ProductId: Check if the ProductId exists in the Products table.
--Validate the QuantityPurchased: Ensure that the purchased quantity is greater than 0.
--If all validations are successful:
--Insert the purchase details into the PurchaseDetails table.
--Update the available quantity in the Products table appropriately.
--Set the output parameter to the newly generated PurchaseId.
--If the insert or update is not successful, undo the entire operation and set the output parameter to 0.

--Return Values:

--1 in case of successful insertion and update.
---1 if EmailId is null.
---2 if EmailId is not valid.
---3 if ProductId is null.
---4 if ProductId is not valid.
---5 if QuantityPurchased is not valid or QuantityPurchased is null.
---99 if there is any exception.


CREATE OR ALTER PROCEDURE usp_InsertPurchaseDetails
@EmailId VARCHAR(50),
@ProductId INT,
@QuantityPurchased INT,
@txid INT OUTPUT
AS
BEGIN
   IF @custid IS NULL 
     BEGIN
	  SET @txid=-1
	  RETURN 
	 END 
   IF NOT EXISTS (SELECT 1 FROM USERS WHERE 
   custid=@custid)
     BEGIN
	  SET @txid=-2
	  RETURN
	 END
	IF @tid IS NULL 
     BEGIN
	  SET @txid=-3
	  RETURN 
	 END 
   IF NOT EXISTS (SELECT 1 FROM PRODUCTS WHERE PRODUCTID=@PRODUCTID)
     BEGIN 
	   SET @txid=-4
	   RETURN
	  END
   IF @QuantityPurchased>0 OR @QuantityPurchased IS NULL
     BEGIN
	   SET @txid =-5
	   RETURN
	 END

   BEGIN TRY 
    BEGIN TRANSACTION 
      INSERT INTO PurchaseDetails(EMAILID, PRODUCTID, QuantityPurchased)
      VALUES(@EmailId, @ProductId, @QuantityPurchased)
   UPDATE Products
        SET AvailableQuantity=AvailableQuantity - @QuantityPurchased
        WHERE ProductId = @ProductId
	COMMIT
   END TRY
    BEGIN CATCH
        SET @PurchaseId = -99
        ROLLBACK
        RETURN
    END CATCH
 END

	
DECLARE @PurchaseId INT
EXEC usp_InsertPurchaseDetails 
    @EmailId = 'SAGAR.S@GMAIL.COM',
    @ProductId = 101,
    @QuantityPurchased =NULL ,
    @PurchaseId = @PurchaseId OUTPUT
SELECT @PurchaseId 


 SELECT * FROM PurchaseDetails 

------------------------------------------------------------------------------------------------------------
                                 --   
LOCKS AND CONCURRENCY  13/11/2023

CREATE TABLE ACCOUNTS(
ACCOUNTID INT PRIMARY KEY,
BALANCE DECIMAL)

INSERT INTO ACCOUNTS(ACCOUNTID,BALANCE)
VALUES (1,1000.00),
(2,500.00),
(3,1500.00),
(4,2500.00)
sssssssssss
1S. BEGIN TRANSACTION
SELECT BALANCE 
FROM ACCOUNTS
WHERE ACCOUNTID=1

COMMIT TRANSACTION

2S. BEGIN TRANSACTION
SELECT BALANCE 
FROM ACCOUNTS
WHERE ACCOUNTID=2

UPDATE ACCOUNTS 
SET BALANCE =50000.00
WHERE ACCOUNTID=2

COMMIT TRANSACTION

3S. BEGIN TRANSACTION
SELECT BALANCE 
FROM ACCOUNTS
WHERE ACCOUNTID=2 FOR UPDATE

4s. BEGIN TRANSACTION
SELECT * FROM TBLEMPLOYEE
WHERE EMPLOYEE BETWEEN 2926 AND 2930
SELECT * FROM TBLEMPLOYEE

UPDATE TBLEMPLOYEE
SET SALARY=690000
WHERE EMPLOYEE=2927
ROLLBACK

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

DBCC USEROPTIONS

 
=====================================================================================================
CREATE OR ALTER FUNCTION DBO.EXPRIENCE
(
@JOINDATE DATETIME)
RETURNS INT
AS
BEGIN
 RETURN (DATEDIFF(YYYY,@JOINDATE,GETDATE()))
 END

 SELECT E.employee,E.employeename,E.joindate,E.salary,D.departmentname
 FROM TBLEMPLOYEE E inner join TBLDEPARTMENTS D
 ON  E.departmentid=D.departmentid            
 WHERE DBO.EXPRIENCE(JOINDATE)>10

 or                                                                                                                                                       

 CREATE FUNCTION DBO.EXPRIENCE
(
@JOINDATE DATETIME)
RETURNS INT
AS
BEGIN
 RETURN (DATEDIFF(YYYY,@JOINDATE,GETDATE()))
 END

 SELECT *
 FROM TBLEMPLOYEE 
 WHERE dbo.EXPRIENCE(JOINDATE)>10




===============================================================================================================
                    -            ASSIGNMENT 12 on FUNCTIONS
=================================================================================
 CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
)

INSERT INTO Departments (DepartmentId, DepartmentName)
VALUES 
    (1, 'CSE'),
    (2, 'ISE'),
    (3, 'ECE')

CREATE TABLE StudentMaster (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DateOfJoin DATE NOT NULL,
    Department INT NOT NULL,
    FOREIGN KEY (Department) REFERENCES Departments(DepartmentId)
)

INSERT INTO StudentMaster (Id, Name, DateOfJoin, Department)
VALUES 
    (1, 'Ravi', '2022-01-05', 1),
    (2, 'Shanthala', '2021-07-03', 2),
    (3, 'Sunad', '2021-08-09', 2)

CREATE TABLE Subjects (
    SubId INT PRIMARY KEY,
    Subject VARCHAR(50) NOT NULL
)

INSERT INTO Subjects (SubId, Subject)
VALUES 
    (101, 'Web Design'),
    (102, 'C#.Net'),
    (103, 'RDBMS')

CREATE TABLE DepartmentSubjects (
    SlNo INT PRIMARY KEY,
    DepartmentId INT,
    SubjectId INT,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId),
    FOREIGN KEY (SubjectId) REFERENCES Subjects(SubId)
)

INSERT INTO DepartmentSubjects (SlNo, DepartmentId, SubjectId)
VALUES 
    (1, 1, 101),
    (2, 2, 102),
    (3, 2, 101),
    (4, 1, 103)

CREATE TABLE Marks (
    StudentId INT,
    SubjectId INT,
    DoE DATE,
    Scores INT,
    PRIMARY KEY (StudentId, SubjectId, DoE),
    FOREIGN KEY (StudentId) REFERENCES StudentMaster(Id),
    FOREIGN KEY (SubjectId) REFERENCES Subjects(SubId)

)

INSERT INTO Marks (StudentId, SubjectId, DoE, Scores)
VALUES 
    (1, 101, '2022-01-01', 72)

	CREATE TABLE tblDept
(
	DepartmentId INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
)

CREATE TABLE tblSubject
(	
	SubId INT PRIMARY KEY,
	Subject VARCHAR(50)
)

CREATE TABLE tblDepartmentSubjects
(
	SlNo INT PRIMARY KEY,
	DepartmentId INT
		 REFERENCES tblDept(DepartmentID),
	SubId INT 
		 REFERENCES tblSubject(SubId)
)

CREATE TABLE tblStudentMaster
(
	ID INT PRIMARY KEY,
	Name VARCHAR(50),
	DateOfJoin DATE,
	DepartMent INT 
		FOREIGN KEY REFERENCES tblDepart(DepartmentID)
)




INSERT INTO tblDept
VALUES
(1,'CSE'),(2,'ECE'),(3,'ME'),(4,'IS')

INSERT INTO tblSubject
VALUES
(1001,'C Program'),
(1002,'Python'),
(1003,'Computer Networks'),
(1004,'DBMS'),
(1005,'Web Technology'),
(1006,'Data Mining'),
(1007,'Big Data Analytics'),
(1008,'Arduino Programming'),
(1009,'Digital Electronics'),
(1010,'Computer Fundamentals'),
(1011,'Basic Electronics'),
(1012,'Thermodynamics'),
(1013,'Kinametics'),
(1014,'Dynametics'),
(1015,'MOM')

INSERT INTO tblDepartmentSubjects
VALUES
(1,1,1001),(2,1,1002),(3,1,1003),(4,1,1004),(5,1,1005),
(6,4,1006),(7,4,1007),(8,4,1001),(9,4,1002),(10,4,1005),
(11,3,1012),(12,3,1013),(13,3,1014),(14,3,1015),(15,3,1001),
(16,2,1008),(17,2,1009),(18,2,1010),(19,2,1011),(20,2,1001)




CREATE TABLE tblMarks
(
	Id INT IDENTITY(1,1),
	StudentID INT,
	SubjectID INT
		FOREIGN KEY REFERENCES tblSubject(SubId),
	DoE DATE,
	Scores INT,
	CONSTRAINT Pk_stusub PRIMARY KEY(StudentId,SubjectId)
)


INSERT INTO tblMarks
(StudentID,SubjectID,DoE,Scores)
VALUES
(101,1002,'11-19-2023',70),
(101,1003,'11-19-2023',20),
(101,1004,'11-19-2023',30),

(102,1008,'11-19-2023',70),
(102,1009,'11-19-2023',40),
(102,1010,'11-19-2023',30),
(102,1001,'11-19-2023',30),

(103,1012,'11-19-2023',70),
(103,1013,'11-19-2023',40),
(103,1015,'11-19-2023',30),
(103,1001,'11-19-2023',30)


INSERT INTO tblStudentMaster
VALUES
(101,'Sathish','05-15-2020',1),
(102,'Balraju','10-5-2020',2),
(103,'Chethan','1-15-2020',3)

SElect * from tblDept
Select * from tblSubject
select * from tblDepartmentSubjects
select * from tblstudentmaster
select * from tblMarks

--1.Each department has only five Subjects 
--2.Some subjects can be a common subject between the departments 
--3.Student can take test/assessment on the subjects as per his department 
--4.Student can attempt only once in each subject 
--5.The Pass marks is variable, a student must pass in all subjects  to Pass 
--6.Grades are based on the percentage of scores, those above 79% would be graded as distinction 
--	Those with 60 and above percentage would be graded as first class and those who score above 
--	50% are graded as second class, the remaining are classified as Just passed 
--	Grades are awarded only to those who pass in all subjects 
--1. Create a function to List the details as shown below for the students of a given department and 
--given pass marks 
--| StudentID | Name | Total Marks | Percent | age | No of Subjects Passed | No of Subjects attempted | Result | Grade|


CREATE FUNCTION ufn_report
(
@DepartmentId INT,
@Marks INT
)
RETURNS @reports table
(
	Id INT,
	Name varchar(50),
	TotalMarks INT,
	Percentage INT,
	NoOfPassed INT,
	NoOfSubjectsAttended INT,
	Result varchar(50),
	Grade Varchar(50))
AS
BEGIN
INSERT INTO @reports(Id,Name,TotalMarks,Percentage,NoOfPassed,NoOfSubjectsAttended,Result,Grade)
SELECT ms.StudentId As ID ,
	ms.name as Name,
	COUNT(m.Scores)*100 AS TotalMarks,
	SUM(m.Scores)*100/(COUNT(m.Scores)*100) AS Percentage,
	COUNT(m.Scores)-(COUNT(m.Scores)-COUNT(Result)) as NoofPassed,
	COUNT(m.Scores) as NoOfSubjectsAttended,

	CASE 
		WHEN COUNT(m.Score)=COUNT(Result) THEN 'PASS'
		ELSE 'FAIL'
	END AS Result,
	CASE
	WHEN SUM(m.Scores)*100/(COUNT(m.Scores)*100)>79 AND COUNT(m.Scores)=COUNT(Result) THEN 'Distinction'
	WHEN SUM(m.Scores)*100/(COUNT(m.Scores)*100) BETWEEN 60 AND 78 AND COUNT(m.Scores)=COUNT(Result) THEN 'First Class'
	WHEN  SUM(m.Scores)*100/(Count(m.Scores)*100) BETWEEN 50 AND 60 AND COUNT(m.Scores)=COUNT(Result) THEN 'Second Class'
	WHEN SUM(m.Scores)*100/(Count(m.Scores)*100) BETWEEN 30 AND 50 AND COUNT(m.Scores)=COUNT(Result) THEN 'Just Pass'
	ELSE 'Fail'

END AS Grade
from
(
SELECT ms.id,ms.name,m.scores,CASE WHEN m.Scores>=30 THEN 1 else NULL END AS PassedSub,ms.Department--,Count(m.SubjectId)
from tblstudentmaster ms JOIN tblMarks m
ON ms.ID=m.studentid)
GROUP BY ms.id,ms.name

END

select * from dbo.ufn_report(3,70)

---------------------------------------------------------------------------------------
--select *
--    From tblStudentMaster sm
--    JOIN tblMarks m ON sm.Id=m.StudentId
--    JOIN tblDepartmentSubjects ds ON sm.Department=ds.Departmentid
--	WHERE ds.Departmentid=@Departmentid
--	GROUP BY sm.id,sm.Name
--END

----WHEN SUM(m.Score)*100/(COUNT(m.Score)*100 Count(
----| StudentID | Name | Total Marks | Percent | age | No of Subjects Passed | No of Subjects attempted | Result | Grade|

--SELECT m.studentid,ms.name,m.scores,CASE WHEN m.Scores>=30 THEN 1 else NULL END AS PassedSub,ms.Department--,Count(m.SubjectId)
--from tblstudentmaster ms JOIN tblMarks m
--ON ms.ID=m.studentid
----Group by m.Studentid,ms.Name
----------------------------------------------------------------------------

--        SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) AS SubjectsPassed,
--        COUNT(m.SubjectID) AS SubjectsAttempted,
--        CASE WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 40 THEN 'Pass' ELSE 'Fail' END AS Result,
--        CASE
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 90 THEN 'A+'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 80 THEN 'A'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 70 THEN 'B'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 60 THEN 'C'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 50 THEN 'D'
--            ELSE 'F'
--        END AS Grade
--    From tblStudentMaster sm
--    JOIN tblMarks m ON sm.ID = m.StudentID
--    JOIN tblDepartmentSubjects ds ON sm.DepartMent = ds.DepartmentId
--    WHERE ds.DepartmentId = @DepartmentId
--    GROUP BY sm.ID, sm.Name, sm.Age
--END;

-----------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION ufn_report(@Dept INT ,@Marks INT)
RETURNS @reports table
(
	Id INT,
	Name varchar(50),
	TotalMarks INT,
	Percentage INT,
	NoOfPassed INT,
	NoOfSubjectsAttended INT,
	Result varchar(50),
	Grade Varchar(50))
AS
BEGIN
INSERT INTO @reports(Id,Name,TotalMarks,Percentage,NoOfPassed,NoOfSubjectsAttended,Result,Grade)
SELECT
	StuScore.StudentId as ID,
	StuScore.Studentname as Name,
	COUNT(Stuscore.Marks)*100 AS TotalMarks,
	SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) AS Percentage,
	COUNT(Stuscore.Marks)-(COUNT(Stuscore.Marks)-COUNT(Stuscore.Result)) NoofPassed,
	COUNT(Stuscore.Marks) NoOfSubjectsAttended,
	CASE 
		WHEN COUNT(Stuscore.Marks)=COUNT(StuScore.Result) THEN 'P'
		ELSE 'F'
	END AS Result,
	CASE
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100)>79 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result) THEN 'Distinction'
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) BETWEEN 60 AND 79 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result) THEN 'FirstClass'
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) BETWEEN 50 AND 60 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result)THEN 'Secod class'
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) BETWEEN 30 AND 50 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result)THEN 'Just Pass'
		ELSE 'Fail'
		END AS Grade
	
FROM
(SELECT 
	SM.Id StudentId ,SM.Name StudentName,M.Scores Marks,SM.DepartMent Department,
	CASE
		WHEN M.Scores>=@Marks THEN M.Scores
	ELSE null
	END AS Result
FROM
	tblStudentMaster SM INNER JOIN tblMarks M
ON 
	SM.ID=M.StudentID ) StuScore
WHERE StuScore.Department=@Dept
GROUP BY StuScore.StudentId,StuScore.StudentName
RETURN
END

select * from dbo.ufn_report(2,45)

===============================================================================================================
                                ASSIGNMENT 11
-------------------------------------------------------------------------------------------

CREATE TABLE [tblUsers](
	[UserId]	VARCHAR(50)	Primary Key,
	[UserName]	VARCHAR(50)	NOT NULL,
	[Password]	VARCHAR(50)	NOT NULL,
	[Age]	INT	NOT NULL,
	[Gender]	CHAR(1)	NOT NULL,
	[EmailId]	VARCHAR(50)	UNIQUE,
	[PhoneNumber]	NUMERIC(10)	NOT NULL);

INSERT INTO [tblUsers]
VALUES
('mary_potter', 'Mary Potter', 'Mary@123', 25, 'F', 'mary_p@gmail.com', 9786543211),
('jack_sparrow', 'Jack Sparrow', 'Spar78!jack', 28, 'M', 'jack_spa@yahoo.com', 7865432102);


SELECT * FROM [tblUsers];

CREATE TABLE [tblTheatreDetails](
	[TheatreId]	INT	PRIMARY KEY, 
	[TheatreName] VARCHAR(50) NOT NULL,
	[Location] VARCHAR(50) NOT NULL);

INSERT INTO [tblTheatreDetails]
VALUES
	(1, 'PVR', 'Mysuru'),
	(2, 'Inox', 'Bengaluru');

SELECT * FROM [tblTheatreDetails];

CREATE TABLE [tblShowDetails](
	[ShowId] INT PRIMARY KEY IDENTITY(1001,1),
	[TheatreId] INT FOREIGN KEY REFERENCES [tblTheatreDetails]([TheatreId]),
	[ShowDate] DATE NOT NULL,
	[ShowTime] TIME NOT NULL,
	[MovieName] VARCHAR(50) NOT NULL,
	[TicketCost] DECIMAL(6,2) NOT NULL,
	[TicketsAvailable] INT NOT NULL);

INSERT INTO [tblShowDetails]
VALUES
	(1, '2023-11-28', '14:30:00', 'Avengers', 250.00, 100),
	(2, '2023-11-26', '17:30:00', 'Hit Man', 200.00, 150);

SELECT * FROM [tblShowDetails]

CREATE TABLE [tblBookingDetails](
c VARCHAR(5) PRIMARY KEY,
UserId VARCHAR(50) FOREIGN KEY REFERENCES tblUsers(UserId) NOT NULL,
ShowId INT FOREIGN KEY REFERENCES tblShowDetails(ShowId) NOT NULL,
NoOfTickets INT NOT NULL,
TotalAmt DECIMAL(6,2) NOT NULL);

INSERT INTO tblBookingDetails
VALUES
('B1001', 'mary_potter', 1001, 2, 500.00),
('B1002', 'jack_sparrow', 1002, 5, 1000.00);

SELECT * FROM tblBookingDetails

CREATE PROCEDURE usp_BookTicket
( 
  @USERID VARCHAR(50),
  @SHOWID INT,
  @NOOFTICKET INT)
AS ajkhdfhirh5y;h;p5y4ypohp6oyp
BEGIN
	IF(@USERID NOT IN (SELECT USERID FROM TBLUSER))
	BEGIN 
		PRINT 'USER ID IS INVALID'
		RETURN -1
	END 

	IF (@SHOWID NOT IN (SELECT SHOWID FROM tblBookingDetails))
	BEGIN
		PRINT 'SHOWID IS INVALID'
		RETURN -2
	END

	IF @NOOFTICKET<=0 
	BEGIN
		PRINT 'INVALID NUMBER OF TICKETS'
		RETURN -3
	END

	IF @NOOFTICKET>(SELECT TICKETSAVAILABLE FROM tblShowDetails WHERE SHOWID=@SHOWID)
	BEGIN
		PRINT 'Tickets Unavailable'
		RETURN -4
	END
	
	BEGIN TRY                                                                               --SELECT RIGHT(MAX([BookingId],4)+1)
	                                                                                	      --SELECt 'B'+1002
		                                                                                    --SELECT 'B'+CAST(1002 AS VARCHAR)
		BEGIN TRANSACTION

		--INSERT
			DECLARE @MaxId VARCHAR(5), @Price MONEY;
		
			SELECT 
				@MaxId= 'B'+CAST(RIGHT(MAX(BookingId),4)+1 AS VARCHAR) 
			FROM tblBookingDetails

			SELECT @price=TicketCost
			FROM tblShowDetails
			WHERE ShowId = @ShowId

			INSERT INTO tblBookingDetails(BookingId, UserId, ShowId, NoOfTickets, TotalAmt)
			VALUES
			(@MaxId, @USERID, @SHOWID, @NOOFTICKET, @Price*@NOOFTICKET);

			--UPDATE AVAILABLE TICKETS
			UPDATE tblShowDetails
			SET TicketsAvailable -= @NOOFTICKET
			WHERE ShowId = @ShowId;

		COMMIT
		RETURN 1
	END TRY

	BEGIN CATCH
		ROLLBACK
		PRINT 'OTHER EXCEPTION'
		RETURN -99
	END CATCH
END
 
SELECT * FROM tblUsers
SELECT * FROM tblTheatreDetails
SELECT * FROM tblShowDetails
SELECT * FROM tblBookingDetails


	--NOT EXISTS() or EXISTS() 
	--BOOLEN FUNCTION 
	-- I/P: QUERY
	-- O/P:
	--		TRUE, if there are 1 or more rows
	--		FALSE, if there are no rows

	--CREATE TABLE tbl(
	--a INT);
	--SELECT * FROM [tbl]
	--INSERT INTO [tbl]
	--VALUES
	--(0)

	--SELECT
	--	1
	--WHERE
	--	EXISTS(SELECT * FROM [tbl])

--	Function: ufn_GetMovieShowtimes 
--Create a function ufn_GetMovieShowtimes to get the show details based on the MovieName 
--and Location 
--Input Parameter: 
--MovieName 
--Location 
--Functionality: 
--Fetch the details of the shows available for a given MovieName in a location 
--Return Value: 
--A table containing following fields: 
--MovieName 
--ShowDate 
--ShowTime 
--TheatreName 
--TicketCost 
-- Function: ufn_BookedDetails 
--Create a function ufn_BookedDetails to get the booking details based on the BookingId 
--Input Parameter: 
--∙BookingId 
--Functionality: 
--∙Fetch the details of the ticket purchased based on the BookingId 

CREATE FUNCTION ufn_GetMovieShowtimes(
@MovieName VARCHAR (20),
@Location VARCHAR(20))
RETURNS @MOVIETABLE TABLE 

(MovieName VARCHAR(20),
ShowDate DATE,
ShowTime TIME,
TheatreName VARCHAR(20),
TicketCost DECIMAL)
AS
BEGIN
INSERT INTO @MOVIETABLE
SELECT MovieName,ShowDate ,ShowTime,TheatreName ,TicketCost 
FROM tblTheatreDetails JOIN tblShowDetails
ON tblTheatreDetails.THEATREID=tblShowDetails.THEATREID
WHERE MOVIENAME=@MOVIENAME OR LOCATION=@LOCATION
RETURN
END

select * from dbo.ufn_GetMovieShowtimes( 'hit man','bengaluru')



=====================================================================================================
                           CTE COMMON TABLE EXPRESSION
					=============================================
CREATE TABLE tblE
(​
 Id int Primary Key,​
 Name nvarchar(30),​
 Gender nvarchar(10),​
 DepartmentId int​
)

CREATE TABLE tblD
(​
DeptId int Primary Key,​
DeptName nvarchar(20)​
)

Insert into tblE values (1,'John', 'Male', 3)​,
(2,'Mike', 'Male', 2),
(3,'Pam', 'Female', 1), 
(4,'Todd', 'Male', 4),​
(5,'Sara', 'Female', 1),​
(6,'Ben', 'Male', 3) 
 
Insert into tblD values (1,'IT')​,
 (2,'Payroll')​,
 (3,'HR')​,
 (4,'Admin')

With EmployeeCount(DeptName, DepartmentId, TotalEmployees)​
as​
(​
Select DeptName, DepartmentId, COUNT(*) as TotalEmployees​
from tblE
join tblD
on tblE.DepartmentId = tblD.DeptId​
group by DeptName, DepartmentId​
)​
​
Select DeptName, TotalEmployees​
from EmployeeCount​
where TotalEmployees >=1
ORDER by TotalEmployees asc

------------------------
With Employees_Name_Gender​
as​
(​
Select Id, Name, Gender from tblE
)​
Select * from Employees_Name_Gender 
----------------
With Employees_Name_Gender​
as​
(​
Select Id, Name, Gender from tblE
)​
Update Employees_Name_Gender Set Gender = 'Female' where Id = 1



SELECT Distinct Salary FROM employees E1
WHERE 5=(SELECT count(Distinct Salary)
FROM  employees e
where E1.salary<=e.salary
SELECT Salary From employees

With Employees_Name_Gender​
as​
(​
Select Id, Name, Gender from tblE
)​
Update Employees_Name_Gender Set Gender = 'Female' where Id = 1


=============================================================================
                             ASSIGNMENT -STUDENTMASTER
=====================================================================================

CREATE TABLE tblDept
(
	DepartmentId INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
)

CREATE TABLE tblSubject
(	
	SubId INT PRIMARY KEY,
	Subject VARCHAR(50)
)

CREATE TABLE tblDepartmentSubjects
(
	SlNo INT PRIMARY KEY,
	DepartmentId INT
		 REFERENCES tblDept(DepartmentID),
	SubId INT 
		 REFERENCES tblSubject(SubId)
)

CREATE TABLE tblStudentMaster
(
	ID INT PRIMARY KEY,
	Name VARCHAR(50),
	DateOfJoin DATE,
	DepartMent INT 
		FOREIGN KEY REFERENCES tblDepart(DepartmentID)
)




INSERT INTO tblDept
VALUES
(1,'CSE'),(2,'ECE'),(3,'ME'),(4,'IS')

INSERT INTO tblSubject
VALUES
(1001,'C Program'),
(1002,'Python'),
(1003,'Computer Networks'),
(1004,'DBMS'),
(1005,'Web Technology'),
(1006,'Data Mining'),
(1007,'Big Data Analytics'),
(1008,'Arduino Programming'),
(1009,'Digital Electronics'),
(1010,'Computer Fundamentals'),
(1011,'Basic Electronics'),
(1012,'Thermodynamics'),
(1013,'Kinametics'),
(1014,'Dynametics'),
(1015,'MOM')

INSERT INTO tblDepartmentSubjects
VALUES
(1,1,1001),(2,1,1002),(3,1,1003),(4,1,1004),(5,1,1005),
(6,4,1006),(7,4,1007),(8,4,1001),(9,4,1002),(10,4,1005),
(11,3,1012),(12,3,1013),(13,3,1014),(14,3,1015),(15,3,1001),
(16,2,1008),(17,2,1009),(18,2,1010),(19,2,1011),(20,2,1001)




CREATE TABLE tblMarks
(
	Id INT IDENTITY(1,1),
	StudentID INT,
	SubjectID INT
		FOREIGN KEY REFERENCES tblSubject(SubId),
	DoE DATE,
	Scores INT,
	CONSTRAINT Pk_stusub PRIMARY KEY(StudentId,SubjectId)
)


INSERT INTO tblMarks
(StudentID,SubjectID,DoE,Scores)
VALUES
(101,1002,'11-19-2023',70),
(101,1003,'11-19-2023',20),
(101,1004,'11-19-2023',30),

(102,1008,'11-19-2023',70),
(102,1009,'11-19-2023',40),
(102,1010,'11-19-2023',30),
(102,1001,'11-19-2023',30),

(103,1012,'11-19-2023',70),
(103,1013,'11-19-2023',40),
(103,1015,'11-19-2023',30),
(103,1001,'11-19-2023',30)


INSERT INTO tblStudentMaster
VALUES
(101,'Sathish','05-15-2020',1),
(102,'Balraju','10-5-2020',2),
(103,'Chethan','1-15-2020',3)

SElect * from tblDept
Select * from tblSubject
select * from tblDepartmentSubjects
select * from tblstudentmaster
select * from tblMarks

--1.Each department has only five Subjects 
--2.Some subjects can be a common subject between the departments 
--3.Student can take test/assessment on the subjects as per his department 
--4.Student can attempt only once in each subject 
--5.The Pass marks is variable, a student must pass in all subjects  to Pass 
--6.Grades are based on the percentage of scores, those above 79% would be graded as distinction 
--	Those with 60 and above percentage would be graded as first class and those who score above 
--	50% are graded as second class, the remaining are classified as Just passed 
--	Grades are awarded only to those who pass in all subjects 
--1. Create a function to List the details as shown below for the students of a given department and 
--given pass marks 
--| StudentID | Name | Total Marks | Percent | age | No of Subjects Passed | No of Subjects attempted | Result | Grade|


CREATE FUNCTION ufn_report
(
@DepartmentId INT,
@Marks INT
)
RETURNS @reports table
(
	Id INT,
	Name varchar(50),
	TotalMarks INT,
	Percentage INT,
	NoOfPassed INT,
	NoOfSubjectsAttended INT,
	Result varchar(50),
	Grade Varchar(50))
AS
BEGIN
INSERT INTO @reports(Id,Name,TotalMarks,Percentage,NoOfPassed,NoOfSubjectsAttended,Result,Grade)
SELECT ms.StudentId As ID ,
	ms.name as Name,
	COUNT(m.Scores)*100 AS TotalMarks,
	SUM(m.Scores)*100/(COUNT(m.Scores)*100) AS Percentage,
	COUNT(m.Scores)-(COUNT(m.Scores)-COUNT(Result)) as NoofPassed,
	COUNT(m.Scores) as NoOfSubjectsAttended,

	CASE 
		WHEN COUNT(m.Score)=COUNT(Result) THEN 'PASS'
		ELSE 'FAIL'
	END AS Result,
	CASE
	WHEN SUM(m.Scores)*100/(COUNT(m.Scores)*100)>79 AND COUNT(m.Scores)=COUNT(Result) THEN 'Distinction'
	WHEN SUM(m.Scores)*100/(COUNT(m.Scores)*100) BETWEEN 60 AND 78 AND COUNT(m.Scores)=COUNT(Result) THEN 'First Class'
	WHEN  SUM(m.Scores)*100/(Count(m.Scores)*100) BETWEEN 50 AND 60 AND COUNT(m.Scores)=COUNT(Result) THEN 'Second Class'
	WHEN SUM(m.Scores)*100/(Count(m.Scores)*100) BETWEEN 30 AND 50 AND COUNT(m.Scores)=COUNT(Result) THEN 'Just Pass'
	ELSE 'Fail'

END AS Grade
from
(
SELECT ms.id,ms.name,m.scores,CASE WHEN m.Scores>=30 THEN 1 else NULL END AS PassedSub,ms.Department--,Count(m.SubjectId)
from tblstudentmaster ms JOIN tblMarks m
ON ms.ID=m.studentid)
GROUP BY ms.id,ms.name

END

select * from dbo.ufn_report(3,70)

---------------------------------------------------------------------------------------
--select *
--    From tblStudentMaster sm
--    JOIN tblMarks m ON sm.Id=m.StudentId
--    JOIN tblDepartmentSubjects ds ON sm.Department=ds.Departmentid
--	WHERE ds.Departmentid=@Departmentid
--	GROUP BY sm.id,sm.Name
--END

----WHEN SUM(m.Score)*100/(COUNT(m.Score)*100 Count(
----| StudentID | Name | Total Marks | Percent | age | No of Subjects Passed | No of Subjects attempted | Result | Grade|

--SELECT m.studentid,ms.name,m.scores,CASE WHEN m.Scores>=30 THEN 1 else NULL END AS PassedSub,ms.Department--,Count(m.SubjectId)
--from tblstudentmaster ms JOIN tblMarks m
--ON ms.ID=m.studentid
----Group by m.Studentid,ms.Name
----------------------------------------------------------------------------

--        SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) AS SubjectsPassed,
--        COUNT(m.SubjectID) AS SubjectsAttempted,
--        CASE WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 40 THEN 'Pass' ELSE 'Fail' END AS Result,
--        CASE
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 90 THEN 'A+'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 80 THEN 'A'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 70 THEN 'B'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 60 THEN 'C'
--            WHEN (SUM(CASE WHEN m.Scores >= @PassMarks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.SubjectID)) >= 50 THEN 'D'
--            ELSE 'F'
--        END AS Grade
--    From tblStudentMaster sm
--    JOIN tblMarks m ON sm.ID = m.StudentID
--    JOIN tblDepartmentSubjects ds ON sm.DepartMent = ds.DepartmentId
--    WHERE ds.DepartmentId = @DepartmentId
--    GROUP BY sm.ID, sm.Name, sm.Age
--END;

-----------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION ufn_report(@Dept INT ,@Marks INT)
RETURNS @reports table
(
	Id INT,
	Name varchar(50),
	TotalMarks INT,
	Percentage INT,
	NoOfPassed INT,
	NoOfSubjectsAttended INT,
	Result varchar(50),
	Grade Varchar(50))
AS
BEGIN
INSERT INTO @reports(Id,Name,TotalMarks,Percentage,NoOfPassed,NoOfSubjectsAttended,Result,Grade)
SELECT
	StuScore.StudentId as ID,
	StuScore.Studentname as Name,
	COUNT(Stuscore.Marks)*100 AS TotalMarks,
	SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) AS Percentage,
	COUNT(Stuscore.Marks)-(COUNT(Stuscore.Marks)-COUNT(Stuscore.Result)) NoofPassed,
	COUNT(Stuscore.Marks) NoOfSubjectsAttended,
	CASE 
		WHEN COUNT(Stuscore.Marks)=COUNT(StuScore.Result) THEN 'P'
		ELSE 'F'
	END AS Result,
	CASE
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100)>79 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result) THEN 'Distinction'
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) BETWEEN 60 AND 79 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result) THEN 'FirstClass'
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) BETWEEN 50 AND 60 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result)THEN 'Secod class'
		WHEN SUM(Stuscore.marks)*100/(COUNT(Stuscore.Marks)*100) BETWEEN 30 AND 50 AND 
		COUNT(Stuscore.Marks)=COUNT(Stuscore.Result)THEN 'Just Pass'
		ELSE 'Fail'
		END AS Grade
	
FROM
(SELECT 
	SM.Id StudentId ,SM.Name StudentName,M.Scores Marks,SM.DepartMent Department,
	CASE
		WHEN M.Scores>=@Marks THEN M.Scores
	ELSE null
	END AS Result
FROM
	tblStudentMaster SM INNER JOIN tblMarks M
ON 
	SM.ID=M.StudentID ) StuScore
WHERE StuScore.Department=@Dept
GROUP BY StuScore.StudentId,StuScore.StudentName
RETURN
END

select * from dbo.ufn_report(2,45)



============================================================================================================\
--1.Insert 10 records into each table. 

--2.Display Table information. 

--3. Display Employee’s name,  EmployeeId, departmentId  from tblEmployee 
select employee_name,employeeid,departmentid from tblemployee
 
--4. Display Employee’s name,  EmployeeId, departmentId  of department 20 and 40. 
select employee_name,employeeid,departmentid FROM tblemployee where departmentid in(20,40)
 
 
--5.Display information about all ‘ Trainees Software Engineer’  having salary less than 20000. 
select * from tblemployee where designation='Trainees Software Engineer' and salary <20000
 
--6. Display information about all employees of department 30 having salary greater than 
--20000. 
select * from tblemployee where department_id=30 and salary >20000
 
--7.Display list of employees who are not allocated with Department. 
select * from tblemployee where department_id = null
 
--8.Display name and department of all ‘ Business Analysts’. 
select employeename from tblemployee where designation='Business Analysts'
 
--9.Display name, Designation and salary of all the employees of department 30 who earn 
--more than 20000 and less than 40000. 
select employeename,designation,salary
from tblemployee
where departmentid=30 and salary>20000 and salary <40000

--10.Display unique job of tblEmployee. 
select distinct designation from tblemployee

--11.Display list of employees who earn more than 20000 every year of department 20 and 30. 
select employeename from tblemployee where salary*12>20000 and departmentid in(20,30)

--12.  List Designation, department no and Joined date in the format of Day, Month, and Year of 
--department 20. 
 select designation,departmentId,format(joindate,'YYYYMMDD'),
FROM tblemplopyee
where departmentid=10

select designation,departmentId,JOINDATE,DATEPART(DAY,JOINDATE),DATEPART(MONTH,JOINDATE),DATEPART(YEAR,JOINDATE)
FROM TBLEMPLOYEE
where departmentid=10

--13.Display employees whose name starts with an vowel 
select employeename
from tblemployee
where substring(employeename,1,1) in ('a','e','i','o','u')

--14.Display employees whose name is less than 10 characters 
select employeename from tblemployee where len(employeename)<10

--15.Display employees who have ‘N’ in their name
select employeename
from tblemployee
where employeename like '%n%'
 
--16.Display the employees with more than three years of experience 
select employeename
from tblemployee
where datediff(YYYY,getdate(),joindate)>3

--17.Display employees who joined on Monday 
select employeename
from tblemployee
where DAY(joindate)=2

--18.Display employees who joined on 1st. 
select *
from tblemployee
where day(joindate)=1

--19.Display all Employees joined in January 
select * from tblemployee where month(joindate)=1

--20.Display Employees with their Initials. 
select *
from tblemployee
where employeename like '% %' --'% _ % _ %'

--1.Display all the employees data by sorting the date of joining in the ascending order and 
--then by name in descending order. 
select *
from tblemployee
order by joindate asc,employeename desc

--2.Modify the column name EmployeeName to Employee_FirstName and also add another 
column Employee_LastName 
exec sp_rename 'tblemployee.employeename','first_name','column'
alter  tblemployee
add lastname varchar(50);

--3.Write a query to change the table name to Employees. 
exec sp_rename 'tblemployee','tbldepartment';

--4.Write a query to update the salary of those employees whose location is ‘Mysore’ to 35000. 
update tblemployee
set salary=35000
where location='mysore'

--5.Write a query to disassociate all trainees from their department  
update tblemployee
set designation=' '
where designation ='trainee'

--6.Write a query which adds another column ‘Bonus’ to the table Employees where the bonus 
is equal to the salary multiplied by ten. Update the value only when the experience is two 
years or above. 

--7.Display name and salary of top 5 salaried employees from Mysore and Hyderabad. 
select top 5 salary,employeename
from tblemployee
where location in ('mysore','hyderabad')

select * from tblemployee

--8.Display name and salary of top 3 salaried employees(Include employees with ties) 
select top 3 with ties salary,employeename
from tblemployee
order by salary desc ,

--9.Display top 1% salaried employees from Noida and Bangalore 
select top 1 percent salary
from tblemployee
where location in ('noida','bangalore')
order by salary desc

--10.Find average and total salary for each job. 
select avg(salary),sum(salary),designation
from tblemployee
group by designation 

--11.Find highest salary of all departments. 
select distinct designation,employeename,max(salary)
from tblemployee
group by designation,employeename

--12. Find minimum salary of all departments. 

--13. Find difference in highest and lowest salary for all departments.
select max(salary)-min(salary),designation
from tblemployee
group by designation 

--14.  Find average and total salary for trainees 
select avg(salary),sum(salary)
from tblemployee
where designation='trainess'

--15.  Count total different jobs held by dept no 30 
select count(distinct designation)
from tblemployee
where departmentid=30

--16. Find highest and lowest salary for non-managerial job 
select max(salary),min(salary)
from tblemployee
where designation not like'%manager%'

--17.Count employees and  average annual salary of each department.
select count(employee),avg(salary)*12,designation
from tblemployee
group by designation

--18.Display the number of employees sharing same joining date.
select count(employee)
from tblemployee
group by joindate
having count(employee)>1

--19.Display number of employees with same experience 
select count(employee)
from tblemployee


--20.Display total number of employees in each department with same salary
select designation,count(employee),salary
from tblemployee
group by designation,salary

--21.Display the  number of Employees above 35 years in each department 
select count(employee),designation
from tblemployee
where datediff(YYYY,getdate(),joindate)>35
group by designation


-----------------------------------------------------------------------------------------


CREATE TABLE Salesmen(
Snum int primary key,
Sname varchar(20),
city varchar(20),
Comission decimal(6,2))

select*
from salesmen

CREATE TABLE orders(
Onum int primary key,
OAmt decimal(7,2),
Odate datetime ,
Cnum int references customers(cnum),
Snum int references salesmen(Snum))

select *
from orders

select *
from Customers

Create table customers(
Cnum int primary key,
Cnam varchar(20),
City varchar(20),
Rating int,
Snum int references salesmen(Snum))
--1.Display the following information about each order.
--a.Order No, Customer Name, Order Amount, Order Date 
select onum,cnam,oamt,odate
from orders join customers
on orders.cnum=customers.cnum
group by onum,cnam,oamt,odate
--2.Display customers associated with each Salesman
select count(cnum),sname
from customers c join salesmen s on c.snum=s.snum
group by sname

--3.Display following information about each order: 
--a.OrderNo , Customer Name, Salesman Name, Order Amount, Order 
--Date 
select sname,cnam,onum,oamt,odate
from salesmen s join customers c on s.snum=c.snum
join orders o on o.cnum=c.cnum

--4.Display salesman with their order details in the decreasing order 
--value(Include salesman who has not captured any order) 
--a.Salesman name, Customer name,Ordervalue
select sname,cnam,oamt
from salesmen s left join orders o on s.snum=o.snum left join customers c on c.cnum=o.cnum
order by oamt desc

--5.Display customers with their orders in the ascending order of date(Include 
--customers who hasn’t booked any order) 
--a.Customer Name, Order Value Order date 
select cnam,oamt,odate
from customers c left join orders o on c.cnum=o.cnum
order by odate asc

--6.List the number of customers handled by each salesman.(Sales man 
--name, Number of Customers handled)
select sname,count(cnum)
from salesmen s join customers c on s.snum=c.snum
group by sname
--7.List the customers(Name of the customer) who have placed more than 
--one order 
select cnam,count(cnum)
from customers
group by cnam
having count(cnum)>1
--8.Display sum of orders from each city from each customer and salesman 
select sum(onum),c.city,c.cnam,s.sname
from salesmen s join customers c on s.snum=c.snum
join orders o on o.cnum=c.cnum
group by c.city,c.cnam,s.sname
select right('summer',3)

===================================================================================================================
                                    -ASSESSMENT PG-11/12/2023 
-------------------------------------------------------------------------------------------------------------------
-- Create tblUsers1 table
CREATE  TABLE tblUsers1 (
    User_id int PRIMARY KEY,
    User_name VARCHAR(200),
    Email VARCHAR(200)
);

-- Insert data into tblUsers1
INSERT INTO tblUsers1 (User_id, User_name, Email) VALUES
    (1001, 'Akash', 'akash@gmail.com'),
    (1002, 'Arvind', 'arvind123@gmail.com'),
    (1003, 'Sakshi', 'sakshimys12@gmail.com'),
    (1004, 'Kumar', 'kumar987@gmail.com');

-- Create tblCategory1 table
CREATE TABLE tblCategory1 (
    Category_id int PRIMARY KEY,
    Category_name VARCHAR(200),
    Description VARCHAR(200)
);

-- Insert data into tblCategory1
INSERT INTO tblCategory1 (Category_id, Category_name, Description) VALUES
    (201, 'Electronics', 'One stop for electronic items.'),
    (202, 'Apparel', 'Apparel is the next destination for fashion.'),
    (203, 'Grocery', 'All needs in one place.');

-- Create tblProducts1 table
CREATE  TABLE tblProducts1 (
    Product_id int PRIMARY KEY,
    Product_name VARCHAR(200),
    Quantity INT,
    Product_price int,
    Category_id INT REFERENCES tblCategory1(Category_id)
);

-- Insert data into tblProducts1
INSERT INTO tblProducts1 (Product_id, Product_name, Quantity, Product_price, Category_id) VALUES
    (1, 'Mobile Phone', 1000, 15000.00, 201),
    (2, 'Television', 500, 40000.00, 201),
    (3, 'Denims', 2000, 700.00, 202),
    (4, 'Vegetables', 4000, 40.00, 203),
    (5, 'Ethnic Wear', 300, 1500.00, 202),
    (6, 'Wireless Earphone', 5000, 2500.00, 201),
    (7, 'Lounge Wear', 200, 1600.00, 202),
    (8, 'Refrigerator', 50, 30000.00, 201),
    (9, 'Pulses', 60, 150.00, 202),
    (10, 'Fruits', 100, 250.00, 202);

-- Create tblSales1 table
CREATE  TABLE tblSales1 (
    Sales_id int PRIMARY KEY,
    Sales_user_id INT REFERENCES tblUsers1(User_id),
    Product_id INT REFERENCES tblProducts1(Product_id)
);

-- Insert data into tblSales1
INSERT INTO tblSales1 (Sales_id, Sales_user_id, Product_id) VALUES
    (500, 1001, 1),
    (501, 1002, 1),
    (502, 1003, 2),
    (504, 1004, 3),
    (505, 1004, 1),
    (506, 1004, 1),
    (507, 1002, 2),
    (508, 1003, 1),
    (509, 1001, 7),
    (510, 1001, 8);
  
-------------------------------------------------------------------------------
--1.Write a function to fetch the names of the product,category and users along 
--with the cost for each product sold depending on the sales_id. 
--Also if the cost for each product is more than 2000, then display a message stating 
--that 'The product has gained profit'.  
--If the product cost is between 500 and 1000, then raise a message stating that 
--'The product has occured loss'. 
--If the product cost is less than 500, then raise an exception stating 
--'No profit no loss

-- Create a function to fetch product details and evaluate profit/loss
CREATE OR ALTER FUNCTION dbo.AssQ1(@salesId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT s.Sales_id, p.Product_name, c.Category_name, u.User_name, p.Product_price AS Cost,
        CASE
            WHEN p.Product_price > 2000 THEN 'The product made profit'
            WHEN p.Product_price BETWEEN 500 AND 1000 THEN 'The product made loss'
            WHEN p.Product_price < 500  THEN 'No profit no loss'
        END AS ProfitLoss
    FROM
        tblSales1 s
        JOIN tblUsers1 u ON s.Sales_user_id = u.User_id
        JOIN tblProducts1 p ON s.Product_id = p.Product_id
        JOIN tblCategory1 c ON p.Category_id = c.Category_id
    WHERE
        s.Sales_id = @salesId
);

=====================================================================================
--DECLARE @salesid INT
SELECT * FROM dbo.AssQ1 (504)

========================================================
--2.Write a procedure to update the name of the category from 
--'Electronics' to 'Modern Gadgets' and 
--also  
--fetch the category and product names when the userid is 
--passed as the input parameter. 

CREATE OR ALTER PROCEDURE usp_Update(
    @userId INT
	
	
	)
AS
BEGIN
BEGIN TRY
   BEGIN TRANSACTION
    UPDATE tblCategory1
    SET Category_name = 'Modern Gadgets'
    WHERE Category_name = 'abcd'


    SELECT
        c.Category_name,
        p.Product_name, count(s.sales_user_id) AS user_id
		
    FROM
        tblProducts1 p
        JOIN tblCategory1 c ON p.Category_id = c.Category_id
        JOIN tblSales1 s ON p.Product_id = s.Product_id
    WHERE
        s.Sales_user_id = @userId
		GROUP BY  c.Category_name, p.Product_name
		
	  COMMIT;

	END TRY

	  BEGIN CATCH
	    ROLLBACK;
	    PRINT 'There Is Some Error'
	  END CATCH

END;

select * from tblcategory1
select * from tblproducts1

===============================================
 EXEC usp_Update @userId =1004
===================

select E1.employeename,E1.salary from tblemployee E1
where e1.salary>(select avg(salary) from tblemployee E2
where E2.employee=e1.employee);

SELECT E1.EMPLOYEE_NAME,E2.EMPLOYEE_NAME AS MANAGER
FROM EMPLOYEEE E1 INNER JOIN EMPLOYEEE E2
ON E1.EMPLOYEE_ID=E2.EMPLOYEE_ID
========================================================================================

CREATE  TABLE EMPLOYEEE(EMPLOYEE_ID INT PRIMARY KEY,
                       EMPLOYEE_NAME VARCHAR(50),
					   DEPARTMENT_ID INT not null);


CREATE TABLE DEPARTMENTT(DEPARTMENT_ID INT primary key,
                            DEPARTMENT_NAME VARCHAR(50));


INSERT INTO DEPARTMENTT VALUES(1,'HR');
INSERT INTO DEPARTMENTT VALUES(2,'ENGINEERING');
INSERT INTO DEPARTMENTT VALUES(3,'SALES');

INSERT INTO EMPLOYEEE VALUES(101,'nishanth',1);
INSERT INTO EMPLOYEEE VALUES(102,'manu',2);
INSERT INTO EMPLOYEEE VALUES(103,'anu',3);
INSERT INTO EMPLOYEEE VALUES(104,'ramu',1);

SELECT E.EMPLOYEE_NAME,D.DEPARTMENT_NAME
FROM EMPLOYEEE E inner JOIN DEPARTMENTT D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;



create table em(emp_id int primary key,
emp_name varchar(50),
dept_id int not null)

create table dep(
dept_id int primary key,
dept_name varchar(50))

insert into em VALUES(101,'sagar',1)
insert into em VALUES(102,'sushil',2)
insert into em VALUES(103,'manu',3)
insert into em VALUES(104,'raju',1)
insert into em VALUES(105,'nishanth',2)
insert into em VALUES(106,null,1)
insert into em VALUES(107,'anjali',5)

insert into dep VALUES(1,'hr')
insert into dep VALUES(2,'sales')
insert into dep VALUES(3,'it')
insert into dep VALUES(4,'support')


select e.emp_name,d.dept_name
from em e  left join dep d
on e.dept_id=d.dept_id;
