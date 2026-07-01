-- PART D

CREATE DATABASE STUDENT;                      -- create db
USE STUDENT;                                  -- use db

CREATE TABLE STUDENTS(
	STUDENT_ID INT ,
    STUDENT_NAME VARCHAR(50),                 -- create table
    DEPARTMENT VARCHAR(30),
    CITY VARCHAR(20)
    );
    
    INSERT INTO STUDENTS VALUES
    (101,'VISHNU','CSE','CHENNAI'),         -- insert values
    (102,'PRIYA','IT','DELHI'),
    (103,'ABI','ECE','BANGALORE'),
    (104,'BHUVI','CSE','CHENNAI'),
    (105,'KETHSEY','BME','MUMBAI');
    
    CREATE USER 'VISHNU@GMAIL.COM'                  -- create username and password
    IDENTIFIED BY 'VISHNU123';
    
    GRANT SELECT ON STUDENTS TO 'VISHNU@GMAIL.COM';       -- grant SELECT permission on students 
    SELECT * FROM STUDENTS;
    GRANT INSERT ON STUDENTS TO 'VISHNU@GMAIL.COM';       -- grant INSERT permission on students
    GRANT UPDATE ON STUDENTS TO 'VISHNU@GMAIL.COM';       -- grant UPDATE permission on students
    
    REVOKE INSERT ON STUDENTS FROM 'VISHNU@GMAIL.COM';    -- revoke INSERT from students
    REVOKE ALL ON STUDENTS FROM 'VISHNU@GMAIL.COM';       -- revoke ALL permission from students