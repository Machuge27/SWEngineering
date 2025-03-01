-- Quetion 1

SELECT 
    c.CustomerID, 
    SUM(b.TotalAmount) AS TotalBillAmount
FROM 
    bills b
JOIN 
    customer c ON b.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID
ORDER BY 
    TotalBillAmount DESC
LIMIT 5;

-- Question 2

SELECT 
    CustomerID, 
    AVG(DATEDIFF(b.DueDate, b.BillDate)) AS AveragePaymentTime
FROM 
    bills b
GROUP BY 
    CustomerID;

-- Question 3

SELECT 
    c.CustomerName
FROM 
    bills b
JOIN 
    customer c ON b.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID
HAVING 
    SUM(CASE WHEN b.DueDate < b.BillDate THEN 1 ELSE 0 END) = 0;

-- Question 4

SELECT 
    SUM(LineTotal) AS TotalAmountGenerated
FROM 
    bill_items;

-- Question 5

SELECT 
    ItemDescription,
    MAX(LineTotal) AS MaxLineTotal
FROM 
    bill_items
GROUP BY 
    ItemDescription;   

-- Question 6

SELECT 
    ItemDescription, 
    MIN(LineTotal) AS MinLineTotal
FROM 
    bill_items
GROUP BY 
    ItemDescription; 

-- Question 7

SELECT 
    PaymentMethod, 
    COUNT(*) AS PaymentCount
FROM 
    payments
GROUP BY 
    PaymentMethod
ORDER BY 
    PaymentCount DESC
LIMIT 1;  

-- Question 8

SELECT 
    PaymentMethod, 
    SUM(PaymentAmount) AS TotalRevenue
FROM 
    payments
GROUP BY 
    PaymentMethod
ORDER BY 
    PaymentMethod;

-- Question 9

SELECT 
    AVG(PaymentMethod) AS AveragePaymentAmount
FROM 
    payments;

-- Question 10

SELECT 
    CategoryID, 
    SUM(TotalAmount) AS TotalRevenue
FROM 
    bills
GROUP BY 
    CategoryID
ORDER BY 
    TotalRevenue DESC
LIMIT 3;

-- Question 11

SELECT 
    c.CustomerName, 
    COUNT(*) AS UnpaidBillsCount
FROM 
    bills b
JOIN 
    customer c ON b.CustomerID = c.CustomerID
WHERE 
    b.Status = 'Unpaid' 
GROUP BY 
    c.CustomerName
ORDER BY 
    UnpaidBillsCount DESC
LIMIT 1;
