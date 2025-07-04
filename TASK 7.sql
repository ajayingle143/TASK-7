-- Drop previous database if it exists and create a new one
DROP DATABASE IF EXISTS ajay;
CREATE DATABASE ajay;
USE ajay;

-- Create Customers table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  amount DECIMAL(10, 2),
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Customers
INSERT INTO Customers VALUES
(1, 'Ajay', 'Pune'),
(2, 'Sneha', 'Mumbai'),
(3, 'Atul', 'Delhi'),
(4, 'Prashant', 'Pune');

-- Insert data into Orders
INSERT INTO Orders VALUES
(101, 1, 500.00, '2024-06-01'),
(102, 2, 150.00, '2024-06-02'),
(103, 1, 300.00, '2024-06-05'),
(104, 3, 800.00, '2024-06-08');

-- ✅ Create a view to show customer names and total amount spent
CREATE VIEW CustomerOrderSummary AS
SELECT 
    C.customer_id,
    C.name AS customer_name,
    SUM(O.amount) AS total_spent
FROM 
    Customers C
JOIN 
    Orders O ON C.customer_id = O.customer_id
GROUP BY 
    C.customer_id, C.name;

-- ✅ View the data from the view
SELECT * FROM CustomerOrderSummary;
