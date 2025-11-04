1. Find Employees with Minimum Salary
select name, salary from Employees
where salary = ( select min(salary) from Employees)

2. Find Products Above Average Price
select * from products
select product_name, price from products
where price > (select avg(price) from products)

3.Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)
select name, department_name from Employees as e
join departments as d
on e.DEPARTMENT_ID = d.id
where department_name = 'sales'

4.Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)
select * from customers
where customer_id not in (select customer_id from orders)

5.Find Products with Max Price in Each Category
select product_name from products as p1
where price =  (select top 1 price  from products as p2 where p1.category_id = p2.category_id order by price desc)

6.Find Employees in Department with Highest Average Salary
select * from Employees as e
join Departments as d
on e.department_id = d.id
where salary = (select top 1 salary  from Employees as e1 where e1.department_id = d.id order by salary desc)

7.Find Employees Earning Above Department Average
select * from employees as e1
where salary > (select avg(salary) from Employees as e2 where e1.department_id = e2.department_id)

8.Find Students with Highest Grade per Course
select * from grades as g
join students as s 
on s.student_id = g.student_id
where g.grade = (select top 1 g1.grade from grades as g1 where g.course_id = g1.course_id order by grade desc)

9.Find Third-Highest Price per Category Task: Retrieve products with the third-highest price in each category. Tables: products (columns: id, product_name, price, category_id)
select category_id,  min(price) as third_highest_price from products as p1
where price in (select top 3 price from products as p2 where p1.Category_id = p2.Category_id order by price desc)
group by  category_id

10.Find Employees whose Salary Between Company Average and Department Max Salary
select * from employees
select * from employees as e1
where salary > (select avg(salary) from employees as e2 where e1.department_id = e2.department_id) and salary < (select top 1 salary from employees as e3 where e1.department_id = e3.department_id order by salary desc)

