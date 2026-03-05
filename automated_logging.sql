-- =====================================
-- 1️⃣ Create Database
-- =====================================

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;


-- =====================================
-- 2️⃣ Create Employees Table
-- =====================================

CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);


-- =====================================
-- 3️⃣ Create Audit Log Table
-- =====================================

CREATE TABLE IF NOT EXISTS employee_audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =====================================
-- 4️⃣ Drop Triggers if Already Exist
-- (Prevents duplicate error)
-- =====================================

DROP TRIGGER IF EXISTS after_employee_insert;
DROP TRIGGER IF EXISTS after_employee_update;


-- =====================================
-- 5️⃣ INSERT Trigger
-- =====================================

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit_log(emp_id, action_type, new_salary)
    VALUES (NEW.emp_id, 'INSERT', NEW.salary);
END //

DELIMITER ;


-- =====================================
-- 6️⃣ UPDATE Trigger
-- =====================================

DELIMITER //

CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit_log(emp_id, action_type, old_salary, new_salary)
    VALUES (OLD.emp_id, 'UPDATE', OLD.salary, NEW.salary);
END //

DELIMITER ;


-- =====================================
-- 7️⃣ Create View
-- =====================================

CREATE OR REPLACE VIEW daily_employee_activity AS
SELECT 
    DATE(action_time) AS activity_date,
    action_type,
    COUNT(*) AS total_actions
FROM employee_audit_log
GROUP BY DATE(action_time), action_type;


-- =====================================
-- 8️⃣ Test the System
-- =====================================

INSERT INTO employees VALUES (1, 'Krishna', 30000, 'IT', NOW());

UPDATE employees 
SET salary = 35000 
WHERE emp_id = 1;


-- =====================================
-- 9️⃣ Check Results
-- =====================================

SELECT * FROM employee_audit_log;

SELECT * FROM daily_employee_activity;