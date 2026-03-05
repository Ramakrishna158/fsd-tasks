CREATE DATABASE payment_system;
USE payment_system;

-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    balance DECIMAL(10,2)
);

-- Merchants Table
CREATE TABLE Merchants (
    merchant_id INT PRIMARY KEY AUTO_INCREMENT,
    merchant_name VARCHAR(100),
    balance DECIMAL(10,2)
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    merchant_id INT,
    amount DECIMAL(10,2),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (merchant_id) REFERENCES Merchants(merchant_id)
);


INSERT INTO Users (name, balance) VALUES
('Arun', 5000),
('Bhavya', 3000);

INSERT INTO Merchants (merchant_name, balance) VALUES
('Amazon Store', 10000),
('Flipkart Store', 8000);


START TRANSACTION;

-- Step 1: Check balance (optional check)
SELECT balance FROM Users WHERE user_id = 1;

-- Step 2: Deduct from User
UPDATE Users
SET balance = balance - 2000
WHERE user_id = 1;

-- Step 3: Add to Merchant
UPDATE Merchants
SET balance = balance + 2000
WHERE merchant_id = 1;

-- Step 4: Insert transaction record
INSERT INTO Transactions (user_id, merchant_id, amount, status)
VALUES (1, 1, 2000, 'SUCCESS');

COMMIT;


SELECT * FROM Users;
SELECT * FROM Merchants;
SELECT * FROM Transactions;