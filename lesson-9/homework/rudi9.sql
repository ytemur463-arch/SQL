							 Easy-Level Tasks 
1.Using Products, Suppliers table List all combinations of product names and supplier names.
select ProductName ,SupplierName  from Products
cross join  Suppliers

2.Using Departments, Employees table Get all combinations of departments and employees.
select DepartmentName, Name from Departments
cross join   Employees

3.Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
select Suppliername, ProductName from Suppliers as s
join products as p
on s.SupplierID = p. SupplierID

4.Using Orders, Customers table List customer names and their orders ID.
select firstname, orderid from Customers as c
join orders as o
on c.CustomerID = o.CustomerID

5.Using Courses, Students table Get all combinations of students and courses.
select name, coursename from Students
cross join  Courses

6.Using Products, Orders table Get product names and orders where product IDs match.
select ProductName, orderid from Products as p
join orders as o
on p.ProductID = o.ProductID

7.Using Departments, Employees table List employees whose DepartmentID matches the department.
select name,  DepartmentName  from Departments as d
join  Employees as e
on d.departmentid = e.departmentid

8.Using Students, Enrollments table List student names and their enrolled course IDs.
select name, courseid from Students as s
join Enrollments as e
on s.StudentID = e.StudentID

9.Using Payments, Orders table List all orders that have matching payments.
select o.OrderID from orders as o
join payments as p
on o.OrderID = p.OrderID

10.Using Orders, Products table Show orders where product price is more than 100.
select orderid from products as p
join orders as o
on p.ProductID = o.ProductID
where price > 100

								Medium
11.Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
select name, DepartmentName from Departments as d
full outer join employees as e
on d.DepartmentID = e.departmentid

12.Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
select orderid from Products as p
join orders as o
on p.ProductID = o.ProductID
where quantity > stockquantity

13.Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
select FirstName, productid from Customers as c
join Sales as s
on c.CustomerID = s.CustomerID
where saleamount > 500

14.Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
select name, coursename from Enrollments as e
join Courses as c
on e.CourseID = c.CourseID
join Students as s
on e.StudentID = s.StudentID

15.Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
select productname,  SupplierName from Suppliers as s
join Products as p
on s.SupplierID = p.SupplierID
where SupplierName like '%Tech%'

16.Using Orders, Payments table Show orders where payment amount is less than total amount.
select o.orderid from orders as o
join Payments as p
on o.OrderID = p.OrderID
where amount < TotalAmount

17.Using Employees and Departments tables, get the Department Name for each employee.
select name, DepartmentName from Departments as d
join Employees as e
on d.DepartmentID = e.DepartmentID

18.Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
select productname, CategoryName from Categories as c
join products as p
on c.CategoryID = p.Category
where categoryname = 'Electronics' or categoryname = 'Furniture'

19.Using Sales, Customers table Show all sales from customers who are from 'USA'.
select saleid from Customers as c
join sales as s
on c.CustomerID = s.CustomerID
where country  = 'usa'

20.Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
select orderid from Customers as c
join orders as o
on c.CustomerID = o.CustomerID
where country  = 'Germany' and totalamount > 100

								 Hard
21.Using Employees table List all pairs of employees from different departments.
select name, count(departmentname) as count from employees as e
join Departments as d
on  e.DepartmentID  = d.DepartmentID 
group by name 
having count(departmentname) = 1

22.Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
select  PaymentID, PaymentDate, PaymentMethod from orders as o
join payments as p
on o.OrderID = p.OrderID
join Products pr
on o.ProductID = pr.ProductID
where quantity * price <> amount

23.Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
select s.StudentID, name from Enrollments as e
join Courses as c
on e.CourseID = c.CourseID
right join Students as s
on e.StudentID = s.StudentID
where e.EnrollmentID is null

24.Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
select e1.name, e1.Salary, e.name, e.Salary from  Employees as e
join Employees as e1
on e.EmployeeID  =  e1.ManagerID 
where e1.Salary <= e.Salary

25.Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
select  orders.customerid , FirstName from orders
join customers
on Orders.CustomerID = Customers.CustomerID
left  join Payments
on Orders.OrderID = Payments.OrderID
where Payments.OrderID  is null 
