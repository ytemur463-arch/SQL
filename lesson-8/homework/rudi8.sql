						Easy-Level Tasks
1.Using Products table, find the total number of products available in each category.
select category, sum(stockquantity) as total_number from products
group by category

2.Using Products table, get the average price of products in the 'Electronics' category.
select category, avg(price) as [avg price] from products
group by category
having category = 'Electronics'

3.Using Customers table, list all customers from cities that start with 'L'.
select * from customers
where city like 'l%'

4.Using Products table, get all product names that end with 'er'.
select ProductName from products
where ProductName like '%er'

5.Using Customers table, list all customers from countries ending in 'A'.
select * from customers
where country like '%a'

6.Using Products table, show the highest price among all products.
select max(price) as max_price from products

7.Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select *,
case 
	when stockquantity < 30 then 'Low Stock'
	else 'Sufficient'
end as label_stock
from products

8.Using Customers table, find the total number of customers in each country.
select country, count(customerid) as total_number from customers
group by country

9.Using Orders table, find the minimum and maximum quantity ordered.
select min(quantity) as min_quantity, max(quantity) as max_quantity from orders

								Medium-Level Tasks
10.Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
select customerid, invoicedate from invoices
where invoicedate >= '2023-01-01' and invoicedate < '2023-02-01'
except
select customerid, orderdate from orders

11.Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
select productname from Products
union all
select productname from  Products_Discounted

12.Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
select productname from Products
union 
select productname from  Products_Discounted

13.Using Orders table, find the average order amount by year.
select year(orderdate) as [year], avg(quantity) as avg_order from Orders
group by year(orderdate)

14.Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
select productname, 
case
	when price < 100 then 'low'
	when price between 100 and 500 then 'mid'
	when price > 500 then 'high'
end as price_group 
from products

15.Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
create table Population_Each_Year(district_name varchar(30), [2012] int, [2013] int)
insert into Population_Each_Year
select district_name, [2012],[2013] from City_Population
pivot
(
sum(population) for year in ([2012],[2013])
) AS PivotTable
  
16.Using Sales table, find total sales per product Id.
select productid, sum(saleamount) as total_sales from sales
group by productid

17.Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select productname from products
where productname like '%oo%'

18.Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.
create table Population_Each_City ([year] date, bektemir int, chilonzor int, yakkasaroy int)
go
insert into Population_Each_City
select [year], bektemir, chilonzor, yakkasaroy from City_Population
pivot
(
sum(population) for district_name in (bektemir, chilonzor, yakkasaroy)
) as pivottable

								Hard-Level Tasks
19.Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
select top(3)  CustomerID, totalamount  from Invoices
order by totalamount desc

20.Transform Population_Each_Year table to its original format (City_Population).
select district_name, [year], population from Population_Each_Year
unpivot 
(
population for [year] in([2012], [2013])
) as unpivottable

21.Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
select productname, saledate
from Products as p
join Sales as s
on p.ProductID = s.ProductID

22.Transform Population_Each_City table to its original format (City_Population).
select district_name, population, [year] from Population_Each_City
unpivot
(
population for district_name in(bektemir, chilonzor, yakkasaroy)
) as unpivottable










