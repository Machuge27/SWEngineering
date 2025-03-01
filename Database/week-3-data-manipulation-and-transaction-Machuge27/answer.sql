-- Write your answers here

-- Question 1
create table categories(
categoryId int auto_increment primary key ,
categoryName varchar(50) not null
);

-- Question 2
INSERT INTO categories (categoryName)
VALUES
    ('Electronics'),
    ('Furniture'),
    ('Groceries'),
    ('Clothing'),
    ('Utilities');

-- Question 3
CREATE TABLE customer(
	customerID INT AUTO_INCREMENT PRIMARY KEY,
	customerName VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phoneNumber VARCHAR(11),
    customerAddress VARCHAR(20),
    dateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Question 4
INSERT INTO customer (customerName, email, phoneNumber, customerAddress)
VALUES('Kiprotich Hillary', 'kiprotichhillary@gmail.com', '1234567890', 'Westlands'),
    ('Jane Machara', 'machariajane@gmail.com', '0987654321', 'Parklands'),
    ('Alice Njoroge', 'alice.brown@gmail.com', '1122334455', 'Kilimani'),
    ('Bob Waweru', 'wawerubob@gmail.com', '5566778899', 'Ngong');

-- Question 5
UPDATE customer 
SET customerAddress =  "Lavington"
WHERE customerId IN (1, 2);    

-- Question 6
DELETE FROM categories
WHERE categoryId = 2;




