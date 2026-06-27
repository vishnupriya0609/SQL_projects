CREATE DATABASE PROJECT;    -- creating database
USE PROJECT;
CREATE TABLE COMPANY(
    EMP_ID INT,
    EMP_NAME VARCHAR(10),
    EMP_ROLE VARCHAR(20),
    EMP_AGE INT,                       -- create table 
    EMP_SALARY DECIMAL(10,2),
    LOCATION VARCHAR(10)
);
ALTER TABLE COMPANY
ADD COLUMN EMAIL VARCHAR(100);           -- add new column
ALTER TABLE COMPANY
RENAME COLUMN EMP_SALARY TO SALARY;      -- rename column
ALTER TABLE COMPANY
MODIFY COLUMN SALARY DECIMAL(10,2) AFTER LOCATION;    -- modify column using AFTER 
ALTER TABLE COMPANY
MODIFY COLUMN EMP_ID VARCHAR(10);        -- modify column only datatype

INSERT INTO COMPANY
(EMP_ID, EMP_NAME, EMP_ROLE, EMP_AGE, LOCATION, SALARY)      -- insert datas into table
VALUES
(101, 'vishnu', 'Developer', 25, 'Chennai', 55000.00),
(102, 'priya', 'Tester', 27, 'Bangalore', 50000.00),
(103, 'Pavi', 'Manager', 35, 'Hyderabad', 85000.00),
(104, 'Santhiya', 'Analyst', 28, 'Pune', 60000.00),
(105, 'Nithiya', 'Designer', 30, 'Mumbai', 65000.00),
(106, 'Abi', 'Developer', 24, 'Chennai', 58000.00),
(107, 'Bhuvi', 'Tester', 26, 'Delhi', 52000.00),
(108, 'Kethsey', 'Manager', 40, 'Bangalore', 95000.00);

SELECT * FROM COMPANY;

SELECT * FROM COMPANY 
ORDER BY SALARY DESC
LIMIT 8;                           -- ORDER BY clause

UPDATE COMPANY 
SET SALARY = 45000.00
WHERE EMP_ID = 106;                -- UPDATE 

DELETE FROM COMPANY
WHERE EMP_ID=108;                  -- DELETE 