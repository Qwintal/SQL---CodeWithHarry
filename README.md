# SQL Learning Repository

This Repository is another SQL course that I followed to cover topcis from basic to advance concepts.

## 📁 Repository Structure

```
sql-learning/
├── README.md
├── .gitignore
├── 01-basics/
│   ├── 01-select.sql
│   ├── 02-where-clause.sql
│   ├── 03-comparison-operators.sql
│   └── 04-logical-operators.sql
├── 02-intermediate/
│   ├── 01-order-by.sql
│   ├── 02-limit.sql
│   ├── 03-update.sql
│   ├── 04-delete.sql
│   └── 05-distinct.sql
├── 03-advanced/
│   ├── 01-sql-functions.sql
│   ├── 02-aggregate-functions.sql
│   ├── 03-string-functions.sql
│   ├── 04-date-functions.sql
│   └── 05-mathematical-functions.sql
├── 04-database-management/
│   ├── 01-create-table.sql
│   ├── 02-insert-data.sql
│   ├── 03-alter-table.sql
│   ├── 04-drop-table.sql
│   └── 05-truncate.sql
├── 05-joins/
│   ├── 01-inner-join.sql
│   ├── 02-left-join.sql
│   ├── 03-right-join.sql
│   └── 04-self-join.sql
├── 06-advanced-queries/
│   ├── 01-union.sql
│   ├── 02-subqueries.sql
│   ├── 03-group-by.sql
│   ├── 04-having-clause.sql
│   └── 05-rollup.sql
├── 07-transactions/
│   └── 01-commit-rollback.sql
├── 08-relationships/
│   └── 01-foreign-keys.sql
├── 09-views/
│   └── 01-views.sql
├── 10-indexes/
│   └── 01-indexes.sql
├── 11-stored-procedures/
│   └── 01-stored-procedures.sql
├── 12-triggers/
│   └── 01-triggers.sql
```

## 📄 File Contents

### 01-basics/

**01-select.sql**
```sql
-- Use of SELECT 
USE startersql;

SELECT * FROM users;
SELECT name, gender FROM users;
SELECT gender, name FROM users;
```

**02-where-clause.sql**
```sql
-- Using WHERE clause
SELECT * FROM users WHERE gender = "female";
SELECT * FROM users WHERE gender != "female";
SELECT * FROM users WHERE date_of_birth > "2000-01-01";
SELECT * FROM users WHERE id > 12;
```

**03-comparison-operators.sql**
```sql
-- Various comparison operators examples
SELECT * FROM users WHERE date_of_birth > "2000-01-01";
SELECT * FROM users WHERE id > 12;
```

**04-logical-operators.sql**
```sql
-- Logical Operatros ( AND, OR, NOT )
SELECT * FROM users WHERE gender = "male" AND salary < 50000;
SELECT * FROM users WHERE gender = "male" OR salary > 70000;
```

### 02-intermediate/

**01-order-by.sql**
```sql
-- Basic ODER BY 
SELECT * FROM users WHERE gender = "female" ORDER BY salary DESC;
SELECT * FROM users WHERE gender = "female" ORDER BY salary DESC LIMIT 3;
```

**02-limit.sql**
```sql
--Limit no:of outcomes, offset to jumo outcomes
SELECT * FROM users ORDER BY id LIMIT 5 OFFSET 10;
```

**03-update.sql**
```sql
-- UPDATE data in exiisting table
UPDATE users SET salary = 100000 WHERE name LIKE "Yash";
UPDATE users SET salary = 700000 WHERE id = 5;
UPDATE users SET name = "Aisha Khan" WHERE email = 'aisha@example.com';
UPDATE users SET salary = salary + 10000 WHERE salary < 60000;
```

**04-delete.sql**
```sql
-- Delete a value or truncate all values in a table
DELETE FROM users;
TRUNCATE TABLE addresses;
```

**05-distinct.sql**
```sql
-- Retruns only unique values
SELECT DISTINCT gender FROM users;
```

### 03-advanced/

