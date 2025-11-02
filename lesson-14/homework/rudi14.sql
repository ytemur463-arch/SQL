									Easy Tasks
1.Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)
select 
substring(name, 1, charindex(',', name) - 1) as firstname, 
substring(name, charindex(',', name) + 1, len(name)) as lastname
from TestMultipleColumns

2.Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)
select * from TestPercent
where strs like '%/%%'
escape '/'

3.Split a string based on dot(.).(Splitter)
select replace(vals, '.', ' ') from Splitter

4.Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)
select * from testDots
where vals like '%.%.%.%'

5.Write a SQL query to count the spaces present in the string.(CountSpaces)
select *, len(texts)  - len(replace(texts, ' ','')) as count_spaces  from CountSpaces

6.Write a SQL query that finds out employees who earn more than their managers.(Employee)
select e1.id, e1.Name, e1.Salary,  e2.Name, e2.Salary from Employee as e1
join Employee as e2
on e1.ManagerId = e2.Id and e1.Salary > e2.Salary

7.Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, DATEDIFF(year, HIRE_DATE, getdate()) as working_years from Employees
where DATEDIFF(year, HIRE_DATE, getdate()) between 11 and 14

								             Medium Tasks
1.write a SQL query to find all dates Ids with higher temperature compared to its previous (yesterdays) dates.(weather)
select w1.id from weather as w1
join weather as w2
on w2.id = w1.Id - 1
where w1.Temperature > w2.Temperature

2.Write an SQL query that reports the first login date for each player.(Activity)
select player_id, min(event_date) as first_login from Activity
group by player_id

3.Your task is to return the third item from that list.(fruits)
SELECT 
    SUBSTRING(
        fruit_list,
        CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1,
        CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1)
            - CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) - 1
    ) AS Fruit3
FROM fruits;

4.Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:
If the employee has worked for less than 1 year → 'New Hire'
If the employee has worked for 1 to 5 years → 'Junior'
If the employee has worked for 5 to 10 years → 'Mid-Level'
If the employee has worked for 10 to 20 years → 'Senior'
If the employee has worked for more than 20 years → 'Veteran'(Employees)

select * from Employees
select *, 
	case
		when datediff(year, hire_date, getdate()) < 1 then 'New Hire'
		when datediff(year, hire_date, getdate()) between 1 and 4 then 'Junior'
		when datediff(year, hire_date, getdate()) between 5 and 9 then 'Mid-Level'
		when datediff(year, hire_date, getdate()) between 10 and 20 then 'Senior'
		else 'Veteran'
	end as stages
from Employees

5.Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)
select left(vals, 1) as first_number from (select * from GetIntegers where vals like '[0-9]%') as t

										Difficult Tasks
1.In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)
select concat( right(reverse(vals), 3),substring(vals, 4, len(vals)) ) as new_column  from MultipleVals

2.Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)
declare @table varchar(50) = 'sdgfhsdgfhs@121313131' 
declare @i int = '1'
declare @len int = len(@table)

declare @str varchar(50) = ''
declare @number varchar(50) = ''
declare @other nvarchar(50) = ''

while @i < @len 
begin 
	declare @ch nvarchar(1) = substring(@table, @i, 1)
	if @ch like '[A-Z]'
		set @str = @str +  @ch
	else if  @ch like '[0-9]'
		set @number = @number + @ch
	else 
		set @other = @other + @ch
	 SET @i = @i + 1;
end

insert into neww_table values 
(@str), 
(@number),
(@other)

3.Write a SQL query that reports the device that is first logged in for each player.(Activity)
select a1.player_id, device_id, event_date from activity as a1
join( select player_id, min(event_date) as first_logged  from Activity
group by player_id) a2
on a1.player_id = a2.player_id and a1.event_date = a2.first_logged

4.Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)
declare @table varchar(30) = 'rtcfvty34redt'
declare @i int = '1'
declare @len int = len(@table)

declare @str varchar(30) = ''
declare @int varchar(30) = ''

while @i < @len 
begin 
	declare @ch varchar(1) = SUBSTRING(@table, @i, 1)
	if @ch like '[A-Z]'
		set @str = @str + @ch
	else 
		set @int = @int + @ch
	set @i = @i + 1
end
--create table table2 (strr varchar(30), intt int )
insert into table2 values
(@str, @int)



