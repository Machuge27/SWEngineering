## SQL Assignment Week 2: Practice SQL syntax and retrieval operations using Bill Manager Database

## Learning Objectives
- Practice basic SQL syntax and retrieval operations.
- Retrieve and filter data from a database using SQL.
- Understand how to retrieve, apply conditions,and sorting

## What You'll Need
- A computer with internet access.
- A code editor (e.g., Visual Studio Code).
- MySQL Workbench or another SQL database environment.

## Scenario
You are tasked with retrieving and managing data from a Bill Management System's database. The system tracks customer bills, including their status, due dates, and amounts. This assignment will help you practice SQL queries related to data retrieval and filtering operations.

## Submission Instructions
1. Clone the project to your local computer.
2. Create a file named **answers.sql** in your project folder.
3. Run each query on MySQL Workbench and, once successful, copy and paste the query into **answers.sql** in VS Code.
4. Use comments to document your queries. For example:
   ```sql
   -- retrieve all fields
   SELECT * FROM payments;

_Ensure that your query is correctly formatted._

## Assignment Questions

1. Write an SQL query to retrieve the **customerName**,**email** and **PhoneNumber** from the **customer table**.
2. Write an SQL query to retrieve the **customerName**,**email** and **PhoneNumber** from the **customer table**, where **customerAddress** is equal to **Kisii**
3. Write an SQL query to retrieve the **customerID**,**TotalAmount** from the **bills table**, where **status** is equal to **unpaid**
4. Write an SQL query to retrieve the **customerID**,**TotalAmount**, and **CategoryID** from the **bills table**, where **status** is equal to **paid**
5. Write an SQL query to retrieve the **customerID**,**Status** from the **bills table**, where **BillDate** is between **2024-11-01** and **2024-11-30**
6. Write an SQL query to retrieve the **billID**,**itemDescription**, and **LineTotal** from the **bill_items table** ordered **LineTotal** in descending order
7. Write an SQL query to retrieve the **billID**,**itemDescription**, and **LineTotal** from the **bill_items table** ordered **LineTotal** in ascending order
8. Write an SQL query to retrieve the **billID**,**itemDescription**, and **LineTotal** from the **bill_items table** where **LineTotal** is greater than **100**      and retreive the result in descending order using **billID**
9. Write an SQL query to retrieve the **PaymentAmount**,**PaymentMethod** from the **payments table** where **paymentMethod** like '%esa';
10. Write an SQL query to retrieve the **CustomerName**,**CustomerAddress** from the **customer table** where **CustomerAddress** like 'Ki%';

## DO NOT FORK THIS REPO
