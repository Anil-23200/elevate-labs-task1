-- Customers from Hyderabad
SELECT * FROM Customers
WHERE city = 'Hyderabad';

-- Customers from Telangana AND age above 25 (if age column exists)
SELECT * FROM Customers
WHERE state = 'Telangana' AND age > 25;

-- Customers from Karnataka OR Maharashtra
SELECT * FROM Customers
WHERE state = 'Karnataka' OR state = 'Maharashtra';

-- Customers whose name starts with 'A'
SELECT * FROM Customers
WHERE first_name LIKE 'A%';

-- Customers whose name contains 'li'
SELECT * FROM Customers
WHERE first_name LIKE '%li%';

-- Customers with ID between 1 and 5
SELECT * FROM Customers
WHERE customer_id BETWEEN 1 AND 5;
