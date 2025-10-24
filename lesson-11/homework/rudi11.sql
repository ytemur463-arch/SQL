									Easy-Level Tasks
1.Return: OrderID, CustomerName, OrderDate
Task: Show all orders placed after 2022 along with the names of the customers who placed them.
Tables Used: Orders, Customers
select OrderID, firstname as CustomerName, OrderDate from orders as o
join Customers as c
on o.CustomerID = c.CustomerID
where year(OrderDate) > 2022

2.Return: EmployeeName, DepartmentName
Task: Display the names of employees who work in either the Sales or Marketing department.
Tables Used: Employees, Departments
select name as EmployeeName, DepartmentName from Employees as e 
join Departments as d
on e.DepartmentID = d.DepartmentID
where DepartmentName = 'Sales' or DepartmentName = 'Marketing'

3.Return: DepartmentName, MaxSalary
Task: Show the highest salary for each department.
Tables Used: Departments, Employees
select DepartmentName, max(salary) as max_salary from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
group by DepartmentName

4.Return: CustomerName, OrderID, OrderDate
Task: List all customers from the USA who placed orders in the year 2023.
Tables Used: Customers, Orders
select firstname as CustomerName, OrderID, OrderDate from Orders as o
join Customers as c
on o.CustomerID = c.CustomerID
where year(OrderDate) = 2023 and Country = 'USA'

5.Return: CustomerName, TotalOrders
Task: Show how many orders each customer has placed.
Tables Used: Orders , Customers
select firstname + ' ' + lastname as CustomerName,  count(o.customerid) as TotalOrders  from orders as o
join Customers as c
on o.CustomerID = c.CustomerID
group by firstname, lastname

6.Return: ProductName, SupplierName
Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Tables Used: Products, Suppliers
select ProductName, SupplierName from Products as p
join Suppliers as s
on p.SupplierID = s.SupplierID
where SupplierName = 'Gadget Supplies' or SupplierName = 'Clothing Mart'

7.Return: CustomerName, MostRecentOrderDate
Task: For each customer, show their most recent order. Include customers who havent placed any orders.
Tables Used: Customers, Orders
select  FirstName + ' '  + LastName as CustomerName, max(orderdate) as recent_order  from orders as o
right join Customers as c
on o.CustomerID = c.CustomerID
group by FirstName, lastname
								Medium-Level Tasks
8.Return: CustomerName, OrderTotal
Task: Show the customers who have placed an order where the total amount is greater than 500.
Tables Used: Orders, Customers
select concat(firstname, lastname) as CustomerName, totalamount from orders as o
join Customers as c
on o.CustomerID = c.CustomerID
where TotalAmount > 500

9.Return: ProductName, SaleDate, SaleAmount
Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Tables Used: Products, Sales
select ProductName, SaleDate, SaleAmount from sales as s
join Products as p
on s.ProductID = p.ProductID
where year(SaleDate) = 2022 or SaleAmount > 400

10.Return: ProductName, TotalSalesAmount
Task: Display each product along with the total amount it has been sold for.
Tables Used: Sales, Products
select ProductName, SaleAmount from sales as s
join Products as p 
on s.ProductID = p.ProductID

11.Return: EmployeeName, DepartmentName, Salary
Task: Show the employees who work in the HR department and earn a salary greater than 60000.
Tables Used: Employees, Departments
select name as EmployeeName, DepartmentName, Salary from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID 
where DepartmentName = 'HR' and Salary > 60000

12.Return: ProductName, SaleDate, StockQuantity
Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
Tables Used: Products, Sales
select ProductName, SaleDate, StockQuantity from Sales as s
join Products as p
on s.ProductID = p.ProductID
where year(SaleDate) = 2023 and StockQuantity > 100

13.Return: EmployeeName, DepartmentName, HireDate
Task: Show employees who either work in the Sales department or were hired after 2020.
Tables Used: Employees, Departments
select name as EmployeeName, DepartmentName, HireDate from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID 
where DepartmentName = 'Sales' or year(HireDate) > 2020
								Hard-Level Tasks
14.Return: CustomerName, OrderID, Address, OrderDate
Task: List all orders made by customers in the USA whose address starts with 4 digits.
select firstname as CustomerName, OrderID, Address, OrderDate from Orders as o
join Customers as c
on o.CustomerID = c.CustomerID
where Country = 'USA' and Address like '[0-9][0-9][0-9][0-9]%'

15.Return: ProductName, Category, SaleAmount
Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
Tables Used: Products, Sales
select ProductName, Category, SaleAmount from Sales as s
join Products as p
on s.ProductID = p.ProductID
join Categories as c
on c.CategoryID = p.Category
where CategoryName = 'Electronics' or SaleAmount > 350

16.Return: CategoryName, ProductCount
Task: Show the number of products available in each category.
Tables Used: Products, Categories
select CategoryName, count( ProductID) as ProductCount from Products as p 
join Categories as c
on p.Category = c.CategoryID
group by Categoryname

17.Return: CustomerName, City, OrderID, Amount
Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
Tables Used: Customers, Orders
select firstname as CustomerName , City, OrderID , TotalAmount from Orders as o
join Customers as c
on c.CustomerID = o.CustomerID
where city = 'Los Angeles' and TotalAmount > 300

18.Return: EmployeeName, DepartmentName
Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
Tables Used: Employees, Departments
select name as EmployeeName, DepartmentName from Employees as e
join Departments as d
on d.DepartmentID = e.DepartmentID
where DepartmentName = 'HR' or DepartmentName = 'Finance' or name like '%[aeiouAEIOU][aeiouAEIOU][aeiouAEIOU][aeiouAEIOU]%'

Return: EmployeeName, DepartmentName, Salary
Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
Tables Used: Employees, Departments
select name as EmployeeName, DepartmentName, salary from Employees as e
join Departments as d
on e.DepartmentID = e.DepartmentID
where (DepartmentName = 'Sales' or DepartmentName = 'Marketing') and Salary > 60000
