USE startersql;

-- Creating a database named tutorial
CREATE DATABASE tutorial;

-- Using database tutorial
USE tutorial;

-- Creating ta ble
CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
gender ENUM("Male","Female","Other"),
date_of_birth DATE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- Select (Different methonds of selecting rows)  
SELECT * FROM users;
SELECT email, name FROM users;

-- Drop database ( to delete entire database )
DROP database tutorial;

-- Rename ( change the name of the table )
RENAME table users TO customers; 

-- Alter 
ALTER TABLE customers
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

SELECT * FROM customers;

RENAME TABLE customers TO users;

-- droping a column
ALTER TABLE users
DROP COLUMN is_active;

SELECT * FROM users;

-- MOdify
ALTER TABLE users
MODIFY COLUMN name VARCHAR(10) NOT NULL;

-- Changing index of columns
ALTER TABLE users 
MODIFY COLUMN name VARCHAR(10) FIRST;

SELECT * FROM users;

ALTER TABLE users
MODIFY COLUMN date_of_birth DATETIME after name;

SELECT * FROM users;

-- Inserting 

INSERT INTO users VALUES
-- ("Ankit","2005-06-04",1,"lol.gmail","male",DEFAULT),
("aara","2003-05-02",3,"lodl.gmail","male",DEFAULT),
("tadsfad","2023-04-14",43,"losl.gmail","female",DEFAULT),
("djaojoi","2205-03-14",435,"lodsl.gmail","male",DEFAULT);

SELECT * FROM users;

DROP DATABASE tutorial;



SELECT * FROM users;

SELECT name, gender FROM users;

SELECT gender,name FROM users;

SELECT * FROM users 
WHERE gender = "female";

SELECT * FROM users 
WHERE gender != "female";

SELECT * FROM users
WHERE date_of_birth > "2000-01-01";

SELECT * FROM users 
WHERE id > 12;

SELECT * FROM users
WHERE gender = "male" AND  salary < 50000;

SELECT * FROM users
WHERE gender = "male" or  salary > 70000;

-- Order by
SELECT * FROM users
WHERE gender = "female" ORDER BY salary DESC;

SELECT * FROM users
WHERE gender = "female" ORDER BY salary DESC limit 3;

-- Update

UPDATE users SET salary = 100000
WHERE name like "Yash";

SELECT * FROM users;

UPDATE users SET salary = 700000
WHERE id = 5;

UPDATE users SET name = "Aisha Khan"
WHERE email = 'asiha@example.com';

UPDATE users SET salary = salary + 10000
WHERE salary < 60000;

SELECT * FROM users;

-- Delete
DELETE FROM users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00),
('Raj', 'raj@example.com', 'Male', '1988-02-17', 58000.00),
('Sneha', 'sneha@example.com', 'Female', '2000-08-09', 50000.00),
('Farhan', 'farhan@example.com', 'Male', '1993-12-30', 61000.00),
('Priyanka', 'priyanka@example.com', 'Female', '1985-07-12', 84000.00),
('Aisha', 'aisha@example.com', 'Female', '1997-03-25', 56000.00),
('Aditya', 'aditya@example.com', 'Male', '1992-06-17', 69000.00),
('Meera', 'meera@example.com', 'Female', '1989-09-05', 77000.00),
('Ishaan', 'ishaan@example.com', 'Male', '2001-10-02', 45000.00),
('Tanvi', 'tanvi@example.com', 'Female', '1994-04-18', 62000.00),
('Rohan', 'rohan@example.com', 'Male', '1986-12-01', 75000.00),
('Zoya', 'zoya@example.com', 'Female', '1998-01-15', 54000.00),
('Karan', 'karan@example.com', 'Male', '1990-08-22', 68000.00),
('Nikita', 'nikita@example.com', 'Female', '1987-03-10', 71000.00),
('Manav', 'manav@example.com', 'Male', '1996-11-29', 61000.00),
('Divya', 'divya@example.com', 'Female', '1991-02-28', 57000.00),
('Harshit', 'harshit@example.com', 'Male', '1993-09-09', 65000.00),
('Ritika', 'ritika@example.com', 'Female', '1999-05-05', 52000.00),
('Imran', 'imran@example.com', 'Male', '1995-07-30', 63000.00),
('Juhi', 'juhi@example.com', 'Female', '1992-10-14', 59000.00),
('Tushar', 'tushar@example.com', 'Male', '1990-01-08', 73000.00),
('Lata', 'lata@example.com', 'Female', '1984-11-11', 78000.00),
('Yash', 'yash@example.com', 'Male', '1997-06-06', 64000.00),
('Fatima', 'fatima@example.com', 'Female', '1993-03-03', 55000.00);

-- DROP TABLE users;

-- SQL Functions

-- count
SELECT  COUNT(*) FROM users 
WHERE gender = "male";

SELECT MIN(salary) AS min_sal FROM users;
SELECT * FROM users ORDER BY salary ASC LIMIT 1;

SELECT SUM(salary) AS sum_salary FROM users;
SELECT AVG(salary) AS avg_salary FROM users;

SELECT gender, SUM(salary) AS sum_salary FROM users GROUP BY gender;
SELECT name,gender, SUM(salary) AS sum_salary FROM users GROUP BY name, gender;

 SELECT name, LENGTH(name) AS name_len FROM users;
 
 -- Concat
 SELECT name,LOWER(name) AS lower_name, CONCAT(LOWER(name),"5656") AS usersname FROM users;
 
 -- Time
 SELECT name,LENGTH(name) AS len_name, NOW() AS time FROM users;
 
 SELECT name,DATEDIFF(CURRENT_DATE(),date_of_birth) AS days FROM users;
 
 -- Mathmatical functions
 SELECT name,salary,
 ROUND(salary) AS rounded,
 FLOOR(salary) AS floored,
 CEIL(salary) AS ceiled
