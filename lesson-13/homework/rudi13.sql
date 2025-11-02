									Easy Tasks
1.You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.
select concat(employee_id, '-', first_name,' ', last_name) as word from employees
where employee_id = 100 and  first_name = 'Steven' and last_name = 'King'

2.Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
select * , replace(phone_number, '124', '999') as new_numbers from employees

3.Display the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees first names.(Employees)
select first_name, len(first_name) as length_of_name from employees
where FIRST_NAME like '[A, J, M]%'
order by FIRST_NAME

4.Write an SQL query to find the total salary for each manager ID.(Employees table)
select manager_id, sum(salary) as total_salary from employees
group by MANAGER_ID

5.Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
select year1, 
	case 
		when max1 >= max2 and max1 >= max3 then max1
		when max2 >= max1 and max2 >= max3 then max2
		else max3 
	end as max_number
from testmax

6.Find me odd numbered movies and description is not boring.(cinema)
select *, 
 case 
	when id%2 <> 0 then 'is not boring' 
 end as description
 from cinema
 where id%2 <> 0

 7.You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)
 select * from singleorder
 order by id desc

 8.Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
 select coalesce(ssn, passportid, itin) from person 
 
									Medium Tasks
1.Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)
select 
SUBSTRING(fullname, 1, charindex(' ', fullname)) as firstname, 
substring(fullname, charindex(' ', fullname) + 1,  charindex(' ', fullname, charindex(' ', fullname) + 1) - charindex(' ', fullname)) as middlename,
SUBSTRING(fullname, charindex(' ', fullname, charindex(' ', fullname) + 1), len(fullname) -  charindex(' ', fullname, charindex(' ', fullname) + 1) + 1) as lastname
from Students

2.For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
select o.customerid, o.orderid, o.deliverystate, o.amount from orders as o
join orders as o1
on o.customerid = o1.customerid and o.deliverystate > o1.deliverystate

3.Write an SQL statement that can group concatenate the following values.(DMLTable)
select * from dmltable
DECLARE @result NVARCHAR(MAX) = '';

SELECT @result = @result + string
FROM DMLTable

SELECT @result AS AllData;




4.Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.
select * from employees
where concat(first_name, last_name) like '%a%a%a%'

5.The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)
select 
	t.DEPARTMENT_ID, 
	total_count,
	(count_more_3 / total_count) * 100 as percentage
from (select DEPARTMENT_ID,  count(employee_id) as total_count from employees
group by DEPARTMENT_ID) as t
join (select DEPARTMENT_ID,  count(employee_id) as count_more_3 from employees
where year(getdate()) - year(hire_date) > 3
group by DEPARTMENT_ID) as t1
on t.DEPARTMENT_ID = t1.DEPARTMENT_ID
							Difficult Tasks
1.Write an SQL query that replaces each row with the sum of its value and the previous rows value. (Students table)
select s1.StudentID, s1.FullName, s1.Grade , isnull(s1.Grade + s2.grade, s1.Grade) as [sum] from students as s1
left join  students as s2
on s1.StudentID = s2.StudentID + 1

2.Given the following dataset, find the students that share the same birthday.(Student Table)
select * from student as s1
join student as s2
on s1.Birthday = s2.Birthday and s1.StudentName > s2.StudentName

3.You have a table with two players (Player A and Player B) and their scores. If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. Write an SQL query to calculate the total score for each unique player pair(PlayerScores)
select 
case when playera > playerb then playerb else   playera end as player1,
case	when playera > playerb then playera else   playerb end as player2,
sum(score) as [sum score]
from PlayerScores
group by
case when playera > playerb then playerb else   playera end ,
case	when playera > playerb then playera else   playerb end


4.Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.
DECLARE @str NVARCHAR(50) = 'tf56sd#%OqH';
DECLARE @i INT = 1;
DECLARE @len INT = LEN(@str);

DECLARE @upper NVARCHAR(50) = '';
DECLARE @lower NVARCHAR(50) = '';
DECLARE @num NVARCHAR(50) = '';
DECLARE @other NVARCHAR(50) = '';

WHILE @i <= @len
BEGIN
    DECLARE @ch NCHAR(1) = SUBSTRING(@str, @i, 1);

    IF @ch LIKE '[A-Z]'
        SET @upper = @upper + @ch;
    ELSE IF @ch LIKE '[a-z]'
        SET @lower = @lower + @ch;
    ELSE IF @ch LIKE '[0-9]'
        SET @num = @num + @ch;
    ELSE
        SET @other = @other + @ch;

    SET @i = @i + 1;
END

SELECT 
    @upper AS Uppercase,
    @lower AS Lowercase,
    @num AS Numbers,
    @other AS OtherChars;
