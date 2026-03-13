--create database
CREATE DATABASE school_db;
USE school_db;
----CREATE TABLE
CREATE TABLE Student_table (
    StudentID INT,
    Name VARCHAR(50),
    Age INT
);
----insert
INSERT INTO Student_table (StudentID, Name, Age)
VALUES
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 21);
----select
--SELECT * FROM Students; --for selecting all columns
SELECT Name, Age FROM Student_table ;
----alter
SELECT * FROM Student_table;
ALTER TABLE Student_table
ADD Email VARCHAR(100);--(adding a column)
--
SELECT * FROM Student_table;
ALTER TABLE Student_table
RENAME COLUMN Email TO email_id; -- rename
---
ALTER TABLE Student_table
MODIFY Name VARCHAR(100);--Modify the column size
---
DROP TABLE IF EXISTS Students;---drop means delete
CREATE TABLE Students(
 ID INT NOT NULL UNIQUE,
 LastName VARCHAR(55) NOT NULL,
 FirstName VARCHAR(55) NOT NULL,
 Age INT
 );






