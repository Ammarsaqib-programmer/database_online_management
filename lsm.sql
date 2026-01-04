CREATE DATABASE lms_db;
USE lms_db;

CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    dept_location VARCHAR(100)
);

CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(100) NOT NULL,
    teacher_city VARCHAR(100),
    teacher_country VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_level VARCHAR(50),
    course_difficulty VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE student (
    stud_id INT PRIMARY KEY AUTO_INCREMENT,
    stud_name VARCHAR(100) NOT NULL,
    stud_city VARCHAR(100),
    stud_district VARCHAR(100)
);

CREATE TABLE enrollment (
    stud_id INT,
    course_id INT,
    PRIMARY KEY (stud_id, course_id),
    FOREIGN KEY (stud_id) REFERENCES student(stud_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);


INSERT INTO department (dept_name, dept_location)
VALUES
('Computer Science', 'Lahore'),
('Information Technology', 'Karachi');

INSERT INTO teacher (teacher_name, teacher_city, teacher_country, dept_id)
VALUES
('Dr. Ahmed Khan', 'Sukkur', 'Pakistan', 1),
('Ms. Sana Ali', 'Kot Diji', 'Pakistan', 2);

INSERT INTO course (course_name, course_level, course_difficulty, dept_id)
VALUES
('Database Systems', 'Undergraduate', 'Medium', 1),
('Web Development', 'Beginner', 'Easy', 2);

INSERT INTO student (stud_name, stud_city, stud_district)
VALUES
('Ammar Saqib ', 'Bhiria Road', 'Naushero Feroze'),
('Yasir Ali', 'Pir Goth', 'Khairpur'),
('Amber Hira', 'Sukkur', 'Sukkur'),
('Ali Raza', 'Kumb', 'Khairpur');

INSERT INTO enrollment (stud_id, course_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

SELECT *  FROM student;

SELECT stud_name, stud_city FROM student;

SELECT c.course_name, d.dept_name
FROM course c
JOIN department d ON c.dept_id = d.dept_id;

SELECT s.stud_name, c.course_name
FROM student s
JOIN enrollment e ON s.stud_id = e.stud_id
JOIN course c ON e.course_id = c.course_id;

SELECT s.stud_name
FROM student s
JOIN enrollment e ON s.stud_id = e.stud_id
JOIN course c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';

SELECT COUNT(*) AS total_students
FROM student;

SELECT c.course_name, COUNT(e.stud_id) AS student_count
FROM course c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;






