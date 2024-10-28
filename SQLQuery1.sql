
--------------------------------------------------------------------------------------------------------------------
----------------------------------------------- CREAT DATABASE -----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE master;

--CREATE DATABASE DB1;

--IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME = 'DB1')
--BEGIN
--	CREATE DATABASE DB1;
--END


--IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'DB1')
--BEGIN
--	DROP DATABASE DB1;
--END


--------------------------------------------------------------------------------------------------------------------
------------------------------------------ Creat Table Statement And Drop ------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;


--CREATE TABLE Employees(

--	ID INT NOT NULL,
--	Name NVARCHAR(50) NOT NULL,
--	Phone NVARCHAR(10) NULL,
--	Salary SMALLMONEY NULL,
--	PRIMARY KEY(ID)
--);


----Add Column----
--ALTER TABLE Employees ADD Gendor char(1);

----Rename a Column----
--exec sp_rename 'Employees.Gendor', 'Gender', 'COLUMN';

----Rename Table Name----
--exec sp_rename 'EMPs', 'Employees';

----Modify a Column----
--ALTER TABLE Employees ALTER COLUMN Name NVARCHAR(100) NOT NULL;

----Delete a Column----
--ALTER TABLE Employees DROP COLUMN Gender;

----Delete Table----
--DROP TABLE Empoyees1;


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------- Backup Database Statement---------------------------------------------
--------------------------------------------------------------------------------------------------------------------

--EXEC sp_changedbowner 'sa';

--USE master;

----Backup Database----
--BACKUP DATABASE DB1 TO DISK = 'C:\DB1.bak';

----DIFFERENTIAL BACKUP DATABASE Statement----
----BACKUP DATABASE DB1 TO DISK = 'C:\DB1.bak' WITH DIFFERENTIAL;

----Restore Database----
--RESTORE DATABASE DB1 FROM DISK = 'C:\DB1.bak';


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------- INSERT INTO Statement-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;

----this will show all data in the table----
--select * from Employees;


----Insert one record at a time----
--Insert Into Employees values
--(10,'Emp10','079939',1000);


----Insert one record at a time with some null values----
--Insert Into Employees values
--(11,'Emp11',null,null);


----insert multiple records at a time.----
--Insert Into Employees values
--(2,'Emp2','552221',700),
--(3,'Emp3','55554',300),
--(4,'Emp4','322344',400);


----insert only selected fields----
--Insert Into Employees (ID, Name) values (5,'Emp5');


----if you forget to insert not null filed an error will occure.----
--Insert Into Employees (ID) values (5);


--select * from Employees;


----this will delete all records in table.----
--delete from Employees;


--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- UPDATE Statement--------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;


----this will show all data in the table----
--select * from Employees;


---- this will update one filed at a time----
--Update Employees 
--set Name ='Mohammed Abu-Hadhoud' 
--where ID=2;


---- this will update multiple fields at a time.----
--Update Employees 
--set Name ='Mohammed Abu-Hadhoud' ,  Salary=5000
--where ID=2;


---- this will increase the salary by 200 for all employees that their salaries are less than 500----
--update Employees 
--set Salary = Salary+ 200
--where  Salary < 500 ;


---- this will increase the salary by 10% for all employees that their salaries are less than or equal 1000----
--update Employees 
--set Salary = Salary *1.1 
--where  Salary <= 1000;


--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- DELETE Statement -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;


----this will show all data in the table----
--select * from Employees;

---- this will delete all employees which their salary is null----
--delete from Employees 
--where salary is null;

---- this will delete all employees that have their id=4 , which is one record in our case----
--delete from Employees 
--where ID=4;


--------------------------------------------------------------------------------------------------------------------
---------------------------------------------- SELECT INTO Statement -----------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;


----this will show all data in the table----
--select * from Employees;


---- this will create a new table named EmployeesCopy1 based on the selected coumns then it will copy the data from Employees table based on the condition provided----
--SELECT *
--INTO EmpoyeesCopy1
--FROM Employees;

--select * from EmpoyeesCopy1;


