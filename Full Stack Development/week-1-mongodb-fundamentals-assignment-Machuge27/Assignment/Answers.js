/* Week 1: MongoDB Fundamentals Assignment */

// 1. Create a Database and Collection
db = connect("mongodb://localhost:27017/library");
db.createCollection("books");

// 2. Insert Data
db.books.insertMany([
  { title: "Book One", author: "Author A", publishedYear: 1999, genre: "Fiction", ISBN: "1234567890" },
  { title: "Book Two", author: "Author B", publishedYear: 2005, genre: "Non-Fiction", ISBN: "1234567891" },
  { title: "Book Three", author: "Author A", publishedYear: 2010, genre: "Fiction", ISBN: "1234567892" },
  { title: "Book Four", author: "Author C", publishedYear: 2015, genre: "Sci-Fi", ISBN: "1234567893" },
  { title: "Book Five", author: "Author D", publishedYear: 2020, genre: "Fiction", ISBN: "1234567894" }
]);

// 4. Retrieve Data
// a) Retrieve all books
db.books.find().pretty();
// b) Query books by a specific author
db.books.find({ author: "Author A" }).pretty();
// c) Find books published after the year 2000
db.books.find({ publishedYear: { $gt: 2000 } }).pretty();

// 5. Update Data
// a) Update the publishedYear of a specific book
db.books.updateOne({ ISBN: "1234567890" }, { $set: { publishedYear: 2001 } });
// b) Add a new field 'rating' to all books
db.books.updateMany({}, { $set: { rating: 4.5 } });

// 6. Delete Data
// a) Delete a book by ISBN
db.books.deleteOne({ ISBN: "1234567894" });
// b) Remove all books of a particular genre
db.books.deleteMany({ genre: "Fiction" });

// 7. Data Modeling for an E-commerce Platform
db.createCollection("users");
db.createCollection("orders");
db.createCollection("products");

// Sample documents
db.users.insertMany([
    { _id: 1, name: "John Doe", email: "john@example.com" },
    { _id: 2, name: "Jane Smith", email: "jane@example.com" },
    { _id: 3, name: "Alice Johnson", email: "alice@example.com" }
]);

db.products.insertMany([
    { _id: 101, name: "Laptop", price: 1200 },
    { _id: 102, name: "Smartphone", price: 800 },
    { _id: 103, name: "Tablet", price: 600 }
]);

db.orders.insertMany([
    { _id: 201, userId: 1, products: [{ productId: 101, quantity: 2 }] },
    { _id: 202, userId: 2, products: [{ productId: 102, quantity: 1 }] },
    { _id: 203, userId: 3, products: [{ productId: 103, quantity: 3 }] }
]);

// 8. Aggregation Pipeline
// a) Find the total number of books per genre
db.books.aggregate([{ $group: { _id: "$genre", count: { $sum: 1 } } }]);
// b) Calculate the average published year of all books
db.books.aggregate([{ $group: { _id: null, avgYear: { $avg: "$publishedYear" } } }]);
// c) Identify the top-rated book
db.books.aggregate([{ $sort: { rating: -1 } }, { $limit: 1 }]);

// 9. Indexing
// a) Create an index on the author field
db.books.createIndex({ author: 1 });
// b) Explain the benefits of indexing
db.books.explain("executionStats").find({ author: "Author A" });