**01-sql-functions.sql**
```sql
-- COUNT function
SELECT COUNT(*) FROM users WHERE gender = "male";
```

**02-aggregate-functions.sql**
```sql
SELECT MIN(salary) AS min_sal FROM users;
SELECT * FROM users ORDER BY salary ASC LIMIT 1;
SELECT SUM(salary) AS sum_salary FROM users;
SELECT AVG(salary) AS avg_salary FROM users;
```

**03-string-functions.sql**
```sql
SELECT name, LENGTH(name) AS name_len FROM users;
SELECT name, LOWER(name) AS lower_name, CONCAT(LOWER(name), "5656") AS username FROM users;
```

**04-date-functions.sql**
```sql
SELECT name, LENGTH(name) AS len_name, NOW() AS time FROM users;
SELECT name, DATEDIFF(CURRENT_DATE(), date_of_birth) AS days FROM users;
```

**05-mathematical-functions.sql**
```sql
SELECT name, salary,
  ROUND(salary) AS rounded,
  FLOOR(salary) AS floored,
  CEIL(salary) AS ceiled
FROM users;
```

### 04-database-management/

**01-create-table.sql**
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

**02-insert-data.sql**
```sql
INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00);
-- ... more data
```

**03-alter-table.sql**
```sql
ALTER TABLE users ADD COLUMN city VARCHAR(100);
ALTER TABLE users ADD COLUMN referred_by_id INT;
```

**04-drop-table.sql**
```sql
DROP TABLE users;
DROP TABLE addresses;
```

**05-truncate.sql**
```sql
TRUNCATE TABLE addresses;
```

### 05-joins/

**01-inner-join.sql**
```sql
SELECT users.name, addresses.city
FROM users
INNER JOIN addresses ON users.id = addresses.user_id;
```

**02-left-join.sql**
```sql
SELECT users.name, addresses.city
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id;
```

**03-right-join.sql**
```sql
SELECT users.name, users.salary, addresses.city
FROM users
RIGHT JOIN addresses ON users.id = addresses.user_id;
```

**04-self-join.sql**
```sql
SELECT
  a.id,
  a.name AS user_name,
  b.name AS referred_by
FROM users a
INNER JOIN users b ON a.referred_by_id = b.id;
```

### 06-advanced-queries/

**01-union.sql**
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

**02-subqueries.sql**
```sql
-- Subquereies act like listed querires
SELECT id, name, salary
FROM users
WHERE salary > (SELECT AVG(salary) FROM users);

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (SELECT id FROM users WHERE salary > 50000);
```

**03-group-by.sql**
```sql
SELECT gender, AVG(salary)
FROM users
GROUP BY gender;

SELECT gender, COUNT(*), AVG(salary)
FROM users
GROUP BY gender;
```

**04-having-clause.sql**
```sql
-- HAVING is used after GROUP BY
SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender
HAVING AVG(salary) < 75000;
```

**05-rollup.sql**
```sql
-- Use for grand total
SELECT gender, COUNT(*) AS total_users, AVG(salary) AS Avg_salary
FROM users
GROUP BY gender WITH ROLLUP;
```

### 07-transactions/

**01-commit-rollback.sql**
```sql
SET AUTOCOMMIT = 0;
COMMIT;
ROLLBACK;
SET AUTOCOMMIT = 1;
```

### 08-relationships/

**01-foreign-keys.sql**
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

### 09-views/

**01-views.sql**
```sql
CREATE VIEW rich_boys AS
SELECT * FROM users WHERE salary > 50000 AND gender = 'Male';

SELECT * FROM rich_boys;
DROP VIEW rich_boys;
```

### 10-indexes/

**01-indexes.sql**
```sql
SHOW INDEXES FROM users;
CREATE INDEX idx_gender ON users(gender);
DROP INDEX idx_gender ON users;
```

### 11-stored-procedures/

**01-stored-procedures.sql**
```sql
DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
    SELECT * FROM users;
END $$
DELIMITER ;

CALL select_users();
DROP PROCEDURE IF EXISTS select_users;
```

### 12-triggers/

**01-triggers.sql**
```sql
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
