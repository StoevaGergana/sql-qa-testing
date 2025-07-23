CREATE DATABASE IF NOT EXISTS hotel; 
USE hotel;

CREATE TABLE departments (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

INSERT INTO departments(name) VALUES('Front Office'), ('Support'), ('Kitchen'), ('Other');

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	department_id INT NOT NULL,
	salary DOUBLE NOT NULL,
	CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments (id)
);

INSERT INTO employees (`first_name`,`last_name`, `job_title`,`department_id`,`salary`) VALUES
	('John', 'Smith', 'Manager',1, 900.00),
	('John', 'Johnson', 'Customer Service',2, 880.00),
	('Smith', 'Johnson', 'Porter', 4, 1100.00),
	('Peter', 'Petrov', 'Front Desk Clerk', 1, 1100.00),
	('Peter', 'Ivanov', 'Sales', 2, 1500.23),
	('Ivan' ,'Petrov', 'Waiter', 3, 990.00),
	('Jack', 'Jackson', 'Executive Chef', 3, 1800.00),
	('Pedro', 'Petrov', 'Front Desk Supervisor', 1, 2100.00),
	('Nikolay', 'Ivanov', 'Housekeeping', 4, 1600.00);
	

	
CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
	`type` VARCHAR(30)
);

INSERT INTO rooms(`type`) VALUES('apartment'), ('single room');

CREATE TABLE clients (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	room_id INT NOT NULL,
    CONSTRAINT fk_clients_rooms
    FOREIGN KEY (room_id)
    REFERENCES rooms(id)
);

INSERT INTO clients(`first_name`,`last_name`,`room_id`) 
VALUES('Pesho','Petrov', 1),('Gosho','Georgiev', 2),
('Mariya','Marieva', 2), ('Katya','Katerinova', 1), ('Nikolay','Nikolaev', 2);


SELECT  first_name, last_name FROM employees;

SELECT * FROM departments WHERE id BETWEEN 1 AND 3;

SELECT * FROM clients ORDER BY first_name AND room_id DESC;

SELECT * FROM employees WHERE job_title LIKE 'M%' OR 'P%' AND salary >= 100;

SELECT * FROM employees WHERE year(hire_date) = '2000'and month(hire_date) = 3; 

select * FROM PROJECTS WHERE end_date = '2003-06-01';

UPDATE PROJECTS SET end_date = '2003-06-01' WHERE  start_date = '2003-06-05';

DELETE FROM projects WHERE end_date = '2003-06-01';

SELECT DISTINCT department_id FROM employees;

SELECT * FROM employees WHERE department_id = '1';

SELECT first_name, last_name FROM employees WHERE salary <= '20000';

SELECT CONCAT(first_name, ' ', last_name) AS Full_name, department_id, salary
FROM employees
WHERE department_id = 4 AND salary >= 1000;

SELECT first_name, last_name FROM employees ORDER BY hire_date DESC;

SELECT * FROM employees WHERE job_title Like '%Marketing%';

SELECT * FROM employees WHERE job_title = 'Production Technician';

SELECT DISTINCT first_name FROM clients;

SELECT * FROM clients WHERE NOT room_id = 1;

SELECT * FROM employees WHERE job_title NOT IN ('Sales', 'Waiter');

SELECT * FROM employees 
WHERE job_title NOT LIKE 'Sales' AND job_title NOT LIKE 'Waiter';

SELECT * FROM employees
WHERE job_title <> 'Sales' AND job_title <> 'Waiter';

SELECT * FROM clients WHERE room_id IS NULL;

SELECT * FROM employees
LIMIT  4;

-- ▪ Find information about all employees, listing their:
-- ▪ Full Name
-- ▪ Job title
-- ▪ Salary
-- ▪ Use concatenation to display first and last names as one field


SELECT CONCAT(first_name, ' ', last_name) AS Full_name, job_title, salary
FROM employees
ORDER BY salary;

-- Update all employees salaries whose job_title is "Housekeeper"
-- by 100

UPDATE employees
SET salary = salary + 100
WHERE job_title = "Housekeeper";
SELECT salary
FROM employees;

-- Да се изведе списък с отделите (departments), които имат поне двама служители.
-- За всеки от тези отдели трябва да се покажат следните данни:

-- Име на отдела

-- Брой служители в отдела

-- Средна заплата в отдела

-- Минимална заплата

-- Максимална заплата

-- Резултатите да се сортират по средна заплата в низходящ ред (от най-висока към най-ниска).

SELECT departments.name AS department_name,
 COUNT(employees.id) AS total_employees,
 AVG(employees.salary) AS average_salary,
 MIN(employees.salary) AS min_salary,
 MAX(employees.salary) AS max_salary
FROM departments 
LEFT JOIN employees ON departments.id = employees.department_id
GROUP BY departments.name
HAVING total_employees >= 2
ORDER BY average_salary DESC;





