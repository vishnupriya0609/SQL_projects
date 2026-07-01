CREATE DATABASE ACC_BANK2;                                  -- create db
USE ACC_BANK2;                                              -- use db

CREATE TABLE EMP_ACC(
	EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),                                   -- create table
    DEPARTMENT VARCHAR(30),
    SALARY DECIMAL(10,2)
    );
    
    INSERT INTO EMP_ACC VALUES
    (101,'RAHUL','IT',45000),
    (102,'PRIYA','HR',52000),                              -- insert values
    (103,'AMIT','FINANCE',60000),
    (104,'SNEHA','IT',48000),
    (105,'JOHN','HR',55000);
    
    START TRANSACTION;                                     -- start transaction
    UPDATE EMP_ACC SET SALARY = SALARY * 1.15              -- increase all IT emp salary by 15%
    WHERE DEPARTMENT ='IT';                                
    
    SAVEPOINT SP1;                                         -- create a savepoint
    UPDATE EMP_ACC SET SALARY = SALARY+2000                -- increase all HR emp salary by 2000
    WHERE DEPARTMENT ='HR';
    
    SELECT * FROM EMP_ACC;
    ROLLBACK TO SP1;                                       -- rollback only HR emp
    COMMIT;                                                -- commit changes
    
    
    CREATE USER 'student'@'localhost'                      -- create user and password
    IDENTIFIED BY 'password123';
    GRANT SELECT,UPDATE ON EMP_ACC TO 'student'@'localhost';     -- grant select and update to user
    
    REVOKE UPDATE ON EMP_ACC FROM 'student'@'localhost';         -- revoke only update from user
    
    
    