                                 Easy-Level Tasks
1.Define and explain the purpose of BULK INSERT in SQL Server.
In SQL Server, BULK INSERT is a Transact-SQL (T-SQL) command used to quickly load large volumes of data from a data file (such as .txt or .csv) into a table or view in a SQL Server database.
BULK INSERT is a high-performance command that imports data from an external file directly into a SQL Server table, bypassing some of the overhead of row-by-row insertion methods.

2.List four file formats that can be imported into SQL Server.
txt, csv, Excel files, XML

3.Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50),
	Price DECIMAL(10,2)
)

4.Insert three records into the Products table using INSERT INTO.
insert into Products values
(1, 'iphone', 1500.50),
(2, 'applewatch', 1000.70),
(3, 'tesla', 20000.00)

5.Explain the difference between NULL and NOT NULL.
NULL means no value or unknown value.
NOT NULL is a constraint that prevents a column from having NULL values.

6.Add a UNIQUE constraint to the ProductName column in the Products table.
alter table Products
add constraint UQ_ProductName UNIQUE (ProductName)

7.Write a comment in a SQL query explaining its purpose.
-- A comment in SQL is text in a query that is ignored by the database engine.
/*It is written only for humans (developers, DBAs, students) to explain what the query does.*/

8.Add CategoryID column to the Products table.
ALTER TABLE Products 
add CategoryID int

9.Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
create table Categories(
	CategoryID int PRIMARY KEY,
	CategoryName varchar(30) UNIQUE
)

10.Explain the purpose of the IDENTITY column in SQL Server.
In SQL Server, the IDENTITY property is used to create an auto-incrementing column.
It automatically generates sequential numbers for each new row inserted into a table — usually for primary keys.

							Medium-Level Tasks
11.Use BULK INSERT to import data from a text file into the Products table.
bulk insert  Products
from 'C:\Users\user\Desktop\SQL\test.csv'
with
(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)

12.Create a FOREIGN KEY in the Products table that references the Categories table.
alter table Products
add constraint  FK_Products_Categories
FOREIGN KEY (CategoryID)
references Categories(CategoryID)

13.Explain the differences between PRIMARY KEY and UNIQUE KEY.
PRIMARY KEY uniquely identifies each row in a table. -Only one per table.No NULLs allowed.
UNIQUE KEY also ensures uniqueness of values. - Can have many per table.NULLs allowed (but only one NULL per column in SQL Server).

14.Add a CHECK constraint to the Products table ensuring Price > 0.
alter table Products
add constraint CHK_Products_Price
check (Price > 0)

15.Modify the Products table to add a column Stock (INT, NOT NULL).
alter table Products
add Stock INT NOT NULL DEFAULT 0

16.Use the ISNULL function to replace NULL values in Price column with a 0.
select Productid, ProductName, isnull(Price, 0) 
from Products

17.Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
A FOREIGN KEY constraint in SQL Server creates a relationship between two tables.
It ensures that the value in one table (child table) must match a value in another table (parent table).

							Hard-Level Tasks
18.Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
create table Customers(
	Age int check (Age >= 18.)
)

19.Create a table with an IDENTITY column starting at 100 and incrementing by 10.
create table Useg (
	ID INT IDENTITY(100, 10),
	NAME VARCHAR (50)
)

20.Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
create table OrderDetails(
	orderid int not null,
	productid int not null, 
	ordername varchar(50),
	primary key (orderid, productid)
)

21.Explain the use of COALESCE and ISNULL functions for handling NULL values.
COALESCE - A standard SQL function that returns the first non-NULL value from a list of expressions. - Good when you need to check multiple values and pick the first available one.
ISNULL - : A SQL Server function (in MySQL you’d use IFNULL). It checks if a value is NULL and replaces it with a given value. - Quick and simple replacement of NULL with a default value.

22.Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
create table Employees(
	EmpID int PRIMARY KEY,
	Email varchar(30) UNIQUE
)

23.Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
create table orders1 (
	EmpID int  PRIMARY KEY,
	ordername varchar(50)
	constraint  fk_emp foreign key (EmpID)
		references Employees(EmpID)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
	)