FROM users;

-- Commit & Rollback
SET AUTOCOMMIT = 0;
COMMIT;
ROLLBACK;

SET AUTOCOMMIT = 1;

SELECT * FROM users;
DROP TABLE addresses;
DROP TABLE users;

-- Foregin key
CREATE TABLE addresses (
id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT,
 street VARCHAR(255),
 city VARCHAR(100),
 state VARCHAR(100),
 pincode VARCHAR(10),
 FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO addresses (user_id, street, city, state, pincode)
VALUES
(1, '221B MG Road', 'Mumbai', 'Maharashtra', '400001'),
(22, '14 Park Street', 'Kolkata', 'West Bengal', '700016'),
(3, '32 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(24, '5 North Usman Road', 'Chennai', 'Tamil Nadu', '600017'),
(5, '17 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001'),
(6, '55 Banjara Hills', 'Hyderabad', 'Telangana', '500034'),
(7, '88 Connaught Place', 'Delhi', 'Delhi', '110001'),
(8, '10 MG Marg', 'Dehradun', 'Uttarakhand', '248001'),
(9, '23 Brigade Road', 'Bengaluru', 'Karnataka', '560025'),
(10, '45 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(11, '67 Ashoka Road', 'Delhi', 'Delhi', '110001'),
(12, '89 MG Road', 'Pune', 'Maharashtra', '411001'),
(13, '12 Brigade Road', 'Bengaluru', 'Karnataka', '560025'),
(14, '34 Park Street', 'Kolkata', 'West Bengal', '700016'),
(15, '56 Connaught Place', 'Delhi', 'Delhi', '110001'),
(16, '78 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(17, '90 MG Marg', 'Dehradun', 'Uttarakhand', '248001'),
(18, '11 North Usman Road', 'Chennai', 'Tamil Nadu', '600017'),
(19, '33 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(20, '22 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001');

SELECT * FROM users;
SELECT * FROM addresses;

-- Joints
-- Inner join
SELECT users.name, addresses.city
FROM users
INNER JOIN addresses ON users.id = addresses.user_id;

-- Left join
SELECT users.name, addresses.city
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id;

 -- Right join
 SELECT users.name, users.salary, addresses.city
FROM users
RIGHT JOIN addresses ON users.id = addresses.user_id;

 -- Union 
 
 CREATE TABLE admin_users (
id INT PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(100),
 gender ENUM('Male', 'Female', 'Other'),
 date_of_birth DATE,
 salary INT
);

INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);

-- Union ( only shows duplicate once )
SELECT name FROM users
UNION
SELECT name FROM admin_users;

-- Union all ( shows duplicated as well )
SELECT name FROM users
UNION ALL
SELECT name FROM admin_users;
 
SELECT name, salary FROM users
UNION
SELECT name, salary FROM admin_users;

SELECT name,id,email,'User' AS role FROM users
UNION
SELECT name,id,email, 'Admin' AS role FROM admin_users
ORDER BY id;

-- Self joins ( when you need to join the table with itself )

ALTER TABLE users
ADD COLUMN referred_by_id INT;

UPDATE users SET referred_by_id = 1 WHERE id IN (2, 3,5,6,23); 
UPDATE users SET referred_by_id = 4 WHERE id IN (1,7,11,12,13); 
 
SELECT
 a.id,
 a.name AS user_name,
 b.name AS referred_by
FROM users a
INNER JOIN users b ON a.referred_by_id = b.id;

-- Views
CREATE VIEW rich_boys AS
SELECT * FROM users WHERE salary > 50000 AND gender = 'Male';

SELECT * FROM rich_boys;

DROP VIEW rich_boys;

-- Indexes

SHOW INDEXES FROM users;

CREATE INDEX idx_gender ON users(gender);

DROP INDEX idx_gender ON users;


-- Subqueries
SELECT id, name, salary
FROM users
WHERE salary > (
 SELECT AVG(salary) FROM users
);

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
 SELECT id FROM users WHERE salary > 50000
);

-- Group by
SELECT gender, AVG(salary)
FROM users
GROUP BY gender;

SELECT gender,COUNT(*), AVG(salary)
FROM users
GROUP BY gender;

SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender
HAVING AVG(salary) < 75000;

SELECT gender, COUNT(*) AS total_users, AVG(salary) AS Avg_salary
FROM users
GROUP BY gender WITH ROLLUP;

-- Rollup to see subtotal or grand total



-- Stored procedure 
-- its like a function where you can store steps/queries to run 
-- it can take input also using (IN), not necessary

DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
SELECT * FROM users;
END $$
DELIMITER ;

CALL select_users();

SHOW PROCEDURE STATUS WHERE db = 'startersql';
DROP PROCEDURE IF EXISTS select_users;

-- Trigger
-- when an event is occured this program is automatically executed if a trigger is place

CREATE TABLE user_log(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    name VARCHAR(255),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
    
DELIMITER $$
CREATE TRIGGER after_users_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO user_log(user_id,name)
    VALUES (NEW.id,NEW.name);
END $$
DELIMITER ;

INSERT INTO USERS
(name,email,gender,date_of_birth,salary) VALUES
('ankit','anmkit@gamily.com','Male','2005-04-06',2000000);

SELECT * FROM user_log;

DROP TRIGGER IF EXISTS after_users_insert;

-- add a column in existing table
ALTER TABLE users
ADD COLUMN city VARCHAR(100);

-- limit and offset 
SELECT * FROM users
ORDER BY id
LIMIT 5 OFFSET 10;

SELECT DISTINCT gender FROM users;

-- truncate ( deletes all data but keeps table )
TRUNCATE TABLE addresses;
SELECT * FROM addresses;