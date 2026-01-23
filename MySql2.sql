--Syntax--
SELECT * FROM SAKILA.actor;--Shows all actors in the database.
SELECT COUNT(*) FROM SAKILA.category; --counts all rows.
SHOW TABLES FROM sakila; --Lists all tables in the sakila database
SELECT COUNT(DISTINCT TITLE) FROM SAKILA.FILM; --counts unique titles.
SELECT COUNT(TITLE) FROM SAKILA.FILM; --counts all titles, even duplicates
SELECT first_name, last_name FROM SAKILA.FILM LIMIT 50;--LIMIT shows only first 50 rows.
SHOW COLUMNS FROM SAKILA.FILM; --Shows column names, types, and details.
--Filtering WITH WHERE
SELECT * FROM SAKILA.FILM;
SELECT * FROM SAKILA.FILM WHERE rental_duration > 6; --Only shows films with rental_duration greater than 6.
SELECT * FROM SAKILA.FILM;
SELECT * FROM SAKILA.FILM WHERE RATING ='R' AND LENGTH >= 91;
SELECT * FROM SAKILA.FILM WHERE RATING ='G' AND LENGTH < 91;
--Example: Get movies with rating 'R' and length ≥ 91 minutes.
-----Filtering Data Using BETWEEN
SELECT * FROM SAKILA.FILM WHERE rental_duration BETWEEN 4 AND 6 ORDER BY rental_rate DESC;
BETWEEN 4 AND 6 = values from 4 to 6.
ORDER BY rental_rate DESC = sort highest to lowest.
------Filtering using OR
  SELECT * FROM SAKILA.FILM WHERE RATING = 'PG' OR rental_duration = 4 ORDER BY RENTAL_RATE DESC; --either condition can be true.
----FILTERING USING NOT
SELECT * FROM SAKILA.FILM
WHERE NOT RENTAL_DURATION NOT IN (0,7,3)
ORDER BY RENTAL_RATE ASC;
SELECT * FROM SAKILA.FILM WHERE NOT RENTAL_DURATION = 4 --OR WHERE RENTAL_DURATION =! 4
ORDER BY RENTAL_RATE ASC; ---NOT = opposite of condition,ASC = sort lowest to highest.
------SORT (ASCENDING & DESCENDING)
  SELECT RENTAL_RATE FROM SAKILA.FILM ORDER BY RENTAL_RATE DESC;
-----FILTERING WITH LIKE
SELECT CITY FROM SAKILA.CITY WHERE CITY LIKE 'A%S';
SELECT CITY FROM SAKILA.CITY WHERE CITY LIKE '_S___D%';