---- this will create a new table named EmployeesCopy1 based on the selected coumns then it will copy the data from Employees table based on the condition provided----
--SELECT ID, Name
--INTO EmpoyeesCopy2
--FROM Employees;

--select * from EmpoyeesCopy2;


---- this will create a new table named EmployeesCopy1 based on the selected coumns then it will----
----  copy the data from Employees table based on the condition provided which is false means no data will be copied----
--SELECT *
--INTO EmpoyeesCopy3
--FROM Employees 
--where 5=6;

--select * from EmpoyeesCopy3;


--------------------------------------------------------------------------------------------------------------------
------------------------------------------- INSERT INTO SELECT Statement -------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;

--INSERT INTO EmpoyeesCopy3 SELECT * FROM Employees;


--------------------------------------------------------------------------------------------------------------------
------------------------------------------- Identity Field (Auto Number) -------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;


--CREATE TABLE Departments (
--    ID int identity(1,1)  NOT NULL,
--    Name nvarchar(50) NOT NULL,
--    PRIMARY KEY (ID)
--);

--SELECT * FROM Departments;
--DELETE FROM Departments;
-------------------------

--insert into Departments values ('HR');

--print @@identity;


--------------------------------------------------------------------------------------------------------------------
------------------------------------------- Delete vs Truncate statement -------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;

--select * from Departments;

----this will delete all rows but will not reset the identity counter.
--delete from Departments;


----this will delete all rows and reset the identity counter.
--truncate table departments;

--insert into Departments values ('HR');

--print @@identity;


--------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Foreign Key Constraint ----------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--USE DB1;


---- This table doesn't have a foreign key
--CREATE TABLE Customers (
--  id INT ,
--  first_name VARCHAR(40),
--  last_name VARCHAR(40),
--  age INT,
--  country VARCHAR(10),
--  PRIMARY KEY (id)
--);


---- Adding foreign key to the customer_id field
---- The foreign key references to the id field of the Customers table
--CREATE TABLE Orders (
--  order_id INT,
--  item VARCHAR(40),
--  amount INT,
--  customer_id INT REFERENCES Customers(id),
--  PRIMARY KEY (order_id)
--);


---------------------------------------------------


---- This table doesn't have a foreign key
--CREATE TABLE Customers (
--  id INT ,
--  first_name VARCHAR(40),
--  last_name VARCHAR(40),
--  age INT,
--  country VARCHAR(10),
--  PRIMARY KEY (id)
--);

--CREATE TABLE Orders (
--  order_id INT,
--  item VARCHAR(40),
--  amount INT,
--  customer_id INT ,
--  PRIMARY KEY (order_id)
--);

---- Adding foreign key to the customer_id field using alter

--ALTER TABLE Orders
--ADD FOREIGN KEY (customer_id) REFERENCES Customers(id);

















--=================================================================================================================--
--=================================================================================================================--
--================================================= SQL - Queries =================================================--
--=================================================================================================================--
--=================================================================================================================--
														--||--
														--||--
														--||-- 
--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- Select Statement -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--EXEC sp_changedbowner 'sa';

--USE master;

--Restore Database HR_Database from disk ='c:\HR_Database.bak';

---------------------------------------------------------------------

--USE HR_Database;


--Select * from Employees;

--Select Employees.* from Employees;

--Select ID, FirstName, LastName,MonthlySalary From Employees;

--Select ID, FirstName, DateOfBirth From Employees;

--Select ID, FirstName, DateOfBirth From Employees where ID <= 295;

--Select * from Departments;

--Select * from Countries;


--------------------------------------------------------------------------------------------------------------------
-------------------------------------------- Select Distinct Statement ---------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--Select DepartmentID from Employees;

--Select Distinct  DepartmentID from Employees;


--Select FirstName from Employees;

--Select Distinct  FirstName from Employees;


--Select FirstName, DepartmentID from Employees;

--Select distinct FirstName, DepartmentID from Employees;


--------------------------------------------------------------------------------------------------------------------
----------------------------------------- Where Statement + AND , OR, NOT ------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--Select * from Employees where Gendor='F';

--Select * from Employees where  MonthlySalary<=500;


