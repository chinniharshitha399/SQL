--1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
SELECT email, COUNT(*) AS duplicate_count
FROM customer
GROUP BY email          --Groups rows that have the same email
HAVING COUNT(*) > 1;    --Counts how many times each email appears--HAVING COUNT(*) > 1 → Shows only duplicates (emails appearing more than once)

--Since I cannot use customer_id, I group customers by a  column like email and use COUNT(*).If the count is greater than 1, that means duplicates exist
_____________________________________________________________________________________________________________________________________________________________
--2. Number of times letter 'a' is repeated in film descriptions



_______________________________________________________________________________________________________________________________
--3.Number of times each vowel is repeated in film descriptions


____________________________________________________________________________________________________________________________________________________
--4. Display the payments made by each customer 1. Month wise  2. Year wise  3. Week wise

--month wise  --I used MONTH() function with GROUP BY to get monthly payments per customer.
SELECT 
    customer_id,
    MONTH(payment_date) AS payment_month, --we'll get month (1–12)
    SUM(amount) AS total_payment  ---sum-total payment in that month
FROM payment
GROUP BY customer_id, MONTH(payment_date)        --groups data customer-wise and month-wise
ORDER BY customer_id, payment_month;

