# MongoDB Fundamentals Assignment

## Objective
This assignment focuses on applying MongoDB concepts, practicing CRUD operations, and implementing data modeling.

## Prerequisites
- Install MongoDB locally or create a free cluster on MongoDB Atlas.
- Ensure MongoDB server is running.

## Setup Instructions

### 1. Install MongoDB (Local Setup)
#### Windows:
1. Download MongoDB from [MongoDB Download Center](https://www.mongodb.com/try/download/community).
2. Install it and ensure `mongod` (server) and `mongo` (shell) commands are added to the system path.
3. Start the MongoDB server:
   ```sh
   mongod --dbpath "C:\data\db"
   ```

#### macOS:
1. Install via Homebrew:
   ```sh
   brew tap mongodb/brew
   brew install mongodb-community@6.0
   ```
2. Start MongoDB:
   ```sh
   brew services start mongodb-community@6.0
   ```

#### Linux:
1. Install MongoDB:
   ```sh
   sudo apt update
   sudo apt install -y mongodb
   ```
2. Start MongoDB:
   ```sh
   sudo systemctl start mongod
   ```

### 2. Verify Installation
Run the following command to check if MongoDB is installed:
```sh
mongo --version
```

## Database and Collection Creation
1. Start the MongoDB shell:
   ```sh
   mongo
   ```
2. Create a new database `library`:
   ```sh
   use library
   ```
3. Create a collection `books` (it will be created implicitly when inserting data).

## Insert Data
```sh
db.books.insertMany([
  { title: "The Hobbit", author: "J.R.R. Tolkien", publishedYear: 1937, genre: "Fantasy", ISBN: "978-0-345-33968-3" },
  { title: "1984", author: "George Orwell", publishedYear: 1949, genre: "Dystopian", ISBN: "978-0-452-28423-4" },
  { title: "To Kill a Mockingbird", author: "Harper Lee", publishedYear: 1960, genre: "Fiction", ISBN: "978-0-06-112008-4" },
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", publishedYear: 1925, genre: "Classic", ISBN: "978-0-7432-7356-5" },
  { title: "Pride and Prejudice", author: "Jane Austen", publishedYear: 1813, genre: "Romance", ISBN: "978-0-19-280238-5" }
])
```

## Retrieve Data
```sh
// Retrieve all books
db.books.find()

// Query books by a specific author
db.books.find({ author: "George Orwell" })

// Find books published after 2000
db.books.find({ publishedYear: { $gt: 2000 } })
```

## Update Data
```sh
// Update publishedYear of a specific book
db.books.updateOne({ title: "1984" }, { $set: { publishedYear: 1950 } })

// Add a rating field to all books
db.books.updateMany({}, { $set: { rating: 5 } })
```

## Delete Data
```sh
// Delete a book by ISBN
db.books.deleteOne({ ISBN: "978-0-452-28423-4" })

// Remove all books of a particular genre
db.books.deleteMany({ genre: "Dystopian" })
```

## Data Modeling for an E-Commerce Platform
```sh
// Users Collection
db.users.insertOne({ name: "Alice", email: "alice@example.com", orders: [] })

// Products Collection
db.products.insertOne({ name: "Laptop", price: 1200, stock: 10 })

// Orders Collection
db.orders.insertOne({ userId: ObjectId("USER_ID"), productId: ObjectId("PRODUCT_ID"), quantity: 1 })
```

## Aggregation Pipeline
```sh
// Find total books per genre
db.books.aggregate([{ $group: { _id: "$genre", totalBooks: { $sum: 1 } } }])

// Calculate average published year
db.books.aggregate([{ $group: { _id: null, avgYear: { $avg: "$publishedYear" } } }])

// Identify the top-rated book
db.books.aggregate([{ $sort: { rating: -1 } }, { $limit: 1 }])
```

## Indexing
```sh
// Create an index on author field
db.books.createIndex({ author: 1 })
```

### Benefits of Indexing
- Improves query performance.
- Speeds up search operations.
- Optimizes sorting and filtering operations.

## Testing
- Use **MongoDB Compass** or shell commands to verify data insertion and retrieval.
- Test each query and ensure expected results.

## Submission
Push the following files to your GitHub repository:
- `README.md` (this file)
- MongoDB scripts used for database creation, CRUD operations, and aggregation queries.
- Screenshots of your queries and outputs (optional).

---
**Happy Coding! 🚀**

