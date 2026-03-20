-- Създаване на базата данни
DROP DATABASE IF EXISTS students_db;
CREATE DATABASE students_db;
USE students_db;

-- Таблица: students
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Таблица: courses
CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Таблица: grades
CREATE TABLE grades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade DECIMAL(3,2),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Данни за students
INSERT INTO students (name) VALUES
('Иван Иванов'),
('Петър Петров'),
('Мария Георгиева');

-- Данни за courses
INSERT INTO courses (name) VALUES
('Математика'),
('Физика'),
('История');

-- Данни за grades (ID-тата съответстват на реда на insert)
INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 1, 4.50),  -- Иван Иванов - Математика
(1, 2, 5.00),  -- Иван Иванов - Физика
(2, 1, 3.80),  -- Петър Петров - Математика
(2, 3, 4.20),  -- Петър Петров - История
(3, 2, 4.70);  -- Мария Георгиева - Физика

SELECT s.name AS student_name, c.name AS course_name, g.grade
FROM students AS s
JOIN grades g ON s.id = g.student_id
JOIN courses c ON c.id = g.course_id;

SELECT s.name AS student_name, c.name AS course_name, g.grade
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
LEFT JOIN courses c ON c.id = g.course_id;

SELECT s.name AS student_name, c.name AS course_name, g.grade
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN courses c ON c.id = g.course_id
WHERE g.grade > 4.50;

SELECT s.name AS student_name, AVG(g.grade) AS average_grade
FROM students as s
JOIN grades as g ON s.id=g.student_id
GROUP BY s.name

SELECT AVG(grade) AS avg_all_grades FROM grades;

SELECT s.name AS student_name, g.grade
FROM students s
JOIN grades g ON s.id = g.student_id
WHERE g.grade > (
    SELECT AVG(grade) FROM grades
);

SELECT s.name AS student_name, AVG(g.grade) AS avg_grade
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.name
HAVING AVG(g.grade) > 4.50;

SELECT c.name AS course_name, MAX(g.grade) AS max_ocenka
FROM courses AS c
JOIN grades AS g ON c.id=g.student_id
GROUP BY course_name

SELECT s.name AS student_name, c.name AS course_name, g.grade AS max_grade
FROM students AS s
JOIN grades AS g ON s.id = g.student_id
JOIN courses AS c ON g.course_id = c.id
WHERE g.grade = (
  SELECT MAX(g2.grade)
  FROM grades g2
  WHERE g2.course_id = g.course_id
);
