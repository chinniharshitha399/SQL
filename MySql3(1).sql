--Subqueries -- A subquery is a query written inside another query. The inner query runs first and its result is used by the outer query.
---Explanation (Beginner-friendly):
--Inner query gets a list of address_id
--Outer query finds customers whose address_id matches that list
--IN means: check if value exists in the result of subquery

SELECT first_name, last_name
FROM sakila.customer
WHERE address_id IN (            
SELECT address_id
FROM sakila.customer
);
---Actors who acted in more than 10 films
--Key Points: Subquery calculates actors with more than 10 films. Main query fetches actor details

HAVING is used with aggregate functions like COUNT()
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id IN (
SELECT actor_id
FROM sakila.film_actor
GROUP BY actor_id
HAVING COUNT(film_id) > 10
);

---Subquery in SELECT clause
--explanation: Subquery runs for each actor. Counts number of films per actor

This is also a correlated subquery (uses outer query column)
SELECT actor_id,first_name,last_name,
(
SELECT COUNT(*)
FROM sakila.film_actor
WHERE film_actor.actor_id = actor.actor_id
) AS film_count
FROM sakila.actor;

---Derived Tables-A derived table is a subquery that acts like a temporary table.
SELECT a.actor_id, a.first_name, a.last_name, fa.film_count
FROM sakila.actor a
JOIN (
SELECT actor_id, COUNT(film_id) AS film_count
FROM sakila.film_actor
GROUP BY actor_id
HAVING COUNT(film_id) > 10
) fa ON a.actor_id = fa.actor_id;

----Top 5 customers by total payment
SELECT customer_id, total_spent
FROM (
SELECT customer_id, SUM(amount) AS total_spent
FROM sakila.payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5
) AS top_customers;

--Order of Execution: FROM - WHERE - GROUP BY- HAVING- SELECT-ORDER BY
----When to use Subqueries
SELECT customer_id, amount
FROM sakila.payment
WHERE amount > (
SELECT AVG(amount)
FROM sakila.payment
);

---When Subqueries Fail
SELECT first_name,
(SELECT address_id FROM sakila.address WHERE district = 'California') AS cali_address
FROM sakila.customer;
--Subquery returns multiple rows
---Scalar subquery must return only ONE value

---Correlated Subqueries
SELECT title,
(SELECT COUNT(*)
FROM sakila.film_actor fa
WHERE fa.film_id = f.film_id) AS actor_count
FROM sakila.film f;
--Payments higher than customer’s average
SELECT payment_id, customer_id, amount, payment_date
FROM sakila.payment p1
WHERE amount > (
SELECT AVG(amount)
FROM sakila.payment p2
WHERE p2.customer_id = p1.customer_id
);




