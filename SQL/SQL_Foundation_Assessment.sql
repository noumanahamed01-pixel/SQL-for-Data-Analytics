-- 🏆 SQL Foundation Assessment

-- Rules
-- No ChatGPT, Google, or notes.
-- Think like you're in a real interview.
-- I'll evaluate your logic, not just the final answer.
-- Total: 20 marks (5 questions × 4 marks each).
-- Question 1 (Easy) – Window Function
-- You have a table:
		-- employees
		-- emp_id	emp_name	department	salary
		-- 1	Alice	HR	50000
		-- 2	Bob	HR	70000
		-- 3	Charlie	IT	80000
		-- 4	David	IT	75000
		-- 5	Emma	Sales	60000
-- Task
-- Write a SQL query to display:
	-- Employee Name
	-- Department
	-- Salary
	-- Rank of employees within their department based on salary (highest salary should get Rank = 1).

select 
	employee_name,
    department,
    salary,
    rank() over(partition by department order by salary desc) as rank_of_employee
from employe ;

-- 🧠 Question 2 (Intermediate)
-- You have the following table:
-- orders
		-- order_id	customer_id	order_date	amount
		-- 101	1	2024-01-10	500
		-- 102	1	2024-02-15	700
		-- 103	2	2024-01-20	900
		-- 104	2	2024-03-10	1200
		-- 105	3	2024-02-05	600
-- Task
-- Write a SQL query to display:
		-- customer_id
		-- order_date
		-- amount
		-- Previous order amount for the same customer
		-- Difference between the current order amount and the previous order amount

-- 💡 Hint: This is an interview question that tests whether you know how to use window functions effectively.
select 
	cust_id,
    order_date,
    order_amount,
    lag(order_amount,1) over(partition by cust_id order by order_date) as Previous_order_amount,
    (order_amount-lag(order_amount,1) over(partition by cust_id order by order_date)) as diff_from_prev
from orders;
 -- To avoid writing LAG() twice, professionals often do this:
 with previousorders as (
	select 
		cust_id,
		order_date,
		order_amount,
		lag(order_amount,1) over(partition by cust_id order by order_date) as Previous_order_amount
    from orders
)
select 
		*,
        order_amount-previous_order_amount as difference
from previousorders;


-- 🏆 Question 3 (Business Case Study)

-- You have two tables:
-- customers
		-- customer_id	customer_name	city
		-- 1	Alice	London
		-- 2	Bob	London
		-- 3	Charlie	Paris
		-- 4	David	Paris
		-- 5	Emma	Dubai
-- orders
		-- order_id	cust_id	order_amount
		-- 101	1	500
		-- 102	1	700
		-- 103	2	300
		-- 104	3	900
		-- 105	3	1200
		-- 106	4	400
		-- 107	5	1000
-- Task
-- Write one SQL query that returns:
		-- Customer Name
		-- City
		-- Total Amount Spent
		-- Average Spending of that Customer's City
		-- Show only customers whose total spending is greater than their city's average spending
-- Requirements
	-- ✅ Use a CTE
	-- ✅ Use an aggregate function
	-- ✅ No subquery inside the final WHERE clause
	-- ✅ Clean, interview-quality SQL
    create table customers(
    customer_id int primary key,
    customer_name varchar(15),
    city varchar(15));
    insert into customers values(1,'alice','london'),
    (2,'jhon','paris'),
    (3,'harry','dubai'),
    (4,'suresh','london'),
    (5,'anile','paris');
WITH OverAllSpending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        SUM(o.order_amount) AS Total_spent
    FROM customer c
    JOIN orders o
        ON c.customer_id = o.cust_id
    GROUP BY
        c.customer_id,
        c.customer_name,
        c.city
),
CityAverage AS (
    SELECT
        city,
        AVG(Total_spent) AS City_Avg
    FROM OverAllSpending
    GROUP BY city
)
SELECT
    o.customer_name,
    o.city,
    o.Total_spent,
    c.City_Avg
FROM OverAllSpending o
JOIN CityAverage c
    ON o.city = c.city
WHERE o.Total_spent > c.City_Avg;


-- 🏆 Question 4 (6 Marks)
-- You have the following table:
-- orders
		-- order_id	cust_id	order_date	order_amount
		-- 101	1	2024-01-10	500
		-- 102	1	2024-02-15	700
		-- 103	2	2024-01-20	900
		-- 104	2	2024-03-10	1200
		-- 105	3	2024-02-05	600
		-- 106	3	2024-04-18	1500
-- customers
		-- customer_id	customer_name
		-- 1	         Alice
		-- 2	          Bob
		-- 3	         Charlie
-- Task
-- Write a query that returns:
	-- Customer Name
	-- Total Spending
	-- Customer Rank (Highest spender = Rank 1)
	-- Percentage contribution of each customer to the overall company revenue

-- Example output:
	-- Customer	Total Spending	Rank	Contribution %
	-- Bob	        2100	      1	       38.89%
	-- Charlie	    2100	      1	       38.89%
	-- Alice	    1200	      3	       22.22%
-- Requirements
	-- ✅ Use a CTE
	-- ✅ Use a Window Function
	-- ✅ Use RANK()
	-- ❌ Don't use nested subqueries
    
with overallspendings as (
select
	o.cust_id,
	c.customer_name,
    sum(o.order_amount) as Total_Spent
from customers c 
join orders o on c.customer_id=o.cust_id
group by c.customer_id,c.customer_name
)

select 
	cust_id,
    customer_name,
    Total_Spent,
    rank() over(order by Total_Spent desc) as HighestRank,
    ROUND(
    (Total_Spent * 100.0) /
    SUM(Total_Spent) OVER(),
2) AS Contribution_Percentage
from overallspendings



    


	

    

	