--Select * from Employees where  MonthlySalary>500;

--Select * from Employees where Not MonthlySalary<=500;


--Select * from Employees where MonthlySalary<500 and Gendor='F';

--select * from Employees where CountryID=1;


--select * from Employees where Not CountryID=1;

--select * from Employees where  CountryID <> 1;


--select * from Employees where DepartmentID=1;

--select * from Employees where DepartmentID=1 and Gendor='M';


--select * from Employees where DepartmentID = 1 Or DepartmentID = 2;

--select * from Employees where DepartmentID = 1 AND DepartmentID = 2;


--Select * from Employees where ExitDate is Null;


--Select * from Employees where ExitDate  is Not Null;


--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- "In" Operator-- -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--select * from Employees where DepartmentID=1 Or DepartmentID=2;

--select * from Employees where DepartmentID=1 Or DepartmentID=2 or DepartmentID=7;

--select * from Employees where DepartmentID=1 Or DepartmentID=2 or DepartmentID=5 or DepartmentID=7;

--select * from Employees where DepartmentID in (1,2,5,7);

--select * from Employees where FirstName in ('Jacob','Brooks','Harper');

--select Departments.Name from Departments where 
--ID in ( select DepartmentID from Employees where MonthlySalary <=210 );

--select Departments.Name from Departments where 
--ID not in ( select DepartmentID from Employees where MonthlySalary <=210 );


--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- Sorting : Order By -----------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1

--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By FirstName ;

--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By FirstName ASC;

--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By FirstName desc;

--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By MonthlySalary ;


--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By MonthlySalary Asc;


--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By MonthlySalary Desc;



--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By FirstName , MonthlySalary ;


--select ID, FirstName,MonthlySalary from Employees where DepartmentID=1
--Order By FirstName ASC, MonthlySalary Desc;


--------------------------------------------------------------------------------------------------------------------
----------------------------------------------- Select Top Statement -----------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--Select * from Employees;


---- This will show top 5 employees.
--Select top 5 * from Employees;


---- This will show top 10% of the data.
--select top 10 percent * from Employees;

---- this will show the all salaries ordered from the heighest to lowest.
--select  MonthlySalary from employees
--order by MonthlySalary Desc;


---- this will show the all salaries ordered from the heighest to lowest without redundancy.
--select distinct MonthlySalary from employees
--order by MonthlySalary Desc;

---- this will show the heighest 3 salaries.
--select  distinct  top 3 MonthlySalary from employees
--order by MonthlySalary Desc;


----This will show all employees who takes one of the heighest 3 salaries.

--select ID , FirstName, MonthlySalary from Employees where MonthlySalary In
--(
--	select  distinct  top 3 MonthlySalary from employees
--	order by MonthlySalary Desc
--)
--Order By MonthlySalary Desc


----This will show all employees who takes one of the Lowest 3 salaries.
--select ID , FirstName, MonthlySalary from Employees where MonthlySalary In
--(
--	select  distinct  top 3 MonthlySalary from employees
--	order by MonthlySalary ASC
--)
--Order By MonthlySalary ASC


--------------------------------------------------------------------------------------------------------------------
---------------------------------------- SQL Aliases - Select As ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--Select A = 5 * 4 , B = 6/2 


--Select A = 5 * 4 , B = 6/2  from employees


--Select ID, FirstName,  A = MonthlySalary/2 from employees


--Select ID, FirstName + ' ' + LastName as FullName From Employees;


--Select ID, FullName = FirstName + ' ' + LastName  From Employees;


--select ID, FirstName , MonthlySalary , YearlySalary = MonthlySalary * 12  from employees;


--select ID, FirstName , MonthlySalary , YealySalary = MonthlySalary* 12 , BonusAmount = MonthlySalary * BonusPerc  from employees;


--select Today = getDate()


--select ID, FullName = FirstName + ' ' + LastName, Age = DATEDIFF(Year , DateOfBirth ,getDate()) from Employees;


--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- Between Operator -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--Select * from Employees where (MonthlySalary >= 500 and MonthlySalary <= 1000)

