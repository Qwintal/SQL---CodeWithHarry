# SQL Learning Repository

This Repository is another SQL course that I followed to cover topcis from basic to advance concepts.

## 📁 Repository Structure

```
sql-learning/
├── basics/
│   ├── select.sql
│   ├── where-clause.sql
│   ├── comparison-operators.sql
│   └── logical-operators.sql
├── intermediate/
│   ├── order-by.sql
│   ├── limit.sql
│   ├── update.sql
│   ├── delete.sql
│   └── distinct.sql
├── advanced/
│   ├── sql-functions.sql
│   ├── aggregate-functions.sql
│   ├── string-functions.sql
│   ├── date-functions.sql
│   └── mathematical-functions.sql
├── database-management/
│   ├── create-table.sql
│   ├── insert-data.sql
│   ├── alter-table.sql
│   ├── drop-table.sql
│   └── truncate.sql
├── joins/
│   ├── inner-join.sql
│   ├── left-join.sql
│   ├── right-join.sql
│   └── self-join.sql
├── advanced-queries/
│   ├── union.sql
│   ├── subqueries.sql
│   ├── group-by.sql
│   ├── having-clause.sql
│   └── rollup.sql
├── transactions/
│   └── commit-rollback.sql
├── relationships/
│   └── foreign-keys.sql
├── views/
│   └── views.sql
├── indexes/
│   └── indexes.sql
├── stored-procedures/
│   └── stored-procedures.sql
├── triggers/
│   └── triggers.sql
```

## 📄 File Contents


**select**
```sql
-- Use of SELECT 
USE startersql;

SELECT * FROM users;
SELECT name, gender FROM users;
SELECT gender, name FROM users;
```

**where-clause**
```sql
-- Using WHERE clause
SELECT * FROM users WHERE gender = "female";
SELECT * FROM users WHERE gender != "female";
SELECT * FROM users WHERE date_of_birth > "2000-01-01";
SELECT * FROM users WHERE id > 12;
```

**comparison-operators**
```sql
-- Various comparison operators examples
SELECT * FROM users WHERE date_of_birth > "2000-01-01";
SELECT * FROM users WHERE id > 12;
```

**logical-operators**
```sql
-- Logical Operatros ( AND, OR, NOT )
SELECT * FROM users WHERE gender = "male" AND salary < 50000;
SELECT * FROM users WHERE gender = "male" OR salary > 70000;
```


**order-by**
```sql
-- Basic ODER BY 
SELECT * FROM users WHERE gender = "female" ORDER BY salary DESC;
SELECT * FROM users WHERE gender = "female" ORDER BY salary DESC LIMIT 3;
```

**limit**
```sql
--Limit no:of outcomes, offset to jumo outcomes
SELECT * FROM users ORDER BY id LIMIT 5 OFFSET 10;
```

**update**
```sql
-- UPDATE data in exiisting table
UPDATE users SET salary = 100000 WHERE name LIKE "Yash";
UPDATE users SET salary = 700000 WHERE id = 5;
UPDATE users SET name = "Aisha Khan" WHERE email = 'aisha@example.com';
UPDATE users SET salary = salary + 10000 WHERE salary < 60000;
```

**delete**
```sql
-- Delete a value or truncate all values in a table
DELETE FROM users;
TRUNCATE TABLE addresses;
```

**distinct**
```sql
-- Retruns only unique values
SELECT DISTINCT gender FROM users;
```


**0functions**
```sql
-- COUNT function
SELECT COUNT(*) FROM users WHERE gender = "male";
```

**aggregate-functions**
```sql
SELECT MIN(salary) AS min_sal FROM users;
SELECT * FROM users ORDER BY salary ASC LIMIT 1;
SELECT SUM(salary) AS sum_salary FROM users;
SELECT AVG(salary) AS avg_salary FROM users;
```

**string-functions**
```sql
SELECT name, LENGTH(name) AS name_len FROM users;
SELECT name, LOWER(name) AS lower_name, CONCAT(LOWER(name), "5656") AS username FROM users;
```

**date-functions**
```sql
SELECT name, LENGTH(name) AS len_name, NOW() AS time FROM users;
SELECT name, DATEDIFF(CURRENT_DATE(), date_of_birth) AS days FROM users;
```

**mathematical-functions**
```sql
SELECT name, salary,
  ROUND(salary) AS rounded,
  FLOOR(salary) AS floored,
  CEIL(salary) AS ceiled
FROM users;
```

**create-table**
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**insert-data.**
```sql
INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00);
-- ... more data
```

**alter-table**
```sql
ALTER TABLE users ADD COLUMN city VARCHAR(100);
ALTER TABLE users ADD COLUMN referred_by_id INT;
```

**drop-table**
```sql
DROP TABLE users;
DROP TABLE addresses;
```

**truncate**
```sql
TRUNCATE TABLE addresses;
```

**inner-join**
```sql
SELECT users.name, addresses.city
FROM users
INNER JOIN addresses ON users.id = addresses.user_id;
```

**left-join**
```sql
SELECT users.name, addresses.city
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id;
```

**right-join**
```sql
SELECT users.name, users.salary, addresses.city
FROM users
RIGHT JOIN addresses ON users.id = addresses.user_id;
```

**self-join**
```sql
SELECT
  a.id,
  a.name AS user_name,
  b.name AS referred_by
FROM users a
INNER JOIN users b ON a.referred_by_id = b.id;
```


**union**
```sql
-- Two join 2 tables
-- Union returns no  duplicated values, Union all will return duplicated values 
SELECT name FROM users
UNION
SELECT name FROM admin_users;

SELECT name FROM users
UNION ALL
SELECT name FROM admin_users;
```

**subqueries**
```sql
-- Subquereies act like listed querires
SELECT id, name, salary
FROM users
WHERE salary > (SELECT AVG(salary) FROM users);

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (SELECT id FROM users WHERE salary > 50000);
```

**having-clause**
```sql
-- HAVING is used after GROUP BY
SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender
HAVING AVG(salary) < 75000;
```

**rollup**
```sql
-- Use for grand total
SELECT gender, COUNT(*) AS total_users, AVG(salary) AS Avg_salary
FROM users
GROUP BY gender WITH ROLLUP;
```


**commit-rollback**
```sql
SET AUTOCOMMIT = 0;
COMMIT;
ROLLBACK;
SET AUTOCOMMIT = 1;
```


**foreign-keys**
```sql
CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```


**views**
```sql
-- Act like a virutal table
CREATE VIEW rich_boys AS
SELECT * FROM users WHERE salary > 50000 AND gender = 'Male';

SELECT * FROM rich_boys;
DROP VIEW rich_boys;
```


**indexes**
```sql
-- Increase the speed of execution of selected INDEXES
SHOW INDEXES FROM users;
CREATE INDEX idx_gender ON users(gender);
DROP INDEX idx_gender ON users;
```

**stored-procedures**
```sql
-- Acts like a function
DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
    SELECT * FROM users;
END $$
DELIMITER ;

CALL select_users();
DROP PROCEDURE IF EXISTS select_users;
```


**triggers**
```sql
-- Automatic triggers the scrips inside it, after INSERT/DELETE/UPDATE
CREATE TABLE user_log(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_users_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log(user_id, name)
    VALUES (NEW.id, NEW.name);
END $$
DELIMITER ;
```


## 🔗 References

- Tutorial: [Code with Harry SQL](https://youtu.be/yE6tIle64tU?si=WiXni3O1V--Uuw5v)
- MySQL Documentation: [HandBook_PDF](https://github.com/Qwintal/SQL---CodeWithHarry/blob/main/MySQL%20Handbook.pdf)
