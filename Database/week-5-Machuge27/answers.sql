-- Question 1
CREATE INDEX IdxTotalAmount ON bills (TotalAmount);

-- Question 2
DROP INDEX IdxEmail ON customer;

-- Question 3
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- Question 4
GRANT INSERT ON bills.* TO 'bob'@'localhost';

-- Question 5
SET PASSWORD FOR 'bob'@'localhost' = 'P$55!23';


