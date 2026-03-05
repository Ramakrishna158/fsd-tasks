CREATE DATABASE order_management;
USE order_management;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Sample Customers
INSERT INTO Customers (name, email, city) VALUES
('Arun', 'arun@gmail.com', 'Chennai'),
('Bhavya', 'bhavya@gmail.com', 'Bangalore'),
('Charan', 'charan@gmail.com', 'Hyderabad');

-- Insert Sample Products
INSERT INTO Products (product_name, price) VALUES
('Laptop', 60000),
('Mobile', 20000),
('Headphones', 3000);

-- Insert Sample Orders
INSERT INTO Orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2024-01-10'),
(1, 2, 2, '2024-02-15'),
(2, 2, 1, '2024-02-18'),
(3, 3, 3, '2024-03-01'),
(2, 1, 1, '2024-03-05');