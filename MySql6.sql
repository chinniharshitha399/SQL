---CTE, Temporary Tables, Views ---                                                                                                                                                                     02/02/2026

--CTE(common table expressions): 
   -- It is a temporary, named result set in SQL.cte break down complex SQL statements into smaller, more manageable parts, making the code easier to read, write, and maintain. 
   --CTEs are commonly used when working with multiple subqueries. 
  --It does not store data permanently.
    ----cte is query level
syntax: WITH cte_name (column1, column2, ...) AS (
    -- Query that defines the CTE
    SELECT ...
    FROM ...
    WHERE ...
)
-- Main query
SELECT ...
FROM cte_name;
--WITH: Initiates the CTE definition.

--Find customers and their total payment amount
WITH customer_payments AS (                                                                       
    SELECT customer_id, SUM(amount) AS total_spent
    FROM sakila.payment
    GROUP BY customer_id   --all payments made by the same customer are combined into a single row.

)
SELECT customer_id, total_spent       --normal table.
FROM customer_payments                        --reading data from the temporary table we created
ORDER BY total_spent DESC;               --customers who spent the most appear at the top.
--First, in the WITH , I create a CTE called customer_payments
--Inside this CTE, I select each customer_id from the sakila.payment table and calculate the total amount spent by that customer using SUM(amount).

---Recursive Common Table Expressions (CTEs): allows the query to perform repeated operations.
--Syntax:
   WITH RECURSIVE cte AS (
       anchor_query
       UNION ALL
       recursive_query referencing cte
   )
   SELECT * FROM cte;
ex: WITH RECURSIVE numbers AS (
    SELECT 1 AS n         
    UNION ALL
  --step: 2 recursive member(generate next number)
    SELECT n + 1          -- Recursive member
    FROM numbers            
    WHERE n < 10             
)
SELECT * FROM numbers;
--Starts with 1 , keeps adding +1 until n reaches 10
_____________________________________________________
--2 Recursive CTE Example: Last 10 rental days

WITH RECURSIVE dates AS (
    SELECT DATE(MAX(rental_date)) - INTERVAL 9 DAY AS rental_day
    FROM sakila.rental

    UNION ALL

    SELECT rental_day + INTERVAL 1 DAY
    FROM dates                                      --UNION ALL: the recursive part keeps adding 1 day at a time to the previous date.
                                                     --This recursion continues until it reaches the maximum rental date
    WHERE rental_day + INTERVAL 1 DAY <= (
        SELECT DATE(MAX(rental_date))
        FROM sakila.rental
    )
)
SELECT d.rental_day, COUNT(r.rental_id) AS rentals
FROM dates d
LEFT JOIN sakila.rental r ON DATE(r.rental_date) = d.rental_day          --LEFT JOIN - even days with zero rentals will still appear in the result.
GROUP BY d.rental_day;                                                ---group by how many rentals happened per day.
___________________________________________
 --Validation query  --how many rentals were made on February 14, 2006.
 
 select date(rental_date), count(*)      --date(rental_date) :  extract only the date part, ignoring the time., count: calculating the total number of rental records for that date.
 from sakila.rental
   where date(rental_date)= '2006-02-14'
 group by date(rental_date);            
--GROUP BY is  required for aggregate function (count (*))
_____________________________________________________________________________--------
----TEMPORARY TABLES --Stored temporarily
--Can be reused multiple times
  --Automatically disappears when session ends
 --Avoid writing long queries repeatedly
   - Useful after joins when analysis is bigger

     
--- Create Temporary Table for Top 5 Categories

DROP TEMPORARY TABLE IF EXISTS sakila.top_categories;

CREATE TEMPORARY TABLE sakila.top_categories AS
SELECT c.name AS category_name, c.category_id, COUNT(*) AS rental_count
FROM sakila.rental r
JOIN sakila.inventory i ON r.inventory_id = i.inventory_id
JOIN sakila.film f ON i.film_id = f.film_id
JOIN sakila.film_category fc ON f.film_id = fc.film_id
JOIN sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name, c.category_id
ORDER BY rental_count DESC
LIMIT 5;
____________________________________
--VIEWS : IT is a virtual table. does NOT store data . It stores a SQL query, reusability
--once created a veiw , it wil store in schema 
--For security & access control
--We can:Expose only required columns
--Hide sensitive data (salary, phone, email, etc.)
--VIEWS has made it easier to read the data, improved security, increased storage capacity.


