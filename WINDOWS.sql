CREATE DATABASE PRACTICE_DB;
USE PRACTICE_DB;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO Departments VALUES
(101, 'Computer Science', 'Block A'),
(102, 'Information Technology', 'Block B'),
(103, 'Electronics', 'Block C'),
(104, 'Mechanical', 'Block D'),
(105, 'Civil', 'Block E');

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

INSERT INTO Instructors VALUES
(201, 'Ravi Kumar', 'ravi@gmail.com', 101),
(202, 'Priya Sharma', 'priya@gmail.com', 102),
(203, 'Arun Raj', 'arun@gmail.com', 103),
(204, 'Meena Devi', 'meena@gmail.com', 104),
(205, 'Suresh Babu', 'suresh@gmail.com', 105);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id)
    REFERENCES Instructors(instructor_id)
);

INSERT INTO Courses VALUES
(301, 'Database Management', 4, 201),
(302, 'Web Development', 3, 202),
(303, 'Digital Electronics', 4, 203),
(304, 'Thermodynamics', 4, 204),
(305, 'Structural Engineering', 3, 205);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

INSERT INTO Students VALUES
(401, 'Vishnu', 'Female', 20, 101),
(402, 'Rahul', 'Male', 21, 102),
(403, 'Anjali', 'Female', 20, 103),
(404, 'Karthik', 'Male', 22, 104),
(405, 'Sneha', 'Female', 21, 105),
(406, 'Ajay', 'Male', 20, 101),
(407, 'Divya', 'Female', 22, 102),
(408, 'Hari', 'Male', 21, 103);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id)
    REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
    REFERENCES Courses(course_id)
);

INSERT INTO Enrollments VALUES
(501, 401, 301, '2025-01-10', 'A'),
(502, 402, 302, '2025-01-11', 'B'),
(503, 403, 303, '2025-01-12', 'A'),
(504, 404, 304, '2025-01-13', 'C'),
(505, 405, 305, '2025-01-14', 'B'),
(506, 406, 301, '2025-01-15', 'A'),
(507, 407, 302, '2025-01-16', 'A'),
(508, 408, 303, '2025-01-17', 'B');

SELECT S.STUDENT_NAME,C.COURSE_NAME,E.GRADE  FROM STUDENTS S
INNER JOIN ENROLLMENTS E ON S.STUDENT_ID=E.STUDENT_ID                         -- inner join using multiple tables
INNER JOIN COURSES C ON E.COURSE_ID =C.COURSE_ID;

SELECT C.COURSE_NAME FROM COURSES C 
INNER JOIN INSTRUCTORS I ON C.INSTRUCTOR_ID=I.INSTRUCTOR_ID
INNER JOIN DEPARTMENTS D ON I.DEPARTMENT_ID =D.DEPARTMENT_ID;

SELECT I.INSTRUCTOR_NAME,C.COURSE_NAME FROM INSTRUCTORS I 
RIGHT JOIN  COURSES C ON C.INSTRUCTOR_ID =I.INSTRUCTOR_ID;                   -- right join

SELECT S.STUDENT_NAME FROM STUDENTS S
LEFT JOIN ENROLLMENTS E ON E.STUDENT_ID=E.STUDENT_ID WHERE E.STUDENT_ID IS NULL;        -- left join

SELECT S.STUDENT_NAME,E.COURSE_ID,ROW_NUMBER() OVER (ORDER BY DEPARTMENT_ID DESC) FROM ENROLLMENTS E       -- ROW_NUMBER() in window function
JOIN STUDENTS S ON E.STUDENT_ID=S.STUDENT_ID;

SELECT GRADE, RANK() OVER (ORDER BY GRADE DESC) FROM ENROLLMENTS;                       -- RANK() in window function
SELECT GRADE, DENSE_RANK() OVER (ORDER BY GRADE DESC) FROM ENROLLMENTS;                 -- DENSE_RANK() in window function

SELECT GRADE,LAG(GRADE,1) OVER (ORDER BY ENROLLMENT_DATE) FROM ENROLLMENTS;             -- LAG() in window function

SELECT GRADE,LEAD(GRADE,1) OVER (ORDER BY ENROLLMENT_DATE) FROM ENROLLMENTS;            -- LEAD() in window function

SELECT GRADE,NTILE(4) OVER (ORDER BY GRADE) FROM ENROLLMENTS;                           -- NTILE() in window function