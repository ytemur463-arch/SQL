1.Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead. 
select firstname, lastname, city, state from person as p
left join address as a
on p.personid = a.personid

2.Write a solution to find the employees who earn more than their managers.
select e.name from Employee as e
join Employee as e1
on e.managerid = e1.id
where e.salary > e1.salary 

3.
select email   from person as p
group by email 
having count(id) > 1

4.
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id), email
    FROM Person
    GROUP BY email
)

5.
select distinct(g.parentname) from girls as g
left join boys as b
on g.parentname = b.parentname
where  b.id is  null

6.
select custid, count(orderid) as [total Sales amount], min(weight) as min_weight from sales.orders
where freight > 50
group by custid

7.
select isnull( c2.item, ' ') as [item cart 1], isnull(c1.item,' ') as [item cart 2]  from cart1 as c1
full join cart2 as c2
on c1.item = c2.item

8.
select name from orders as o
right join customers as c
on o.customerId = c.id
where o.id is null

9.
select  t.student_name, t.subject_name, count(e.subject_name) as attended_exams  from Examinations as e
right join 
(select * from students as s
cross join Subjects as s1)  as t
on e.student_id = t.student_id and e.subject_name = t.subject_name
group by t.student_name , t.subject_name 
order by t.student_name

