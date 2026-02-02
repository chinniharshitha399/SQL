1. Display all customer details who have made more than 5 payments.

--Join customer and payment tables--Group by customer
--- First, count payments per customer in sakila.payment
---Use HAVING to filter customers with more than 5 payments
--- Then return full customer rows from sakila.customer for those customer_id values.
SELECT c.customer_id,c.first_name,c.last_name,c.email
FROM sakila.customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY  c.customer_id,c.first_name, c.last_name,c.email
HAVING COUNT(p.payment_id) > 5;

