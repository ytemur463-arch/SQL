							Easy-Level Tasks 
1.Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
🔁 Expected Columns: EmployeeName, Salary, DepartmentName
select name, Salary, DepartmentName from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
where salary > 50000

2.Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
🔁 Expected Columns: FirstName, LastName, OrderDate
select FirstName,LastName, OrderDate   from orders as o
join  Customers as c
on o.CustomerID = c.CustomerID
where year(orderdate) = 2023

3.Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
🔁 Expected Columns: EmployeeName, DepartmentName
select Name, isnull(DepartmentName, 'not belong any department') as departmentname from Employees as e
left join Departments as d
on e.DepartmentID = d.DepartmentID

4.Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
🔁 Expected Columns: SupplierName, ProductName
select SupplierName, isnull(ProductName, 'don’t supply any product') as ProductName  from Products as p
right join Suppliers as s
on p.SupplierID = s.SupplierID

5.Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select o.OrderID, OrderDate, PaymentDate, Amount   from orders as o
full join Payments as p
on o.OrderID = p.OrderID

6.Using the Employees table, write a query to show each employees name along with the name of their manager.
🔁 Expected Columns: EmployeeName, ManagerName
select e.Name as EmployeeName , e1.name as ManagerName from Employees as e
join Employees as e1
on e.ManagerID = e1.EmployeeID

7.Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
🔁 Expected Columns: StudentName, CourseName
select name as StudentName, CourseName from Enrollments as e
join Students as s
on e.StudentID = s.StudentID
join Courses as c
on e.CourseID = c.CourseID
where CourseName  = 'Math 101'

8.Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
🔁 Expected Columns: FirstName, LastName, Quantity
select  FirstName, LastName, Quantity  from orders as o
join  Customers as c
on o.CustomerID = c.CustomerID
where quantity > 3

9.Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
🔁 Expected Columns: EmployeeName, DepartmentName
select name as EmployeeName, DepartmentName from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
where DepartmentName = 'Human Resources'

										Medium-Level Tasks
10.Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
🔁 Expected Columns: DepartmentName, EmployeeCount
select DepartmentName, count(employeeid) as EmployeeCount from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
group by DepartmentName
having  count(employeeid) > 5

11.Using the Products and Sales tables, write a query to find products that have never been sold.
🔁 Expected Columns: ProductID, ProductName
select * from Products
select * from Sales
select p.ProductID, ProductName from sales as s
right join Products as p
on s.ProductID = p.ProductID
where s.saleid is null

12.Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
🔁 Expected Columns: FirstName, LastName, TotalOrders
select FirstName, LastName, count(o.CustomerID) as TotalOrders  from orders as o
join Customers as c
on o.CustomerID = c.CustomerID
group by  FirstName, LastName
having count(o.customerid) > 1

13.Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
🔁 Expected Columns: EmployeeName, DepartmentName
select name as EmployeeName , DepartmentName from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID

14.Using the Employees table, write a query to find pairs of employees who report to the same manager.
🔁 Expected Columns: Employee1, Employee2, ManagerID
select e.name as Employee1, e1.name as Employee2 from Employees as e
join Employees as e1
on e.ManagerID = e1.ManagerID and e.EmployeeID < e1.EmployeeID

15.Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName
select o.OrderID, OrderDate, FirstName, LastName from orders as o
join Customers as c
on o.CustomerID = c.CustomerID
where year(OrderDate) = 2022

16.Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
🔁 Expected Columns: EmployeeName, Salary, DepartmentName
select name as EmployeeName, Salary, DepartmentName from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID 
where DepartmentName = 'Sales' and Salary > 60000 

17.Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select p.orderid, OrderDate, PaymentDate, Amount from payments as p
join orders as o
on p.OrderID = o.OrderID

18.Using the Products and Orders tables, write a query to find products that were never ordered.
🔁 Expected Columns: ProductID, ProductName
select p.ProductID,  ProductName from Orders as o
right join Products as p
on o.ProductID = p.ProductID
where o.ProductID is null

										Hard-Level Tasks
19.Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
🔁 Expected Columns: EmployeeName, Salary
select name as EmployeeName ,DepartmentName,  salary from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
where salary > ( SELECT AVG(e2.Salary)
    FROM Employees AS e2
    WHERE e2.DepartmentID = e.DepartmentID) 

20.Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
🔁 Expected Columns: OrderID, OrderDate
select o.OrderID,  orderdate from orders as o
left join Payments as p
on o.OrderID = p.OrderID
where  p.orderid is null and year(orderdate) < 2020

21.Using the Products and Categories tables, write a query to return products that do not have a matching category.
🔁 Expected Columns: ProductID, ProductName
select ProductID, ProductName from Products as p
left join Categories as c
on p.Category = c.CategoryID
where c.CategoryID is null 

22.Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary
SELECT 
    e1.Name AS Employee1,
    e2.Name AS Employee2,
    e1.ManagerID,
    e1.Salary
FROM Employees AS e1
JOIN Employees AS e2
    ON e1.ManagerID = e2.ManagerID     
   AND e1.EmployeeID < e2.EmployeeID   
WHERE e1.Salary > 60000
  AND e2.Salary > 60000;

23.Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
🔁 Expected Columns: EmployeeName, DepartmentName
select name as EmployeeName, DepartmentName from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
where DepartmentName like 'M%'

24.Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
🔁 Expected Columns: SaleID, ProductName, SaleAmount
select SaleID, ProductName, saleamount from sales as s 
join Products as p
on s.ProductID = p.ProductID
where SaleAmount > 500

25.Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
🔁 Expected Columns: StudentID, StudentName
select s.StudentID, name as studentname from Enrollments as e
join Courses as c
on e.CourseID = c.CourseID
right join Students as s
on s.StudentID = e.StudentID
where e.StudentID is null and CourseName = 'Math 101'

26.Using the Orders and Payments tables, write a query to return orders that are missing payment details.
🔁 Expected Columns: OrderID, OrderDate, PaymentID
select o.OrderID, OrderDate, PaymentID from payments as p
right join orders as o
on p.OrderID = o.OrderID
where p.OrderID is null

27.Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
🔁 Expected Columns: ProductID, ProductName, CategoryName
select ProductID, ProductName, CategoryName from Products as p
join Categories as c
on p.Category = c.CategoryID
where CategoryName = 'Electronics' or CategoryName = 'Furniture'










