--INDEXING?                                                                                                                                                                              04/02/2026
--Indexing improves query performance by reducing the number of rows scanned, but it increases storage and slows down write operations.
--Without an index:Database performs a full table scan , Checks every row one by one
--With an index:Database performs an index scan , Jumps directly to the required rows
 Example: CREATE INDEX idx_employee_name ON employees (name);
  --DROPINDEX:Usedtoremove an existing index from a table.
 Example: DROP INDEX idx_employee_name;

---clustered index determines the physical order of rows in a table.(clustered index stores the table data in the same order as the index.)
--only ONE clustered index per table (because data can be sorted only one way)
--Usually created on PRIMARY KEY
---------------
Non-clustered index:
   - Separate structure from table data
  --stores Indexed column values
-- can have multiple non-clustered indexes
--Takes extra storage
-------------
Natural Key and surroget key: 
--Natural key: A natural key is a column (or set of columns) that naturally identifies a record using real-world data.
Examples: email, SSN, passport_number
-----
Surroget Key : A surrogate key is an artificially generated unique identifier used only for database purposes.
  ex: employee Id, Auto-increment ID, 
--Surrogate key → Primary Key
--Natural key → Unique constraint


____________________________________________________________
Query Fine-Tuning Techniques
---use sakila;
---1. use only necessary coloumns(avoid select *)
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER;

--2. Use  WHERE before GROUP BY and HAVING
select store_id count(*) as total_customers
from sakila.customer
where active = 1
GROUP BY store_id
HAVING COUNT (*)> 200;

---3.Use JOIN instead of SUBQUERY
---SUBQUERY is less effecient
select first_name FROM customer WHERE store_id IN (SELECT store_id from store WHERE  address_id=1);
---Equivalent JOIIN (more effecient)

----4. avoid functions on indexed coloumns
--BAD: cannot use index
 explain select * from rental WHERE year(rental_date)=2005;

--BETTER: preserves index
explain select * from rental WHERE rental_date BETWEEN '2005-01-01' AND '2005-12-31'

--5.use LIMIT effectively
select * from film
ORDER BY film_id LIMIT 1000;
---6.use CTE for readable query breakdown
--7. use EXPLAIN to  understand query execution plan 
----8. Maintanence Commands(run periodically)
ANALYZE TABLE cutomer;
OPTIMIZE TABLE rental;
--9. Avoid large OFFSETS in pagimentation 
--ineffecient:
SELECT * FROM sakila.payment LIMIT 1000, 10




  
