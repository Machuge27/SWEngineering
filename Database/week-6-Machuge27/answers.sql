-- Question 1
SELECT 
    b.TotalAmount, 
    b.Status, 
    p.paymentDate, 
    p.PaymentMethod, 
    p.PaymentAmount
FROM 
    bills b
INNER JOIN 
    payments p ON b.BillID = p.BillID;

-- Question 2
SELECT
    c.customerName,
    c.email,
    c.customerAddress,
    b.TotalAmount,
    b.Status
FROM
    customer c
LEFT JOIN
    bills b ON c.customerID = b.customerID;

-- Question 3
SELECT
    B.BillDate,
    B.DueDate,
    B.Status,
    BI.ItemDescription,
    BI.Quantity,
    BI.LineTotal,
    DATEDIFF(b.DueDate, b.BillDate) AS Number_of_Days
FROM
    bills B
RIGHT JOIN
    bill_items BI ON B.BillID = BI.BillID;

-- Question 4
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

CREATE TABLE user_profiles (
    profile_id INT PRIMARY KEY,
    user_id INT UNIQUE,
    profile_data TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Question 5
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Question 6
SELECT 
    c.CategoryName, 
    b.TotalAmount, 
    b.DueDate, 
    cu.customerName, 
    cu.customerAddress
FROM 
    categories c
INNER JOIN 
    bills b ON c.CategoryID = b.CategoryID
LEFT JOIN 
    customer cu ON b.CustomerID = cu.CustomerID;

