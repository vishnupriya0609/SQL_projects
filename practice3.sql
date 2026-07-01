CREATE DATABASE SHOP;
USE SHOP;

CREATE TABLE SHOPS(
	EMP_ID INT,
    EMP_NAME VARCHAR(50),
    SALARY DECIMAL(10,2)
    );
    
    INSERT INTO SHOPS VALUES
    (101,'VISHNU',10000),
	(102,'SANTHIYA',20000),
	(103,'NITHIYA',30000),
	(104,'PAVI',40000),
	(101,'PRIYA',50000);
    
    SELECT * FROM SHOPS;                    -- display datas
     
    START TRANSACTION;                      -- start transaction
    UPDATE SHOPS SET SALARY= SALARY+500 ;   -- update salary 500 to employees before commit
    SAVEPOINT SP1;
    
    START TRANSACTION;
    COMMIT;                                -- saves changes permanently
    
    START TRANSACTION;
    UPDATE SHOPS SET SALARY= SALARY+500;   
    ROLLBACK TO SP1;                           -- undo cahnges
    
    CREATE USER 'user'@'localhost'            -- create username and password
    IDENTIFIED BY 'PASSWORD123';
    GRANT SELECT ON SHOPS TO 'user'@'localhost';      -- grant permission to view employee records
    
    REVOKE DELETE ON SHOPS FROM 'user'@'localhost';   -- revoke delete permission 
    