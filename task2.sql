USE EcommerceDB;
insertiion

INSERT INTO Customers (first_name, last_name, email, phone, address, city, state, country)
VALUES ('John', 'Doe', 'john.doe@example.com', '9876543210', '123 Main St', 'Hyderabad', 'Telangana', 'India');
INSERT INTO Customers (first_name, email, address, city, state, country)
VALUES ('Alice','kali', 'alice@example.com','9223465765', '45 MG Road', 'Bengaluru', 'Karnataka', 'India');

updation
 UPDATE Customers
SET phone = '9999999999'
WHERE email = 'alice@example.com';

UPDATE Customers
SET city = 'Mumbai'
WHERE state = 'Maharashtra';
Deletation
DELETE FROM Customers
WHERE email = 'john.doe@example.com';