--Select * from Employees where MonthlySalary Between 500 and 1000;


--------------------------------------------------------------------------------------------------------------------
------------------------------------ The SQL COUNT(), AVG() and SUM() Functions ------------------------------------
--------------------------------------------------------------------------------------------------------------------


--select
--     TotalCount=Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees;


--select
--     TotalCount=Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees where DepartmentID=1
	   
	   
--select * from employees;

--select TotalEmployees = count (ID) from Employees;

----count function only counts the not null values.
--select ResignedEmployees = count(ExitDate)  from employees;


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------- GROUP BY Statementt --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--select 
--     TotalCount = Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees;


--select 
--     TotalCount = Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees where DepartmentID=3
	   

--select DepartmentID, 
--     TotalCount = Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees
--       Group By DepartmentID
--	   order by DepartmentID


--------------------------------------------------------------------------------------------------------------------
------------------------------------------------------  Having -----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--select DepartmentID, 
--     TotalCount = Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees	
--       Group By DepartmentID	  
--	   order by DepartmentID


----Having is the where satement for group by
--select DepartmentID, 
--     TotalCount = Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees
--       Group By DepartmentID
--	  having Count(MonthlySalary) > 100



---- Same solution without having :-)
--select * from 
--(

--   select DepartmentID, 
--     TotalCount = Count(MonthlySalary), 
--	   TotalSum = Sum(MonthlySalary),
--	   Average = Avg(MonthlySalary),
--	   MinSalary = Min(MonthlySalary),
--	   MaxSalary = Max(MonthlySalary) 
	   
--	   from Employees	
--       Group By DepartmentID	  
--) R1

--where R1.TotalCount > 100;


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- LIKE Operator --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


--select * from Employees;

----Finds any values that start with "a"
--select ID, FirstName from Employees where FirstName like 'a%';


----Finds any values that end with "a"
--select ID, FirstName from Employees where FirstName like '%a';


----Finds any values that have "tell" in any position
--select ID, FirstName from Employees where FirstName like '%tell%';


----	Finds any values that start with "a" and ends with "a"
--select ID, FirstName from Employees where FirstName like 'a%a';


----Finds any values that have "a" in the second position
--select ID, FirstName from Employees where FirstName like '_a%';


----Finds any values that have "a" in the third position
--select ID, FirstName from Employees where FirstName like '__a%';


----Finds any values that start with "a" and are at least 3 characters in length
--select ID, FirstName from Employees where FirstName like 'a__%';


----Finds any values that start with "a" and are at least 4 characters in length
--select ID, FirstName from Employees where FirstName like 'a___%';


----Finds any values that start with "a"
--select ID, FirstName from Employees where FirstName like 'a%' or FirstName like 'b%';


--------------------------------------------------------------------------------------------------------------------
----------------------------------------------- Wildcard Characters ------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


----Execute these satatements to update data
--Update Employees set FirstName = 'Mohammed', LastName = 'Abu-Hadhoud' where ID = 285;

-----------------------------------
--Update Employees set FirstName = 'Mohammad', LastName = 'Maher' where ID = 286;

-----------------------------------
--select ID, FirstName, LastName from Employees Where firstName = 'Mohammed' or FirstName = 'Mohammad'; 

-----------------------------------
---- will search form Mohammed or Mohammad
--select ID, FirstName, LastName from Employees Where firstName like 'Mohamm[ae]d';

-----------------------------------
----You can use Not 
--select ID, FirstName, LastName from Employees Where firstName Not like 'Mohamm[ae]d';

-----------------------------------
--select ID, FirstName, LastName from Employees Where firstName like 'a%' or firstName like 'b%' or firstName like 'c%';

-----------------------------------
---- search for all employees that their first name start with a or b or c
--select ID, FirstName, LastName from Employees Where firstName like '[abc]%';

-----------------------------------
---- search for all employees that their first name start with any letter from a to l
--select ID, FirstName, LastName from Employees Where firstName like '[a-l]%';


--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- DELETE Statement -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------







--------------------------------------------------------------------------------------------------------------------
------------------------------------------------- DELETE Statement -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------