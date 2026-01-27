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
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id IN (
SELECT actor_id
FROM sakila.film_actor
GROUP BY actor_id
HAVING COUNT(film_id) > 10
);
