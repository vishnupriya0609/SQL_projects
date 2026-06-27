SELECT * FROM COMPANY  --view all records

SELECT EMP_ID,EMP_NAME FROM COMPANY;  -- secific column

SELECT * FROM COMPANY
WHERE LOCATION ='CHENNAI';  -- WHERE clause

SELECT * FROM COMPANY
WHERE LOCATION = 'CHENNAI' AND SALARY > 55000;  -- AND operator

SELECT * FROM COMPANY
WHERE LOCATION ='CHENNAI' OR LOCATION = 'DELHI';  -- OR operator
SELECT * FROM COMPANY
ORDER BY SALARY ASC;  -- ORDER BY clause.

SELECT * FROM COMPANY  
limit 3;               -- Display only 3 records.

SELECT DISTINCT LOCATION FROM COMPANY;   -- Displays unique locations without duplicates.

SELECT COUNT(*) FROM COMPANY;   -- Counts the total number of employees.

SELECT MAX(SALARY) FROM COMPANY;  -- Displays highest salary

SELECT MIN(SALARY) FROM COMPANY;  -- Displays lowest salary

SELECT AVG(SALARY) FROM COMPANY;  -- Calculates the average salary.

SELECT SUM(SALARY) FROM COMPANY;  -- Calculates the total salary of all employees.

SELECT LOCATION, COUNT(*)
FROM COMPANY
GROUP BY LOCATION
HAVING COUNT(*) > 1;               -- Displays only those locations where more than one employee is present.