
                              1 - Easy tasks
1.Define the following terms: data, database, relational database, and table.
Data is defined as a collection of individual facts or statistics. Data can come in the form of text, observations, figures, images, numbers, graphs, or symbols. For example, data might include individual prices, weights, addresses, ages, names, temperatures, dates, or distances.
Data is a raw form of knowledge and, on its own, doesn’t carry any significance or purpose. In other words, you have to interpret data for it to have meaning. Data can be simple—and may even seem useless until it is analyzed, organized, and interpreted.
Database. An organized collection of data stored and managed electronically, typically on a computer system.
Relational Database.A type of database that organizes data into structured tables (rows and columns) and establishes relationships between them using keys.
Table.A structured format in a relational database for storing data, consisting of rows (records) and columns (fields/attributes).

2.List five key features of SQL Server.
1. High Performance and Scalability, 2. Security and Access Control, 3. Data Management Tools
4. Backup and Recovery, 5. Business Intelligence & Integration

3.What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
	1. Windows Authentication - Uses the user’s Windows account credentials (username and password) to connect to SQL Server.
	2. SQL Server Authentication - Uses a separate username and password created inside SQL Server (e.g., sa account).
	  
	                                2 - Medium tasks
4.Create a new database in SSMS named SchoolDB.
create database SchoolDB
go
use SchoolDB
5.Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Students(
	StudentID INT PRIMARY KEY,
	Name VARCHAR(50),
	Age INT
)

6.Describe the differences between SQL Server, SSMS, and SQL.
SQL (Structured Query Language) - A programming language designed for managing and manipulating data in relational databases.
SQL Server - A Database Management System (DBMS) created by Microsoft.
SSMS (SQL Server Management Studio) - A graphical user interface (GUI) tool provided by Microsoft.Helps database administrators and developers connect to SQL Server, run SQL queries, design tables, manage security, and back up data.

                                      3 - Hard tasks
7.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
	DQL – Data Query Language -Used to query (retrieve) data from the database.
Example:
SELECT FirstName, Age 
FROM Students 
WHERE Age > 18;
	DML – Data Manipulation Language - Used to manipulate (add, modify, delete) data inside the tables.
examples:
INSERT INTO Students (StudentID, FirstName, Age) 
VALUES (1, 'Alice', 20);
	DDL – Data Definition Language - Defines and manages the structure of the database (tables, schemas, indexes).
examples:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Age INT
);
	DCL – Data Control Language - Controls access, permissions, and security of the database.
examples:
GRANT SELECT ON Students TO User1;
	TCL – Transaction Control Language - Manages transactions (a group of SQL statements executed as a unit). Ensures atomicity (either all succeed or none).
examples:
BEGIN TRANSACTION;
UPDATE Students SET Age = 22 WHERE StudentID = 2;
DELETE FROM Students WHERE StudentID = 3;
COMMIT;

8.Write a query to insert three records into the Students table.
insert into Students values
	(1, 'Bob', 20),
	(2, 'Eva', 22),
	(3, 'Fatima', 18)

9.Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
Step 1. Download the .bak file
Step 2. Open SSMS
Step 3. Open the Restore Database Wizard
Step 4. Choose the Source
Step 5. Select Destination
Step 6. Check Restore Options
Step 7. Start the Restore

