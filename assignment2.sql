--1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
SELECT email, COUNT(*) AS duplicate_count
FROM customer
GROUP BY email          --Groups rows that have the same email
HAVING COUNT(*) > 1;    --Counts how many times each email appears--HAVING COUNT(*) > 1 → Shows only duplicates (emails appearing more than once)

--Since I cannot use customer_id, I group customers by a  column like email and use COUNT(*).If the count is greater than 1, that means duplicates exist
_____________________________________________________________________________________________________________________________________________________________
--2. Number of times letter 'a' is repeated in film descriptions
SELECT
  SUM(
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'a', ''))
  ) AS total_a_count
FROM sakila.film;


_______________________________________________________________________________________________________________________________
--3.Number of times each vowel is repeated in film descriptions
SELECT
  SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'a', ''))) AS a_count,
  SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'e', ''))) AS e_count,
  SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'i', ''))) AS i_count,
  SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'o', ''))) AS o_count,
  SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'u', ''))) AS u_count
FROM sakila.film;
--LOWER(description)--converts everything to lowercase.
--LENGTH(LOWER(description))--Counts total number of characters in the description.
--LENGTH(REPLACE(LOWER(description), 'a', ''))- Counts characters after removing ‘a’.
--LENGTH(original) - LENGTH(without 'a')--The difference tells us how many times ‘a’ appeared.

____________________________________________________________________________________________________________________________________________________
--4. Display the payments made by each customer 1. Month wise  2. Year wise  3. Week wise

--month wise  --used MONTH() function with GROUP BY to get monthly payments per customer.
SELECT 
    customer_id,
    MONTH(payment_date) AS payment_month, --we'll get month (1–12)
    SUM(amount) AS total_payment  ---sum-total payment in that month
FROM payment
GROUP BY customer_id, MONTH(payment_date)        --groups data customer-wise and month-wise
ORDER BY customer_id, payment_month;
--  Year-wise
SELECT
  customer_id,
  YEAR(payment_date) AS pay_year,
  COUNT(*)           AS payment_count,
  SUM(amount)        AS total_paid
FROM sakila.payment
GROUP BY customer_id, YEAR(payment_date)
ORDER BY customer_id, pay_year;

-- Week-wise
-- WEEK(payment_date) gives a week number (0–53 ).

SELECT
  customer_id,
  YEAR(payment_date) AS pay_year,
  WEEK(payment_date) AS pay_week,
  COUNT(*)           AS payment_count,
  SUM(amount)        AS total_paid
FROM sakila.payment
GROUP BY customer_id, YEAR(payment_date), WEEK(payment_date)
ORDER BY customer_id, pay_year, pay_week;
___________________________________________________________________________________________________________________________________________________________________________________________________________
5. Check if a given year is a leap year or not (no Sakila tables).Write within SELECT query with hardcoded date/year.
--  checking if february has 29 days for that year
  SELECT
  2026 AS given_year,
  CASE
    WHEN DAY(LAST_DAY('2026-02-01')) = 29 THEN 'Leap Year'
    ELSE 'Not a Leap Year'
  END AS leap_year_result;
_______________________________________________________________________________________________________________________________________________________________________
6. Display number of days remaining in the current year from today.
    --Find last day of current year, then DATEDIFF(last_day, today).
SELECT
  CURDATE() AS today,
  (MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL 1 YEAR - INTERVAL 1 DAY) AS last_day_of_year,
  DATEDIFF(
    (MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL 1 YEAR - INTERVAL 1 DAY),
    CURDATE()
  ) AS days_remaining_in_year;
____________________________________________________________________________________________________________________________________________________________________________________________________________
7.Display quarter number (Q1,Q2,Q3,Q4) for payment dates.

--Quater () function, concate it to payment */
SELECT
  payment_id,
  payment_date,
  CONCAT('Q', QUARTER(payment_date)) AS quarter_label
FROM sakila.payment;
_____________________________________________________________________________________________________________________________________________________________________________________
