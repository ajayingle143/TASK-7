# TASK-7
📄 Customer Orders Database – MySQL Project
This project demonstrates how to create and manage a simple relational database in MySQL using tables, foreign keys, inserts, and views. It simulates a basic customer and order management system.

🗃️ Database Name
ajay

📦 Tables Used
1. Customers
Stores customer details.

Column Name	Data Type	Description
customer_id	INT (Primary)	Unique customer ID
name	VARCHAR(100)	Customer's full name
city	VARCHAR(50)	Customer's city

2. Orders
Stores order information linked to customers.

Column Name	Data Type	Description
order_id	INT (Primary)	Unique order ID
customer_id	INT (Foreign Key)	References Customers(customer_id)
amount	DECIMAL(10,2)	Order total amount
order_date	DATE	Date the order was placed

🔄 Relationships
Orders.customer_id is a foreign key that references Customers.customer_id.

This models a one-to-many relationship: one customer can have many orders.

📥 Sample Data Inserted
Customers
sql
Copy
Edit
INSERT INTO Customers VALUES
(1, 'Amit', 'Pune'),
(2, 'Sneha', 'Mumbai'),
(3, 'Raj', 'Delhi'),
(4, 'Priya', 'Pune');
Orders
sql
Copy
Edit
INSERT INTO Orders VALUES
(101, 1, 500.00, '2024-06-01'),
(102, 2, 150.00, '2024-06-02'),
(103, 1, 300.00, '2024-06-05'),
(104, 3, 800.00, '2024-06-08');
👁️ View Created
CustomerOrderSummary
This view shows each customer and the total amount they’ve spent on orders.

🔧 SQL:
sql
Copy
Edit
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
📊 Example Output:
customer_id	customer_name	total_spent
1	Amit	800.00
2	Sneha	150.00
3	Raj	800.00

🧹 Clean-up
To delete the view:

sql
Copy
Edit
DROP VIEW IF EXISTS CustomerOrderSummary;
🛠️ Requirements
MySQL Server (e.g., MySQL 8.0+)

MySQL Workbench or any SQL IDE

✅ How to Run
Copy the full SQL script into MySQL Workbench.

Execute the script to:

Create the database and tables.

Insert data.

Create the view.

Run:

sql
Copy
Edit
SELECT * FROM CustomerOrderSummary;
to see the summary view.


