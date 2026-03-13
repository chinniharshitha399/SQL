---STRING FUNCTIONS
--1. LEFT PADDING
select title, LPAD(TITLE,20, '*') AS left_padded
from sakila.film
limit5;                                   -- This adds padding to the left of the title.
----2.Padding on both sides
SELECT title, RPAD(LPAD(title, 20, '*'),25,'*') AS right_padded           --LPAD(title, 20, '*') -adds padding to the left of the title.
FROM sakila.film                                                          --RPAD( ,25,'*') -adds padding to the RIGHT of the title.
LIMIT 3;

------SUBSTRING --SUBSTRING is used to extract part of a string starting from a given position for a given length.
---SUBSTRING(string, start_position, length)

SELECT title, SUBSTRING(title, 3,9) AS short_title   ----title → the column name;3 → start from 3rd character;9 → take 9 characters)
FROM sakila.film;

---CONCATINATION --CONCAT joins strings together into a single output string.
SELECT CONCAT(first_name, '.', last_name) AS full_name
FROM sakila.customer;

----REVERSE (reverse characters)
SELECT title, REVERSE(title) AS reversed_title
FROM sakila.film                                   --- It selects movie titles and displays their reversed text for the first five films.
LIMIT 5;

----LENGTH -- used to count the number of characters in a string.
SELECT title, LENGTH(title) AS title_length
FROM sakila.film                   
WHERE LENGTH(title) = 8;

---SUBSTRING with LOCATE  -- We use SUBSTRING and LOCATE to extract a specific part of a string, like getting the email domain.
 select email from sakila.customer;
SELECT email,
SUBSTRING(email, LOCATE('@', email) +1) AS domain -----[LOCATE('@', email) finds the position of '@' in the email]
                                                      --[SUBSTRING(email, LOCATE('@', email) + 1) returns everything after '@'.]
FROM sakila.customer;


----SUBSTRING , LOCATE , SUBSTRING_INDEX

--extracts the domain extension (like com, net, org) from each email in the sakila.customer table.
--LOCATE('@', email): Finds the position of @ in the email string.
--SUBSTRING(email, LOCATE('@', email) + 1): Extracts the string after @
-- substring_index(..., '.', -1): SUBSTRING_INDEX(str, delimiter, count) splits str by delimiter and returns part based on count.  
SELECT email,
substring_index(SUBSTRING(email, LOCATE('@', email) + 1), '.', -1) AS domain   
FROM sakila.customer;

-------SUBSTRING_INDEX
--extracts the part of an email before the '@' symbol using SUBSTRING_INDEX. It's useful to get the username from an email
select substring_index(email,'@', 1) from sakila.customer;

---UPPER / LOWER 
--UPPER(title) → converts the title to all uppercase letters.
---lower(title) → converts the title to all lowercase letters.
---LIKE '%LOVELY%' → finds titles that contain the word 'LOVELY' anywhere. % is a wildcard.
--LIKE '%MAN' → finds titles that end with 'MAN'.

SELECT title, UPPER(title),lower(title)
FROM sakila.film
WHERE UPPER(title) LIKE '%LOVELY%' or UPPER(title) LIKE '%MAN';
select title, lower(title) as lower_titles
FROM sakila.film;

---REPLACE--used to substitute a specific substring with another value
SELECT title, REPLACE(title, 'A', 'x') AS cleaned_title  --creates a new column called cleaned_title where:Every capital letter 'A' in the title is replaced by 'x'.
FROM sakila.film
WHERE title LIKE '% %';

---REGEXP (Regular Expressions) :using REGEXP in SQL to write more dynamic and flexible queries.
--not contains 3 consecutive vowels
SELECT customer_id, last_name
FROM sakila.customer
WHERE last_name NOT REGEXP '[^aeiouAEIOU]{3}';

--count
select right(title,1), count(*)
FROM sakila.film
WHERE title REGEXP '[aeiouAEIOU]$'
group by right(title,1)

-----MATH
  --ON PAYMENTS
SELECT customer_id,
COUNT(payment_id) AS payments,
SUM(amount) AS total_paid,
SUM(amount) / COUNT(payment_id) AS avg_payment
FROM sakila.payment
GROUP BY customer_id;

----ADD CILOUMN
ALTER TABLE sakila.film
ADD COLUMN cost_efficiency_dup1 DECIMAL(6,2);
--SAFE UPDATES
SET SQL_SAFE_UPDATES = 0;

---DATADIFF
--DATEDIFF(return_date, rental_date) gives days between dates.return_date must be NOT NULL for meaningful result.

SELECT rental_id, return_date,rental_date, DATEDIFF(return_date, rental_date) AS days_rented 
  FROM sakila.rental
WHERE return_date IS NOT NULL;

Numerical & Date Built-in Functions
-- built-in functions for numeric and date data types, including:-FLOOR;CEIL;RAND;MOD;ROUND;POWER;DATEDIFF;MONTHNAME;DAY;YEAR;YEARWEEK
--The CEIL() function returns the smallest integer value that is bigger than or equal to a number.
---CASTING --MODIFIES SCHEMA
ALTER TABLE sakila.payment   ---Adds a new column amount_str 
ADD COLUMN amount_str VARCHAR(20);
SET SQL_SAFE_UPDATES = 0;





