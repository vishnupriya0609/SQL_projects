CREATE DATABASE BANK;                          -- create database
USE  BANK;                                                          -- use database

CREATE TABLE BANK_ACC(
	ACC_ID INT PRIMARY KEY,
    ACC_NAME VARCHAR(50),
    ACC_BRANCH VARCHAR(15),
    AMMOUNT DECIMAL(10,2)                                           -- craete table
    );
    SELECT * FROM BANK_ACC;                                         -- display table 
    
    INSERT INTO BANK_ACC VALUES
    (101,'VISHNU','GINGEE',50000),
    (102,'PRIYA','CHENNAI',60000),
    (103,'PAVI','PONMAR',70000),                                    -- insert values into table
    (104,'SANDHIYA','MEDAVAKKAM',80000),
    (105,'NITHIYA','AVADI',90000);
    
    START TRANSACTION;                                              -- start tarnsaction
    UPDATE BANK_ACC SET AMMOUNT=5000 WHERE ACC_ID =101;             -- uoadte amount in table
    COMMIT;                                                         -- save all changes permanently in the database
     
     UPDATE BANK_ACC SET AMMOUNT=5000 WHERE ACC_ID =102;
     ROLLBACK  ;                                                    -- undo the changes
  
    UPDATE BANK_ACC SET AMMOUNT=55000 WHERE ACC_ID =101;
    SAVEPOINT SP1;                                                  -- save changes temporaryly
    UPDATE BANK_ACC SET AMMOUNT=55000 WHERE ACC_ID =102;