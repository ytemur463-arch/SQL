                Basic-Level Tasks
1.Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
create table Employees(
	EmpID INT,
	Name VARCHAR(50),
	Salary DECIMAL(10,2)
)

2.Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
insert into Employees(EmpID, Name, Salary) values(1, 'bob', 100.22)

insert into Employees values (2, 'john', 200.33)

insert into Employees values 
(3, 'malika', 500.44),
(4, 'alex', 444.56),
(5, 'leyla', 435.13)
select * from Employees
3.Update the Salary of an employee to 7000 where EmpID = 1.
update Employees 
set salary = 7000
where EmpID = 1

4.Delete a record from the Employees table where EmpID = 2.
delete from Employees
where EmpID = 2

5.Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
DELETE – removes rows from a table one by one, with an optional WHERE condition. The table structure remains, and the operation can be rolled back (if inside a transaction).
TRUNCATE – removes all rows from a table quickly (without logging each row), but keeps the table structure. Cannot usually be rolled back (depends on DBMS).
DROP – removes the entire table (structure + data) from the database permanently.

6.Modify the Name column in the Employees table to VARCHAR(100).
alter table Employees
alter column Name  VARCHAR(100)

7.Add a new column Department (VARCHAR(50)) to the Employees table.
alter table Employees add Department VARCHAR(50)

8.Change the data type of the Salary column to FLOAT.
alter table Employees
alter column Salary FLOAT

9.Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
create table Departments(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
)

10.Remove all records from the Employees table without deleting its structure.
truncate table Employees

                    Intermediate-Level Tasks 
11.Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
insert into Departments
select 1, 'fintex'
union all
select 2, 'cybertex'
union all
select 3, 'economy'
union all
select 4, 'hybrid'
union all
select 5, 'fantastic'

select * from Departments
12.Update the Department of all employees where Salary > 5000 to 'Management'.
update Employees
set Department = 'Management'
where Salary > 5000

13.Write a query that removes all employees but keeps the table structure intact.
delete from Employees
select * from Employees

14.Drop the Department column from the Employees table.
alter table Employees
drop column Department

15.Rename the Employees table to StaffMembers using SQL commands.
exec sp_rename 'Employees', 'StaffMembers'

16.Write a query to completely remove the Departments table from the database.
drop table Departments

                     Advanced-Level Tasks 
17.Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR),price (DECIMAL)
create table Products (
	ProductID INT Primary Key,
	ProductName VARCHAR(20),
	Category VARCHAR(20),
	Price DECIMAL(10,2),
	StockQuantity INT
)

18.Add a CHECK constraint to ensure Price is always greater than 0.
alter table Products
ADD CONSTRAINT Price CHECK (price > 0)

19.Modify the table to add a StockQuantity column with a DEFAULT value of 50.
alter table Products
add  StockQuantity INT DEFAULT 50

20.Rename Category to ProductCategory
exec sp_rename 'Products.Category', 'ProductCategory', 'column'

21.Insert 5 records into the Products table using standard INSERT INTO queries.
insert into Products values
(1, 'phone', 'mobile', 1000, 100),
(2, 'apple', 'fruit', 200, 2000),
(3, 'carrot', 'vegetables', 100, 1500),
(4, 'tomato', 'vegetables', 150, 400),
(5, 'dushes', 'fuit', 120, 3000)

22.Use SELECT INTO to create a backup table called Products_Backup containing all Products data
select * into Products_Backup from Products

23.Rename the Products table to Inventory.
exec sp_rename 'Products', 'Inventory'

24.Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
alter table Inventory
alter column price FLOAT

25.Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
alter table Inventory add ProductCode INT IDENTITY(1000, 5)
