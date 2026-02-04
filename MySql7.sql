---STORED PROCEDURES---                                                                                                                                                                     03/02/2026

--A Stored Procedure is a set of SQL statements stored in the database that can be executed multiple times.
--It helps to simplify complex logic, improves performance since it’s precompiled, and enhances security because users can run the procedure without direct table access. , Reusability (by using CALL funtion )
--For example, I can create a procedure to fetch all payments of a customer and call it whenever needed
 --disadvantage of stored procedure is that it can be executed nowhere except in the database and occupies more memory in the database server
--STORE PROCEDURE ARE STORED IN META

--DELIMITER: end-of-statement symbol //
Syntax:
     DELIMITER //
     CREATE PROCEDURE ...
     BEGIN
        ...
     END//
     DELIMITER ;

  --INPUT PARAMETER : An input parameter is a value that you pass into a stored procedure when you call it.The procedure can then use this value inside its SQL statements.
--It allows the procedure to perform dynamic operations(same procedure can perform different actions or return different results depending on the input parameters.). 
   --  For example, I can write a procedure to fetch all payments of a specific customer by passing the customer ID as an input parameter. 
     --This makes the procedure reusable for any customer without rewriting the query.

--OUTPUT PARAMETER STORED PROCEDURE
--output value returned by the procedure
Parameter                                 Type	                                                                       Direction	Purpose	Example Use
IN Into procedure	                 Pass data to the procedure	                                                      Customer ID to fetch payments
OUT Out of procedure	             Return data from the procedure	                                             Total payment amount of customer
INOUT Both ways	                    Pass data in and get modified value back	                                   Start balance sent in, procedure adds deposits, returns new balance

---DYNAMIC SQL PROCEDURE: IT allows us to create and run SQL queries dynamically.
 --It’s useful when we don’t know the table, column, or filter condition in advance. 
--For example, a procedure can query any table or any column based on input parameters, making it flexible and reusable.




