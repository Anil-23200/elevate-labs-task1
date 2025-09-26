CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO Orders VALUES
(1, 101, 'Laptop', 2, 50000, '2025-09-01'),
(2, 102, 'Mobile', 1, 20000, '2025-09-03'),
(3, 101, 'Tablet', 3, 15000, '2025-09-05'),
(4, 103, 'Laptop', 1, 55000, '2025-09-06'),
(5, 104, 'Mobile', 4, 18000, '2025-09-07'),
(6, 102, 'Tablet', 2, 16000, '2025-09-08'),
(7, 103, 'Laptop', 3, 52000, '2025-09-09');
-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM Orders;

-- Total revenue (quantity * price)
SELECT SUM(quantity * price) AS total_revenue
FROM Orders;

-- Average price of products
SELECT AVG(price) AS avg_price
FROM Orders;

-- Highest and lowest price
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM Orders;
-- Total revenue per customer
SELECT customer_id, SUM(quantity * price) AS customer_revenue
FROM Orders
GROUP BY customer_id;

-- Total quantity sold per product
SELECT product, SUM(quantity) AS total_sold
FROM Orders
GROUP BY product;

-- Average price per product
SELECT product, AVG(price) AS avg_price
FROM Orders
GROUP BY product;
-- Customers who spent more than 80,000
SELECT customer_id, SUM(quantity * price) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING SUM(quantity * price) > 80000;

-- Products with total sales greater than 3 units
SELECT product, SUM(quantity) AS total_sold
FROM Orders
GROUP BY product
HAVING SUM(quantity) > 3;

-- Customers who placed more than 2 orders
SELECT customer_id, COUNT(order_id) AS num_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;
