SELECT 
    c.name AS Customer_Name,
    p.product_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS Total_Amount,
    o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC;


SELECT 
    c.name AS Customer_Name,
    p.product_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS Total_Amount,
    o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC;


SELECT *
FROM (
    SELECT 
        o.order_id,
        c.name,
        (o.quantity * p.price) AS Total_Amount
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    JOIN Products p ON o.product_id = p.product_id
) AS OrderTotals
WHERE Total_Amount = (
    SELECT MAX(quantity * price)
    FROM Orders o
    JOIN Products p ON o.product_id = p.product_id
);


SELECT name, total_orders
FROM (
    SELECT c.name, COUNT(o.order_id) AS total_orders
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) AS CustomerOrders
WHERE total_orders = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS OrderCounts
);