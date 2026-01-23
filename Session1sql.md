 					SQL(Structured Query Language)    						  1/20/2026
SQL: a language that is used to communicate with data base.
Data Base: A database is an organized collection of data, stored and retrieved digitally from a remote or local computer system. Databases can be vast and complex, and such databases are developed using fixed design and modeling approaches.
DBMS: It stores the data in a file format. DBMS is used to connect to the database servers.
RDBMS: It is a type of software that is used to maintain and manage the database by providing the 2 feautures. a. authorization, b. Security
Schema: A schema is a logical structure inside a database used to organize and manage database objects efficiently. Objects such as tables, views, indexes, functions, and procedures.
----------------------------------------------------------------------------------------------------------------------------------------------
Structured data is highly organised and stored in a fixed schema, usually in rows and columns. It fits well into relational databases and is easy to query using SQL.
Ex: customer tables, employee records, and transaction data stored in databases like MySQL or Oracle.
Semi-structured data:  does not follow a rigid table structure but still contains tags or keys that provide organisation. The schema is flexible and can evolve over time.
Ex: JSON, XML, and Avro files, commonly used in APIs, logs, and NoSQL databases like MongoDB.
Unstructured data:  has no predefined structure or schema. It is free-form and harder to analyse using traditional tools.
Ex: emails, PDFs, images, videos, audio files, and social media posts.
---------------------------------------------------------------------------------------------------------------------------------------------------
SQL COMMANDS: SQL commands are the instructions. it is used to communicate with the database. It is also used to perform specific tasks, functions and queries of data. 
->The standard SQL commands to interact with relational databases are CREATE, SELECT, INSERT, UPDATE and DROP. These commands can be classified into groups based on their nature. 
-> There are 5 types of SQL commands: DDL, DML, DCL, TCL and TQL  
  1. DQL (Data Query Language) : Used to retrieve data from databases. (SELECT)
 2. DDL (Data Definition Language) : Used to create, alter, and delete database objects like tables, indexes, etc. (CREATE, DROP, ALTER, RENAME, TRUNCATE) 
 3. DML (Data Manipulation Language): Used to modify the database. (INSERT, UPDATE, DELETE)
 4. DCL (Data Control Language): Used to grant & revoke permissions. (GRANT, REVOKE)
 5. TCL (Transaction Control Language): Used to manage transactions. (COMMIT, ROLLBACK, START TRANSACTIONS, SAVEPOINT)
---------------------------------------------
INSERT INTO:  Statement is used to add new rows of data to a table in the database.
TRUNCATE: Command is used to delete complete data from an existing table.
ALTER: command is used to add, delete or modify columns in an existing table. You should also use the ALTER TABLE command to add and drop various constraints on an existing table.
DROP: It is used to delete both the structure and the record stored in the table
 NOTE − You should be very careful while using this command because once a table is deleted then all the information available in that table will also be lost forever.
----------------------------------------------------------------------------------------------------------------------------------------------------------
Constraints in SQL:
Constraints are used to specify the rules concerning data in the table. 
->It can be applied for single or multiple fields in an SQL table during the creation of the table or after creating using the ALTER TABLE command. 
The constraints are: 
• NOT NULL - Restricts NULL value from being inserted into a column. 
• CHECK - Verifies that all values in a field satisfy a condition.
 • DEFAULT - Automatically assigns a default value if no value has been specified for the field.
• UNIQUE - Ensures unique values to be inserted into the field. 
 • PRIMARY KEY - Uniquely identifies each record in a table. 
• FOREIGN KEY - Ensures referential integrity for a record in another table.
PRIMARY KEY: A primary key is a field in a table that uniquely identifies each row/record in a database table. 
->Primary keys must contain unique values.
->A primary key column cannot have NULL values.
-> A table can have only one primary key, which may consist of single or multiple fields. When multiple fields are used as a primary key, they are called a composite key.
FOREIGN KEY: A foreign key is a key used to link two tables together.
-> A Foreign Key is a column or a combination of columns whose values match a Primary Key in a different table. 
->The relationship between 2 tables matches the Primary Key in one of the tables with a Foreign Key in the second table. 
->If a table has a primary key defined on any field(s), then you cannot have two records having the same value of that field(s).
-> The table with the foreign key constraint is labelled as the child table, and the table containing the candidate key is labeled as the referenced or parent table
-------------------------------------------------------------------------------------------------------------------------------------
Parent key: it is a primary key (or another unique key ) in the parent table that other tables reference.
 Child Key: it is a foreign key in the child table that stores the value of the parent key.
 keywords RESTRICT : where we don't let the child table operations delete the primary key in the parent table, which is used as FOREIGN Key references.
CASCADE: when you delete or update in a parent table, CASCADE makes matching rows in the child table automatically change too.
cascade type:
on delete cascade: if a parent row is deleted, all child rows that reference it are also deleted automatically.
on update cascade: if a parent key value is updated. The foreign key values in child rows are updated to the new value.

