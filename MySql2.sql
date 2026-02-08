--Syntax--                                                                                                                                     01/22/2026
SELECT * FROM sakila. actor;
 SELECT DISTINCT first_name from sakila.actor; ---distinct Removes duplicate values.
-------
SELECT * FROM SAKILA.actor;--Shows all actors in the database.
SELECT COUNT(*) FROM SAKILA.category; --counts all rows.
SHOW TABLES FROM sakila; --Lists all tables in the sakila database
SELECT COUNT(DISTINCT TITLE) FROM SAKILA.FILM; --counts unique titles.
SELECT COUNT(TITLE) FROM SAKILA.FILM; --counts all titles, even duplicates
SELECT first_name, last_name FROM SAKILA.FILM LIMIT 50;--LIMIT shows only first 50 rows.
SHOW COLUMNS FROM SAKILA.FILM; --Shows column names, types, and details.
-----is null
 select * from sakila.film where original_language_id is null;
 select count(*) from sakila.film ;
 select * from sakila.film;

--Filtering WITH WHERE

SELECT * FROM SAKILA.FILM;
SELECT * FROM SAKILA.FILM WHERE rental_duration > 6; --Only shows films with rental_duration greater than 6.
SELECT * FROM SAKILA.FILM;
SELECT * FROM SAKILA.FILM WHERE RATING ='R' AND LENGTH >= 91;
SELECT * FROM SAKILA.FILM WHERE RATING ='G' AND LENGTH < 91;
--Example: Get movies with rating 'R' and length ≥ 91 minutes.

------MUTIPLE AND & OR TOGETHER
SELECT * FROM SAKILA.FILM
  WHERE RENTAL_DURATION=6 AND (RATING='G' OR RATONG ='PG');
  ORDER BY RENTAL_RATE ASC;

---SORT(ASCENDING & DESCENDING)
SELECT RENTAL_RATE FROM SAKILA.FILM ORDER BY RENTAL_RATE DESC;

SELECT * FROM SAKILA.actor WHERE first_name BETWEEN 'A' AND 'M'; ---Works like numbers but for alphabetical ranges.

-----Filtering Data Using BETWEEN

SELECT * FROM SAKILA.FILM WHERE rental_duration BETWEEN 4 AND 6 ORDER BY rental_rate DESC;
BETWEEN 4 AND 6 = values from 4 to 6.
ORDER BY rental_rate DESC = sort highest to lowest.
  
------Filtering using OR
  
  SELECT * FROM SAKILA.FILM WHERE RATING = 'PG' OR rental_duration = 4 ORDER BY RENTAL_RATE DESC; --either condition can be true.

----FILTERING USING NOT
--<>  : Best for single value comparison
--NOT IN: Best when multiple values need exclusion

SELECT * FROM SAKILA.FILM
WHERE NOT RENTAL_DURATION NOT IN (0,7,3)
ORDER BY RENTAL_RATE ASC;
--
SELECT * FROM SAKILA.FILM WHERE NOT RENTAL_DURATION = 4 --(OR) WHERE RENTAL_DURATION =! 4
ORDER BY RENTAL_RATE ASC; ---NOT = opposite of condition,ASC = sort lowest to highest.

-----FILTERING WITH LIKE

SELECT CITY FROM SAKILA.CITY WHERE CITY LIKE 'A%S'; --- 'A&s'  --FOLIO CARD --% = any number of characters
SELECT CITY FROM SAKILA.CITY WHERE CITY LIKE '_S___D%';        --FOLIO CARD---   _ = exactly one character

---FILTERING WITH NULL VALUE

SELECT RENTAL_ID, INVENTORY_ID, CUSTOMER_ID, RETURN_DATE  --find missing/empty values.
FROM SAKILA.RENTAL
WHERE RETURN_DATE IS NULL;  ---- CHECK RENTALS THAT ARE NEVER RETURNED 

-----Filter by dates

SELECT RENTAL_ID, INVENTORY_ID, CUSTOMER_ID, RETURN_DATE
FROM SAKILA.RENTAL
WHERE RETURN_DATE BETWEEN '2005-05-02' AND '2005-5-27'; ---Only shows rentals within this date range.

---FILTER WITH TEXT INSIDE A COLUMN 
SELECT * FROM SAKILA.FILM WHERE release_year = 2006 AND RENTAL_DURATION = 6 AND DESCRIPTION LIKE '%Action%';  --(WE USED MULTIPILE CONDITIONS)

--GROUPBY AND HAVING  # TO CHECK THE DUPLICATES / TO SELECT THE DUPLICATES ALSE WE USE GROUPBY/HAVING

SELECT CUSTOMER_ID, COUNT(*) AS COUNT --COUNT(*) = count rows in each group.
FROM SAKILA.RENTAL
GROUP BY CUSTOMER_ID; ---GROUP BY = group rows by a column
HAVING COUNT(*) <= 30 -- HAVING filters after grouping (WHERE filters rows, Having filters group)
ORDER BY COUNT DESC;

--
SELECT first_name  
FROM SAKILA.actor
WHERE first_name BETWEEN 'A' AND 'D'
GROUP BY first_name
HAVING COUNT(*) > 1;  -- Only shows names with more than 1 occurrence.

-------------------------
Keyword	Meaning
SELECT *  --     	Get all columns
COUNT(*)	--      Count rows
DISTINCT  --    	Only unique values
WHERE	    ---     Filter rows
AND	      --      Both conditions must be true
OR	      --      Either condition can be true
NOT	      --      Opposite of condition
BETWEEN	  --      Filter between two values
LIKE	    --       Filter text with pattern
IS NULL   --      	Check for empty values
GROUP BY  --      	Group rows together
HAVING	  --        Filter groups
ORDER BY	 --        Sort results
















