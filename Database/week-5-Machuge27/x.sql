use bills;

show tables;

select * 
from  customer 
limit 5;

select * 
from  customer 
where customerName like 'John%';
-- where customerName = 'John Doe';

INSERT INTO customer (customerName, email, phoneNumber, customerAddress) 
VALUES ('John Doe', 'john@example.com' , '1234567890', 'Anytown, USA');
-- ✨ Write an SQL query to create an index named IdxTotalAmount on the TotalAmount column to enhance query performance for bills table.

-- Question 1
CREATE INDEX IdxTotalAmount ON bills (TotalAmount);
CREATE INDEX IdxEmail ON customer (email);


-- 🗑️ Write an SQL query to drop an index named IdxEmail from customer table.

-- Question 2
DROP INDEX IdxEmail ON customer;



-- 👤 Write an SQL query to create a user named bob with the password 'S$cu3r3!' , restricted to the localhost hostname.

-- Question 3
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';



-- 🔑 Write an SQL query to grant the INSERT privilege to the user bob on the bills database.

-- Question 4
GRANT INSERT ON bills.* TO 'bob'@'localhost';

"""
This SQL statement is used to grant specific privileges to a user in a MySQL database. Let's break it down:

GRANT INSERT: This part of the statement specifies the type of privilege being granted. In this case, it is the INSERT privilege, which allows the user to insert new rows into tables.

ON bills.*:: This specifies the scope of the privilege. Here, bills.* means that the INSERT privilege is being granted on all tables within the bills database. The * is a wildcard that represents all tables.

TO 'bob'@'localhost';: This specifies the user to whom the privilege is being granted. In this case, the user is bob, and the @'localhost' part specifies that this user can only use this privilege when connecting from the local machine (localhost).

In summary, this statement allows the user bob to insert data into any table within the bills database, but only when bob is connecting from the local machine.
"""



-- 🔐 Write an SQL query to change the password for the user bob to 'P$55!23'

-- Question 5
SET PASSWORD FOR 'bob'@'localhost' = 'P$55!23';


-- 📋 Write an SQL query to check the existing indexes on the customer table.

-- Question 6
SHOW INDEX FROM customer;


-- 📋 Write an SQL query to check the existing users in the MySQL database.
SELECT User, Host FROM mysql.user;


-- Write a query to revoke the INSERT privilege from the user bob on the bills database.

-- Question 7
REVOKE SELECT ON bills.* FROM 'bob'@'localhost';

-- Write a query to give pop permission to use bills database

-- Question 8
REVOKE ALL PRIVILEGES ON bills.* FROM 'bob'@'localhost';

