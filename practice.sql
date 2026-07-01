-- PART B

CREATE DATABASE BANK_ACCOUNT;                        -- create db
USE BANK_ACCOUNT;                                    -- use db

CREATE TABLE BANK_EMPLOYEE(
	EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(30),                          -- create table
    SALARY DECIMAL(10,2)
    );
    
    INSERT INTO BANK_EMPLOYEE VALUES
    (101,'RAHUL','IT',45000),
    (102,'PRIYA','HR',52000),                       -- insert values
    (103,'AMIT','FINANCE',60000),
    (104,'SNEHA','IT',48000),
    (105,'JOHN','HR',55000);
    
    -- PART C
    
    START TRANSACTION;
    UPDATE BANK_EMPLOYEE SET SALARY = SALARY+5000 WHERE EMP_ID=101;        -- 1. increase salary and rollback before commit             
    SELECT * FROM BANK_EMPLOYEE WHERE EMP_ID=101;
    ROLLBACK;
    
    START TRANSACTION;
    UPDATE BANK_EMPLOYEE SET SALARY = SALARY*1.10 WHERE EMP_ID >=101;      -- 2. increase salary by 10% and commit
    SELECT * FROM BANK_EMPLOYEE WHERE EMP_ID>=101;
    COMMIT;
    SELECT * FROM BANK_EMPLOYEE;
    
    START TRANSACTION;
    UPDATE BANK_EMPLOYEE SET SALARY=SALARY+3000 WHERE EMP_ID=101;
    SAVEPOINT SP1;                                                          -- 3. increase rahul salary by 3000 and use savepoint then 
                                                                            -- increase priya salary by 5000 and use rollback and 
                                                                            -- see whu=ich employee salary is rolled back
    UPDATE BANK_EMPLOYEE SET SALARY = SALARY+5000 WHERE EMP_ID=102;
    ROLLBACK TO SP1;
    SELECT * FROM BANK_EMPLOYEE;
    
	START TRANSACTION;
    DELETE FROM BANK_EMPLOYEE WHERE DEPARTMENT= 'HR' ;                   -- 4. delete HR emp and rollback
    SELECT * FROM BANK_EMPLOYEE;
    ROLLBACK;
    SELECT * FROM BANK_EMPLOYEE WHERE DEPARTMENT='HR';
    
    START TRANSACTION;
    DELETE FROM BANK_EMPLOYEE WHERE DEPARTMENT='FINANCE';               -- 5. delete FINANCE emp and commit then rollback
    SELECT * FROM BANK_EMPLOYEE;
    COMMIT;
    ROLLBACK;