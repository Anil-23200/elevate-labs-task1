-- Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    city VARCHAR(100)
);

-- Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2)
);
INSERT INTO Customers VALUES
(1, 'John', 'Hyderabad'),
(2, 'Alice', 'Bengaluru'),
(3, 'Bob', 'Mumbai'),
(4, 'Eve', 'Delhi');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 55000),
(102, 1, 'Mobile', 20000),
(103, 2, 'Tablet', 15000),
(104, 3, 'Headphones', 3000);
-- Show each customer's name and their total spent
SELECT first_name,
       (SELECT SUM(amount) 
        FROM Orders 
        WHERE Orders.customer_id = Customers.customer_id) AS total_spent
FROM Customers;
-- Show customers who spent more than the average order amount
SELECT first_name
FROM Customers c
WHERE (SELECT SUM(amount) 
       FROM Orders o 
       WHERE o.customer_id = c.customer_id) > 
      (SELECT AVG(amount) FROM Orders);
-- Customers who made at least one order above 50,000
SELECT first_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM Orders 
    WHERE amount > 50000
);

-- Customers who placed an order (EXISTS)
SELECT first_name
FROM Customers c
WHERE EXISTS (
    SELECT 1 
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);

-- Customers with exactly one order (= subquery)
SELECT first_name
FROM Customers
WHERE (SELECT COUNT(*) 
       FROM Orders 
       WHERE Orders.customer_id = Customers.customer_id) = 1;
-- Find average spent per customer using subquery in FROM
SELECT sub.customer_id, sub.total_spent
FROM (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) AS sub
WHERE sub.total_spent > 20000;
