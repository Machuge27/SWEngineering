[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=17666705&assignment_repo_type=AssignmentRepo)

[Repo](https://github.com/PLP-Database-Design/week-5-Machuge27.git)

# SQL Assignment Week 5: Database Indexing and Optimization

## 🎯 **Learning Objectives**
* ➕ Add indexes to tables and analyze their impact on query performance.
* 👤 Create user accounts and assign roles in a sample database.
* 🔒 Explore database security measures and access control for data protection.
* 💻 Practice advanced SQL queries based on real-world scenarios.

---

## 📋 **What You'll Need**
* 💻 A computer with internet access.
* ✍️ A code editor (e.g., Visual Studio Code).
* 🖥️ MySQL Workbench or another SQL database environment.

---

## 📝 **Submission Instructions**
1. 📂 Clone the project to your local computer.
2. ▶️ Run each query on MySQL Workbench and, once successful, copy and paste the query into `answers.sql` in Visual Studio Code.
3. 🗣️ Use comments to document your queries. For example:
   ```sql
   -- Question 1
   SELECT * FROM orders;

--- 

## Assignment Questions

1. ✨ **Write an SQL query** to create an index named **IdxTotalAmount** on the **TotalAmount** column to enhance query performance for **bills** table.

2. 🗑️ **Write an SQL query** to drop an index named **IdxEmail** from **customer** table.

3. 👤 **Write an SQL query** to create a user named **bob** with the password _'S$cu3r3!'_ , restricted to the localhost hostname.

4. 🔑 **Write an SQL query** to grant the **INSERT** privilege to the user **bob** on the bills database.
5. 🔐 **Write an SQL query** to change the password for the user **bob** to _'P$55!23'_

### ⚠️DO NOT FORK THIS REPO