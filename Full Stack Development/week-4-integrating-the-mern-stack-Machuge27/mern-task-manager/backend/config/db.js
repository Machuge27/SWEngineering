const dotenv = require('dotenv');
const mongoose = require('mongoose');
dotenv.config();

let username = encodeURIComponent(process.env.MONGO_USERNAME);
let password = encodeURIComponent(process.env.MONGO_PASSWORD);

let uri = `mongodb+srv://${username}:${password}@cluster0.ch21p.mongodb.net/taskManagerDB?retryWrites=true&w=majority&appName=Cluster0`;

const connectDB = async () => {
  try {
    console.log("Connecting ${username} to MongoDB");

    const conn = await mongoose.connect(uri);

    console.log(`MongoDB Connected: ${conn.connection.host}`);
  } catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
  }
};

module.exports = connectDB;


// taskManagerDB