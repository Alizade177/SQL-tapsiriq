select * from customers

--1 "Customers" cədvəli var.  Bu cədvəlin "City" sütununda hər bir şəhər üçün neçə müştərinin olduğunu göstərən stored procedur yazın.
CREATE PROCEDURE Customer_count
As
select 
C.City,
Count(C.CustomerID) as  number_of_customer
from 
customers as C
group by c.City

exec Customer_count

--2 "Orders” cədvəli var.Hər bir sifariş üçün Sifariş nömrəsini, müştəri adını, 
--sifariş tarixini və ümumi sifariş məbləğini ehtiva edən bu cədvəldə qaytaran funksiya yazın.

select
O.OrderID,
C.CustomerName,
O.OrderDate,
Sum(P.Price) as Total_Price
from
orders as O
Inner join order_details as OD
On
O.OrderID=OD.OrderID
Inner join customers as C 
On
O.CustomerID=C.CustomerID
Inner join  products as P
On
O.CustomerID=P.ProductID
group by 
O.OrderID,
C.CustomerName,
O.OrderDate,
P.Price
order by CustomerName desc



-- 3  “Employees” cədvəlindən hər bir işçinin adını və soyadını əlifba sırası ilə geri döndürən prosedur yazın.

CREATE PROCEDURE Customers_Name
As
select 
E.FirstName,
E.LastName
from 
employees as E
order by FirstName,LastName desc

exec Customers_Name


-- 4 "Products” cədvəli var.  Bu cədvəldə hər bir məhsulun adını və vahid qiymətini ehtiva edən nəticə dəstini qaytaran stored prosedurunu yazın.  
-- Nəticələr vahid qiymətə görə azalan qaydada sıralanmalıdır.

Create procedure Products_price
as
select 
P.ProductName,
P.Price
from
products as P
group by
P.ProductName,
P.Price
order by P.Price asc

exec Products_price

-- 5  "Orders” cədvəli var.  Bu cədvəldəki hər sifariş üçün sifariş nömrəsini, müştəri adını, sifariş tarixini və ümumi sifariş məbləğini ehtiva edən nəticə dəstini qaytaran stored prosedurunu yazın.  
-- Nəticələr sıra nömrəsinə görə artan qaydada sıralanmalıdır.


Create procedure Orders_information
as
select 
O.OrderID,
C.CustomerName,
O.OrderDate,
P.Price
from 
orders as O
Inner join customers as C
on
O.CustomerID=C.CustomerID
Inner join products as P
on
O.CustomerID=P.ProductID
group by 
O.OrderID,
C.CustomerName,
O.OrderDate,
P.Price
order by OrderID asc


exec Orders_information


-- 6  "Orders” cədvəli var.  Sifariş nömrəsini, müştəri adını, sifariş tarixini və ümumi sifariş məbləğini ehtiva edən bu cədvəldə 
-- hər bir sifariş üçün nəticə dəstini geriyə qaytaran funksiya yazın.

create function Orders_function(@order_id int, @customer_name varchar(255),@order_date date,@price real)
returns int
as  
begin 
return
end  


-- 7  "Customers” cədvəli var.  Bu cədvəldə hər bir müştəri üçün ad, şəhər və sifarişlərin sayını ehtiva edən nəticə dəstini qaytaran stored prosedurunu yazın.  
--Nəticələr sifarişlərin sayına görə azalan qaydada sıralanmalıdır.

SELECT 
C.CustomerName,
C.City,
Count(O.OrderID) as orders_count
from
customers as C
Inner join orders as O
On
C.CustomerID=O.OrderID
group by 
C.CustomerName,
C.City,
O.OrderID
order by O.OrderID desc