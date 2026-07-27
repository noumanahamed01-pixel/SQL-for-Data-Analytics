create table customer(
customer_id int primary key,
customer_name varchar(15),
city varchar(20));
create table orders(
order_id int primary key,
cust_id int,
order_amount int,
order_date date);
alter table orders add constraint fk_cust foreign key(cust_id) references customer(customer_id);

insert into customer 
values (1,'alice','london'),
(2,'bruce','paris'),
(3,'john','vegas'),
(4,'petter','maldivas'),
(5,'harry','abudhabi');
select * from customer;
insert into orders 
values(101,1,50000,'2023-07-12'),
(102,2,74500,'2025-02-01'),
(103,3,980000,'2017-10-23'),
(104,4,134070,'2026-03-21'),
(105,5,2300000,'2026-07-21');
select * from orders;

select avg(order_amount) from orders;

-- customer whose spending more than the average spending of all customers
with CustomerSpending as(
select cust_id, sum(order_amount) as total_spent
from orders 
group by cust_id)
select c.customer_name,c.city,cs.total_spent
from CustomerSpending cs
join customer c
on cs.cust_id=c.customer_id
where cs.total_spent > 
( select avg(total_spent) from CustomerSpending);

-- Customer Who spending less than the average spending all customers
with CustomerSpending as(
select cust_id, sum(order_amount) as total_spent
from orders group by cust_id)
select c.customer_name,c.city,o.total_spent
from CustomerSpending o
join customer c
on o.cust_id=c.customer_id
where o.total_spent < (
select avg(total_spent) from CustomerSpending);
select * from customer;
insert into customer values (6,'philips','london'),
(7,'ramesh','india'),
(8,'rakesh','india'),
(9,'suhash','india'),
(10,'david','london');
insert into orders values(106,6,75000,'2025-07-12'),
(107,7,8200,'2015-01-23'),
(108,8,17000,'2026-01-11'),
(109,9,340000,'2026-05-07'),
(110,10,992020,'2026-04-30');
select * from orders;

-- Return only those customers whose total spending is greater than the average spending of customers in the same city.
with OverAllSpending as (
select c.customer_id,c.customer_name,c.city,sum(s.order_amount) As Total_spent from customer c join orders s
on c.customer_id=s.cust_id group by s.cust_id,c.customer_name,c.city
),
CityAverage as (
select city,avg(Total_spent) as AvgCity_spent  from OverAllSpending
group by city )

-- join 
SELECT 
    o.customer_id,
    o.customer_name,
    o.city,
    o.Total_spent,
    ca.AvgCity_spent
FROM OverAllSpending o
JOIN CityAverage ca 
    ON o.city = ca.city;