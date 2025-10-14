							Easy-Level Tasks
1.Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) from Products

2.Write a query to find the maximum (MAX) Salary from the Employees table.
select MAX(salary) from Employees

3.Write a query to count the number of rows in the Customers table.
select count(*) from Customers

4.Write a query to count the number of unique product categories from the Products table.
select count(distinct category) from Products

5.Write a query to find the total sales amount for the product with id 7 in the Sales table.
select sum(saleamount) from Sales
where  productid = 7 

6.Write a query to calculate the average age of employees in the Employees table.
select avg(age) from Employees

7.Write a query to count the number of employees in each department.
select departmentname, count(employeeid) as count from employees
group by departmentname

8.Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
select Category,  min(Price) as min , max(Price) as max from products
group by Category

9.Write a query to calculate the total sales per Customer in the Sales table.
select customerid, sum(saleamount) as total from Sales
group by customerid

10. Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you dont have DeptName).
select departmentname, count(employeeid) as count from Employees
group by departmentname
having count(employeeid) > 5

								Medium-Level Tasks
11.Write a query to calculate the total sales and average sales for each product category from the Sales table.
select productid, sum(saleamount) as total, avg(saleamount) as [avg] from sales
group by productid

12.Write a query to count the number of employees from the Department HR.
select departmentname, count(employeeid) as count from employees
group by departmentname
having departmentname = 'HR'

13.Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you dont have DeptName).
select DepartmentName, max(salary) as highest, min(salary) as lowest from Employees
group by DepartmentName

14.Write a query to calculate the average salary per Department.(DeptID is enough, if you dont have DeptName).
select DepartmentName, cast(avg (salary) as float) as [avg]  from Employees
group by DepartmentName

15.Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you dont have DeptName).
select DepartmentName, cast(avg(salary) as float) as [avg], count(*) as [count] from Employees
group by DepartmentName

16.Write a query to filter product categories with an average price greater than 400.
select Category, avg(price) as [avg] from Products
group  by Category
having avg(price) > 400

17.Write a query that calculates the total sales for each year in the Sales table.
select year(saledate) as [year], sum(saleamount) as total from Sales
group by year(saledate)

18.Write a query to show the list of customers who placed at least 3 orders.
select CustomerID, count(CustomerID) as quantity from orders
group by CustomerID
having count(CustomerID) >= 3

19.Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you dont have DeptName).
select DepartmentName, avg(salary) as [avg] from Employees
group by DepartmentName
having  avg(salary) > 60000

								Hard-Level Tasks
20.Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.
select category, avg(price) as [avg] from products
group by category
having avg(price) > 150

21.Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.
select customerid, sum(saleamount) as total from sales
group by customerid
having sum(saleamount) > 1500

22.Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with an average salary greater than 65000.
select departmentname, sum(salary) as total, avg(salary) as [avg] from employees
group by departmentname
having avg(salary) > 65000

23.Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).
SELECT 
    customerid,
    SUM(CASE WHEN freight > 50 THEN freight ELSE 0 END) AS total_high_weight_orders,
    MIN(freight) AS least_purchase
FROM TSQL2012.Sales.Orders
GROUP BY customerid;

24.Write a query that calculates the total sales and counts unique products sold in each month of each year, and then filter the months with at least 2 products sold.(Orders)
SELECT 
    YEAR(orderdate) AS order_year,
    MONTH(orderdate) AS order_month,
    SUM(totalamount) AS total_sales,
    COUNT(DISTINCT productid) AS unique_products
FROM Orders
GROUP BY YEAR(orderdate), MONTH(orderdate)
HAVING COUNT(DISTINCT productid) >= 2;

25.Write a query to find the MIN and MAX order quantity per Year. From orders table
select year(orderdate) as order_year, min(quantity) as [min], max(quantity) as [max] from orders
group by year(orderdate)



