# SQL Assignment Week 3:
[Repo](https://github.com/PLP-Database-Design/week-3-data-manipulation-and-transaction-Machuge27.git)

## Learning Objectives
- Understand and practice SQL syntax for data manipulation and retrieval.
- Perform CRUD (Create, Read, Update, Delete) operations on a database.
- Write queries with conditions, sorting, and aggregations to extract meaningful insights.
- Implement SQL transactions to ensure data integrity when performing multiple operations.


---

## What You'll Need
- A computer with internet access.
- A code editor (e.g., Visual Studio Code).
- MySQL Workbench or another SQL database environment.



## Scenario
You are tasked with retrieving and managing data from a Bill Management System's database. The system tracks customer bills, including their status, due dates, and amounts. It also handles payments and categorizes the bills according to different categories (e.g., electronics, furniture). This assignment will help you practice SQL queries related to data retrieval, filtering, transactions, and aggregations.

---

## Submission Instructions
1. Clone the project to your local computer.
2. Run each query on MySQL Workbench and, once successful, copy and paste the query into **answer.sql** in Visual Studio Code.
3. Use comments to document your queries. For example:
   ```sql
   -- Question 1
   SELECT * FROM orders;
After completing all queries, push your answers.sql file to GitHub and submit it for review.

# Assignment Questions
You are tasked with creating a database for a bill management system. 

--- 
One of the tables in this system is the **categories** table, which stores information about different categories of bills.

1. Write an SQL query to create the **categories** table with the following requirements:
      
      I. The table should have a primary key column named **categoryID** which is an integer and will auto-increment.  
      II. The table should have another column named **categoryName** which is a string (VARCHAR) that can hold up to 50 characters.

---
2. Write an SQL query to insert at least **5 categories** into the categories table. Each category should have a unique **categoryName**
---
3. You are tasked with creating a table for storing customer information in a bills management system. Write an SQL query to create the **customer** table with       the following requirements:
   - The table should have a primary key column named **customerID**, which is an integer and will auto-increment.
   - The table should include the following columns:
      - **customerName**: A string (VARCHAR) that can hold up to 50 characters. This field should not allow **NULL** values.
      - **email**: A string (VARCHAR) that can hold up to 50 characters.
      - **phoneNumber**: A string (VARCHAR) that can hold up to 11 characters.
      - **customerAddress**: A string (VARCHAR) that can hold up to 20 characters.
      - **dateCreated**: A timestamp that records the time the customer was added to the database. The default value should be the current timestamp.
---
 4. You are tasked with inserting data into the **customer** table. Write an SQL query to insert at least **4 customer records** into the table.
---
 5. You need to update the **customerAddress** to "Lavington" for two customers in the **customer** table. The customers have the following **customerID**:

       1. customerID = 1 and customerID = 2
      
      2. Write an SQL query to update the **customerAddress** to "Lavington" for both customers.
      
     3.  _Make sure to use the correct **WHERE** condition to select the customers by **customerID**._

---
6. You are tasked with deleting a category from the **categories** table. Write an SQL query to delete the category where the **categoryID** is equal to 2.
### DO NOT FOR THIS REPO
