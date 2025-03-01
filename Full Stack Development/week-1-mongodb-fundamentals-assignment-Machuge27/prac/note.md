# MongoDB Fundamentals Assignment

## Objective
Familiarize with MongoDB CLI operations and understand the fundamentals of NoSQL databases.

## Introduction to MongoDB

MongoDB is a NoSQL database that stores data in the form of documents rather than tables, making it more flexible and scalable than traditional SQL-based relational databases. Unlike relational databases that use rows and columns, MongoDB organizes data into collections of documents that use BSON (Binary JSON) format.

### Key Characteristics of MongoDB

- **Schema-less**: No predefined structure, allowing for more flexibility.
- **Scalable**: Can handle large amounts of data efficiently.
- **High Performance**: Optimized for fast reads and writes.
- **Distributed System**: Supports replication and horizontal scaling.

### Use Cases of MongoDB

- **E-commerce platforms**: Storing product details, orders, and user data.
- **Social media applications**: Managing posts, user profiles, and real-time messaging.
- **Big Data & Analytics**: Handling massive datasets with ease.

## Step 1: Install MongoDB

### Local Installation Guide

#### Download MongoDB

Visit the official MongoDB website: [MongoDB Download](https://www.mongodb.com/try/download)

Choose the appropriate version for your operating system (Windows/Mac/Linux).

#### Installation

**Windows:**

1. Run the installer.
2. Follow the setup wizard and select "Complete" installation.
3. Ensure to check "Install MongoDB Compass" for GUI operations.

**Mac:**

Use Homebrew:
```javascript
brew install mongodb-community@6.0
```

**Linux:**

Follow instructions based on your distribution, usually via package manager.

#### Starting MongoDB

Open terminal or command prompt and start the database server:
```javascript
mongod --dbpath /your/database/path
```

Verify it’s running by connecting to the shell:
```javascript
mongo
```

### Cloud Installation Guide

#### Sign up for MongoDB Atlas

Visit [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)

1. Create an account.
2. Follow the step-by-step guide to create a free shared cluster.

## Step 2: Connect to MongoDB

### Local Connection

```javascript
mongo
```

### Cloud Connection

```javascript
mongo "your-connection-string"
```

## Step 3: Create Your First Database and Collection

### Understanding MongoDB Databases & Collections

- A **database** is a container for collections.
- A **collection** is a group of related documents (like a table in SQL).
- A **document** is a record stored in BSON format (like a row in SQL).

```javascript
use library;
db.books.insertOne({
    title: "1984",
    author: "George Orwell",
    publishedYear: 1949
});
db.books.find();
```

### Activity

1. Create a new database called `moviesDB`.
2. Insert three movie documents into a `movies` collection.
3. Retrieve all documents from the `movies` collection.

## Data Modeling in MongoDB

### Objective

Gain a deep understanding of data modeling in MongoDB. Compare embedding vs. referencing and their use cases. Design efficient database schemas for scalability and performance.

### What is Data Modeling?

Data modeling in MongoDB refers to the process of structuring data in a way that optimizes storage, retrieval, and scalability. Since MongoDB is schema-less, developers have the flexibility to design the database structure based on application needs.

### Why is Data Modeling Important?

- **Performance**: Proper structuring ensures fast query execution.
- **Scalability**: Well-optimized data models can handle large datasets.
- **Maintainability**: Makes it easier to update, delete, and retrieve data efficiently.

MongoDB provides two main approaches for structuring data:

- **Embedding (Denormalization)**
- **Referencing (Normalization)**

### Embedding Data (Denormalization)

#### Definition

Data is stored as nested sub-documents inside a single document. Improves read performance since related data is retrieved together. Best suited for one-to-few relationships.

#### Example

A user with multiple orders stored in one document:
```javascript
db.users.insertOne({
  name: "Alice",
  email: "alice@example.com",
  orders: [
    { item: "Laptop", price: 1200 },
    { item: "Mouse", price: 25 }
  ]
});
```

#### Advantages of Embedding

- Faster read operations (fewer queries needed).
- Data is self-contained, reducing joins.

#### Disadvantages

- Increases document size (MongoDB has a 16MB document size limit).
- Duplicates data when frequently updated.

### Referencing Data (Normalization)

#### Definition

Stores related data in separate collections. Uses ObjectId references (foreign keys in relational databases). Best suited for one-to-many or many-to-many relationships.

#### Example

Separating users and orders into different collections:
```javascript
db.users.insertOne({ _id: 1, name: "Bob" });
db.orders.insertOne({ userId: 1, item: "Keyboard", price: 100 });
```

#### Advantages of Referencing

- Avoids duplication of data.
- Ideal for frequently updated records.

#### Disadvantages

- Requires multiple queries (slower than embedding).
- Increases complexity of joins.

### Hands-On Practice

#### Activity 1

Create a customers collection with embedded orders. Retrieve all customers and their orders in a single query.

#### Activity 2

Create separate users and orders collections using references. Write a query to fetch all orders for a specific user.


🎯 **Objective:**

Understand and perform complex queries using the MongoDB Aggregation Pipeline.

Learn how to group, filter, and analyze data efficiently.

📖 **What is Aggregation?**

Aggregation is the process of transforming and analyzing data by applying multiple operations in a pipeline. Instead of retrieving raw data, aggregation allows for complex computations such as summation, filtering, and grouping.

🔹 **Aggregation Pipeline Stages**

- `$match` – Filters documents.
- `$group` – Groups data based on a field.
- `$sort` – Sorts data.
- `$project` – Modifies the shape of output documents.
- `$limit` – Restricts the number of results.
- `$lookup` – Performs joins between collections.

🛠️ **Step 1: Insert Sample Data**

```javascript
db.orders.insertMany([
    { userId: 1, item: "Laptop", price: 1200, quantity: 1, category: "Electronics" },
    { userId: 2, item: "Keyboard", price: 100, quantity: 2, category: "Accessories" },
    { userId: 1, item: "Mouse", price: 25, quantity: 3, category: "Accessories" },
    { userId: 3, item: "Monitor", price: 300, quantity: 1, category: "Electronics" }
]);
```

🔹 **Step 2: Run Aggregation Queries**

📊 **Query 1: Filter Orders by Price**

Retrieve orders where the price is greater than or equal to $50.

```javascript
db.orders.aggregate([
    { $match: { price: { $gte: 50 } } }
]);
```

📊 **Query 2: Group Orders by User and Calculate Total Spend**

```javascript
db.orders.aggregate([
    { $group: { _id: "$userId", totalSpent: { $sum: "$price" } } }
]);
```

📊 **Query 3: Sort Results by Total Spend Descending**

```javascript
db.orders.aggregate([
    { $group: { _id: "$userId", totalSpent: { $sum: "$price" } } },
    { $sort: { totalSpent: -1 } }
]);
```

📊 **Query 4: Calculate Total Quantity for Each Category**

```javascript
db.orders.aggregate([
    { $group: { _id: "$category", totalQuantity: { $sum: "$quantity" } } }
]);
```

📊 **Query 5: Combining Match and Group Stages**

Filter electronics items and calculate the total revenue.

```javascript
db.orders.aggregate([
    { $match: { category: "Electronics" } },
    { $group: { _id: "$category", totalRevenue: { $sum: { $multiply: [ "$price", "$quantity" ] } } } }
]);
```

📌 **Hands-On Practice:**

📌 **Activity 1:**

- Find the total sales for each product category.
- Retrieve users who have spent more than $500.

📌 **Activity 2:**

- Use `$lookup` to join users and orders collections.
- Write a query to list all orders along with the user details.


### **MongoDB `$lookup` Aggregation Stage**  

The `$lookup` stage in MongoDB is used to perform a **left outer join** between two collections. It allows you to fetch related documents from another collection and embed them into your result.

---

### **🛠 Syntax**
```json
{
  $lookup: {
    from: "<foreign_collection>",
    localField: "<field_in_current_collection>",
    foreignField: "<field_in_foreign_collection>",
    as: "<output_array_field>"
  }
}
```

**Parameters:**
- **`from`** – The name of the foreign collection to join.
- **`localField`** – The field in the current collection used for matching.
- **`foreignField`** – The field in the foreign collection to match with `localField`.
- **`as`** – The name of the output array field that will contain the joined documents.

---

### **📝 Example**
#### **Collections:**
**1️⃣ `orders` Collection:**
```json
{ "_id": 1, "customerId": 101, "product": "Laptop" }
{ "_id": 2, "customerId": 102, "product": "Phone" }
{ "_id": 3, "customerId": 101, "product": "Tablet" }
```
**2️⃣ `customers` Collection:**
```json
{ "customerId": 101, "name": "Alice", "email": "alice@example.com" }
{ "customerId": 102, "name": "Bob", "email": "bob@example.com" }
```

---

### **🔍 Query: Joining `orders` with `customers`**
```json
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customerId",
      foreignField: "customerId",
      as: "customerDetails"
    }
  }
])
```

---

### **📌 Output:**
```json
[
  {
    "_id": 1,
    "customerId": 101,
    "product": "Laptop",
    "customerDetails": [
      { "customerId": 101, "name": "Alice", "email": "alice@example.com" }
    ]
  },
  {
    "_id": 2,
    "customerId": 102,
    "product": "Phone",
    "customerDetails": [
      { "customerId": 102, "name": "Bob", "email": "bob@example.com" }
    ]
  },
  {
    "_id": 3,
    "customerId": 101,
    "product": "Tablet",
    "customerDetails": [
      { "customerId": 101, "name": "Alice", "email": "alice@example.com" }
    ]
  }
]
```
Here, `customerDetails` contains the matched documents from the `customers` collection.

---

### **🚀 Use Cases**
- Fetching **customer details** while retrieving orders.
- Merging **user profiles** with their activity logs.
- Linking **posts** with their comments in a blog system.

---

### **🔥 Advanced `$lookup` Usage**
✅ **Unwinding the Array (`$unwind`)**: Flatten the joined array into individual objects.  
✅ **Matching Specific Records (`$match`)**: Filter results after performing the join.  
✅ **Pipeline Lookups**: Perform complex lookups using aggregation pipelines.

Would you like an advanced example? 🚀😊

### **🔥 Advanced `$lookup` Usage in MongoDB**  

MongoDB's `$lookup` can be enhanced with **pipeline lookups**, **array unwinding**, and **filtering** for more complex queries. Let's dive into these advanced techniques!

---

## **1️⃣ Using `$unwind` to Flatten Joined Data**
By default, `$lookup` returns an **array** of matching documents. If you only want a **single document**, use `$unwind` to flatten the array.

### **📝 Example**
#### **Collections:**
**`orders` Collection**
```json
{ "_id": 1, "customerId": 101, "product": "Laptop" }
{ "_id": 2, "customerId": 102, "product": "Phone" }
{ "_id": 3, "customerId": 101, "product": "Tablet" }
```
**`customers` Collection**
```json
{ "customerId": 101, "name": "Alice", "email": "alice@example.com" }
{ "customerId": 102, "name": "Bob", "email": "bob@example.com" }
```

### **🔍 Query:**
```json
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customerId",
      foreignField: "customerId",
      as: "customerDetails"
    }
  },
  { $unwind: "$customerDetails" }  // Flatten the array
])
```

### **📌 Output:**
```json
[
  {
    "_id": 1,
    "customerId": 101,
    "product": "Laptop",
    "customerDetails": { "customerId": 101, "name": "Alice", "email": "alice@example.com" }
  },
  {
    "_id": 2,
    "customerId": 102,
    "product": "Phone",
    "customerDetails": { "customerId": 102, "name": "Bob", "email": "bob@example.com" }
  },
  {
    "_id": 3,
    "customerId": 101,
    "product": "Tablet",
    "customerDetails": { "customerId": 101, "name": "Alice", "email": "alice@example.com" }
  }
]
```
✅ Now, `customerDetails` is **no longer an array**!

---

## **2️⃣ Using `$lookup` with Filtering (`let` and `$expr`)**
You can filter the joined documents to return **only specific matches** instead of fetching all related documents.

### **📝 Example**
Find **only customers who have a Gmail email address**.

### **🔍 Query:**
```json
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      let: { customerIdVar: "$customerId" },
      pipeline: [
        { $match: { $expr: { $eq: ["$customerId", "$$customerIdVar"] } } },
        { $match: { "email": { $regex: "@gmail.com$" } } }  // Filter Gmail users
      ],
      as: "customerDetails"
    }
  },
  { $unwind: "$customerDetails" }
])
```
### **📌 Output (if only Bob has a Gmail email):**
```json
[
  {
    "_id": 2,
    "customerId": 102,
    "product": "Phone",
    "customerDetails": { "customerId": 102, "name": "Bob", "email": "bob@gmail.com" }
  }
]
```
✅ Now, only customers with a **Gmail address** are included!

---

## **3️⃣ Multi-Level `$lookup` (Nested Joins)**
If you have **three collections** (e.g., `orders`, `customers`, and `payments`), you can perform multiple `$lookup` operations.

### **Example Use Case**
Retrieve **orders with customer details AND payment details**.

### **🔍 Query:**
```json
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customerId",
      foreignField: "customerId",
      as: "customerDetails"
    }
  },
  { $unwind: "$customerDetails" },
  {
    $lookup: {
      from: "payments",
      localField: "_id",
      foreignField: "orderId",
      as: "paymentDetails"
    }
  }
])
```
✅ This **joins three collections** together!

---

## **🚀 Summary**
| Technique | Purpose |
|-----------|---------|
| **Basic `$lookup`** | Join two collections |
| **`$unwind`** | Flatten the joined array |
| **Filtered `$lookup`** | Use `$match` in a pipeline to filter results |
| **Multi-Level `$lookup`** | Join multiple collections together |

Would you like help implementing this in your MongoDB setup? 😊🚀

Comprehensive MongoDB Resources Guide

1. Introduction to MongoDB

MongoDB is a NoSQL database known for its scalability, flexibility, and document-oriented structure. It stores data in JSON-like BSON format and is widely used in modern web applications.

2. Installing MongoDB
Windows Installation:
Download MongoDB Community Server from MongoDB Download Center.
Run the installer and select Complete Setup.
Ensure you check "Install MongoDB as a service" for automatic startup.
Add MongoDB binaries to PATH:
Open System Properties → Advanced → Environment Variables.
Under System Variables, edit the Path variable and add:
C:\Program Files\MongoDB\Server\<version>\bin

Verify installation by running:
mongod --version

macOS Installation (Using Homebrew):
Install MongoDB via Homebrew:
brew tap mongodb/brew
brew install mongodb-community

Start MongoDB as a service:
brew services start mongodb-community

Verify installation:
mongod --version

Linux Installation (Ubuntu/Debian):
Import MongoDB public key:
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

Add MongoDB repository:
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

Install MongoDB:
sudo apt update && sudo apt install -y mongodb-org

Start MongoDB:
sudo systemctl start mongod

Enable MongoDB on boot:
sudo systemctl enable mongod

3. MongoDB Shell (mongosh)

mongosh is the interactive command-line shell for MongoDB.

Installation:
Download from the MongoDB Download Center.
Install and verify using:
mongosh --version

Basic Commands:
Start MongoDB shell:
mongosh

Show all databases:
show dbs

Create/select a database:
use myDatabase

Insert data:
db.myCollection.insertOne({ name: "Alice", age: 25 })

Find data:
db.myCollection.find()

Delete a document:
db.myCollection.deleteOne({ name: "Alice" })

4. Configuring MongoDB Atlas (Cloud Database)

MongoDB Atlas is a cloud database service offering managed MongoDB instances.

Setup Guide:
Sign up at MongoDB Atlas.
Click Create Cluster and select a cloud provider.
Configure cluster settings and create.
Set up database access and whitelist your IP.
Obtain your connection string for use in applications.
5. GUI Tool - MongoDB Compass

MongoDB Compass provides a GUI for interacting with databases visually.

Installation:
Download from MongoDB Compass.
Install and launch the application.
Connect using mongodb://localhost:27017 (for local MongoDB).
Features:
View collections and documents.
Execute aggregation pipelines.
Run queries using visual filters.
6. Learning Resources
Official MongoDB Documentation & Tutorials:
MongoDB Documentation
MongoDB Developer Hub
MongoDB University Free Courses
MongoDB Official Blog
Community & Support:
MongoDB Community Forum
MongoDB Stack Overflow
MongoDB Subreddit
Popular MongoDB Blogs:
MongoDB Engineering Blog
Scalegrid MongoDB Blog
Compose MongoDB Blog
Percona MongoDB Blog
Studio 3T MongoDB Blog
Video & Interactive Learning:
MongoDB YouTube Channel
FreeCodeCamp MongoDB Course
Books on MongoDB:
MongoDB: The Definitive Guide - O'Reilly Media
Practical MongoDB - Shakuntala Gupta
Mastering MongoDB - Alex Giamas
7. Advanced MongoDB Features
Indexing in MongoDB

Indexes improve query performance.

db.myCollection.createIndex({ name: 1 })

Replication

Replication ensures high availability by synchronizing data across multiple servers.

rs.initiate()

Sharding

Sharding enables horizontal scaling for large datasets.

sh.enableSharding("myDatabase")

8. Conclusion

MongoDB is a powerful NoSQL database suitable for modern applications. Using tools like Compass, Atlas, and mongosh, you can efficiently manage databases. Stay updated with MongoDB blogs and community discussions to enhance your expertise.

For the latest updates, visit MongoDB News.

[Session 2:](https://powerlearnproject-org.zoom.us/rec/share/F98cbVsLB2j1M0AzX1Doisrwa2fNOe0CiIaz1dhL4MiI0MJA59B2wE251PG_geGh.mTvB-Yb4-lNwNfDf) 
Passcode: 8.Y55Rh&

### Additional

### **🔥 MongoDB CRUD Operations (Create, Read, Update, Delete) with Examples**  

CRUD stands for **Create, Read, Update, and Delete**—the four basic operations you can perform on a database. Below is a breakdown of each operation in **MongoDB**, with examples. 🚀  

---

## **1️⃣ Create (Insert Data)**
Used to insert new documents into a collection.

### **📝 Example:** Insert a single document
```json
db.students.insertOne({
  name: "Alice",
  age: 22,
  grade: "10",
  subjects: ["Math", "Science"]
})
```
✅ **Adds one student to the `students` collection.**

### **📝 Example:** Insert multiple documents
```json
db.students.insertMany([
  { name: "Bob", age: 23, grade: "11" },
  { name: "Charlie", age: 21, grade: "12" }
])
```
✅ **Inserts multiple students at once!**

---

## **2️⃣ Read (Retrieve Data)**
Used to fetch documents from a collection.

### **📝 Example:** Get all documents  
```json
db.students.find()
```
✅ **Returns all students.**

### **📝 Example:** Find a specific student by name  
```json
db.students.find({ name: "Alice" })
```
✅ **Finds Alice’s record.**

### **📝 Example:** Find students in Grade 10  
```json
db.students.find({ grade: "10" })
```
✅ **Gets all students in Grade 10.**

### **📝 Example:** Fetch specific fields (`name` & `age` only)  
```json
db.students.find({ grade: "10" }, { name: 1, age: 1, _id: 0 })
```
✅ **Excludes `_id` and shows only `name` and `age`.**

---

## **3️⃣ Update (Modify Data)**
Used to modify existing documents.

### **📝 Example:** Update Alice’s age  
```json
db.students.updateOne(
  { name: "Alice" }, 
  { $set: { age: 23 } }
)
```
✅ **Updates the first match.**

### **📝 Example:** Update multiple students in Grade 10 (increment age)  
```json
db.students.updateMany(
  { grade: "10" }, 
  { $inc: { age: 1 } }
)
```
✅ **Increases age for all students in Grade 10.**

### **📝 Example:** Replace entire document  
```json
db.students.replaceOne(
  { name: "Alice" },
  { name: "Alice", age: 24, grade: "12", city: "New York" }
)
```
✅ **Replaces everything except `_id`.**

---

## **4️⃣ Delete (Remove Data)**
Used to remove documents.

### **📝 Example:** Delete Alice’s record  
```json
db.students.deleteOne({ name: "Alice" })
```
✅ **Deletes the first match.**

### **📝 Example:** Delete all students in Grade 10  
```json
db.students.deleteMany({ grade: "10" })
```
✅ **Deletes multiple documents.**

### **📝 Example:** Delete all records (⚠ Use with caution!)  
```json
db.students.deleteMany({})
```
✅ **Empties the collection.**

---

## **5️⃣ Extra: Query with Sorting & Limits**
### **📝 Example:** Sort students by age (ascending)  
```json
db.students.find().sort({ age: 1 })
```
✅ **Sorts by age (oldest last).**

### **📝 Example:** Limit results to 2 students  
```json
db.students.find().limit(2)
```
✅ **Returns only 2 results.**

---

## **📌 CRUD Operations Summary**
| Operation | MongoDB Method | Example |
|-----------|---------------|---------|
| **Create** | `insertOne()`, `insertMany()` | Insert new students |
| **Read** | `find()`, `findOne()` | Get student data |
| **Update** | `updateOne()`, `updateMany()`, `replaceOne()` | Modify existing records |
| **Delete** | `deleteOne()`, `deleteMany()` | Remove student data |

Would you like help implementing any of these in your project? 😊

In MongoDB, the **`$and`** and **`$or`** operators are used for filtering multiple conditions in queries.  

---

### **1️⃣ `$and` Operator (Matches all conditions)**
✅ Returns documents **only if all conditions are met.**  

#### **Example:** Find students in Grade 10 **AND** age 15  
```json
db.students.find({
  $and: [
    { grade: "10" },
    { age: 15 }
  ]
})
```
✅ **Only students in Grade 10 AND aged 15 will be returned.**

👉 **Note:** If you provide multiple conditions **without `$and`**, MongoDB automatically applies an **implicit `$and`**.

```json
db.students.find({ grade: "10", age: 15 })  // Implicit $and
```

---

### **2️⃣ `$or` Operator (Matches at least one condition)**
✅ Returns documents **if at least one condition is met.**  

#### **Example:** Find students in Grade 10 **OR** age 15  
```json
db.students.find({
  $or: [
    { grade: "10" },
    { age: 15 }
  ]
})
```
✅ **Students in Grade 10 or aged 15 will be returned.**

---

### **3️⃣ `$nor` Operator (Negates Conditions)**
✅ Returns documents **that do not match any of the conditions.**  

#### **Example:** Find students **NOT** in Grade 10 **AND NOT** age 15  
```json
db.students.find({
  $nor: [
    { grade: "10" },
    { age: 15 }
  ]
})
```
✅ **Students who are NOT in Grade 10 and NOT aged 15 will be returned.**

---

### **4️⃣ `$not` Operator (Negates a Single Condition)**
✅ Used to **negate a single condition inside `$and` or `$or`.**  

#### **Example:** Find students NOT in Grade 10  
```json
db.students.find({
  grade: { $not: { $eq: "10" } }
})
```
✅ **Returns students who are NOT in Grade 10.**

---

## **📌 Summary of Operators**
| Operator | Description | Example |
|-----------|------------|---------|
| **`$and`** | Matches all conditions | `{ $and: [ { age: 15 }, { grade: "10" } ] }` |
| **`$or`** | Matches at least one condition | `{ $or: [ { age: 15 }, { grade: "10" } ] }` |
| **`$nor`** | Matches none of the conditions | `{ $nor: [ { age: 15 }, { grade: "10" } ] }` |
| **`$not`** | Negates a condition | `{ grade: { $not: { $eq: "10" } } }` |

Would you like a practical example to test in **MongoDB Compass or Terminal?** 🚀😊


