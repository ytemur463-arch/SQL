							Easy-Level Tasks
1.Write a query that uses an alias to rename the ProductName column as Name in the Products table.
select ProductName as name from Products

2.Write a query that uses an alias to rename the Customers table as Client for easier reference.
select * from Customers as Client

3.Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
select ProductName from Products
union 
select ProductName from Products_Discounted

4.Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
select * from Products
intersect
select * from Products_Discounted

5.Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
select distinct  firstname, country  from customers

6.Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
select *,
	case 
		when Price > 1000 then 'High'
		when Price <= 1000 then 'Low'
	end as pricecategory
from Products 

7.Use IIF to create a column that shows 'Yes' if StockQuantity > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
select * , iif(StockQuantity > 100, 'Yes', 'No') as qunatitycategory from Products_Discounted

									Medium-Level Tasks
8.Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.
select ProductName from Products
union 
select ProductName from Products_Discounted

9.Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
select * from Products
except 
select * from Products_Discounted

10.Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
select iif(Price > 1000,  'Expensive', 'Affordable') pricecategory  from products

11.Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
select * from Employees
where
	CASE
		when Age < 25 then 1
		when Salary > 60000 then 1
	end = 1

12.Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
select *,
	case	
		when departmentname =  'HR' then 1.1 *  salary
		when EmployeeID = 5 then 1.1 * salary
		else salary
	end as new_salary
from employees

							Hard-Level Tasks
13.Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)
select *, 
	case 
		when SaleAmount > 500 then 'Top Tier'
		when SaleAmount BETWEEN 200 AND 500 then 'Mid Tier'
		else 'Low Tier'
	end saleamount_category
from Sales 

14.Use EXCEPT to find customers ID who have placed orders but do not have a corresponding record in the Sales table.
select customerid from customers
except 
select customerid from Sales

15.Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table. Result set should show customerid, quantity and discount percentage. The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
select customerid, quantity, 
	case	
		when quantity = 1 then '3%'
		when quantity Between 1 and 3 then '5%'
		else '7%'
	end as [discount percentage] 
from orders


