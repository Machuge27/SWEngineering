-- Question 1
SELECT customerName, email, phoneNumber FROM customer;

-- Question 2
SELECT customerName, email, phoneNumber FROM customer WHERE customerAddress = 'Kisii';

-- Question 3
SELECT customerId, TotalAmount FROM bills WHERE status = 'unpaid';

-- Question 4
SELECT customerId, TotalAmount, CategoryID FROM bills WHERE status = 'paid';

-- Question 5
SELECT customerId, Status FROM bills WHERE BillDate BETWEEN '2024-11-01' AND '2024-11-30';

-- Question 6
SELECT billID, itemDescription, LineTotal FROM bill_items ORDER BY LineTotal DESC;

-- Question 7
SELECT billID, itemDescription, LineTotal FROM bill_items ORDER BY LineTotal ASC;

-- Question 8
SELECT billID, itemDescription, LineTotal FROM bill_items WHERE LineTotal > 100 ORDER BY billID ASC;

-- Question 9
SELECT PaymentAmount, PaymentMethod FROM payments WHERE paymentMethod LIKE '%esa';

-- Question 10
SELECT customerName, customerAddress FROM customer WHERE customerAddress LIKE 'Ki%';






