const dotenv = require('dotenv');
dotenv.config();

const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');

let username = encodeURIComponent(process.env.MONGO_USERNAME);
let password = encodeURIComponent(process.env.MONGO_PASSWORD);
const cluster = "<clusterName>";
const authSource = "<authSource>";
const authMechanism = "<authMechanism>";

let uri = `mongodb+srv://${username}:${password}@cluster0.ch21p.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`;

const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect(uri)
.then(() => console.log('MongoDB Connected'))
.catch(err => console.log(err));

app.get('/', (req, res) => {
    res.send("Task Manager API is running...");
});

app.use('/api/users', userRoutes);

app.listen(process.env.PORT || 5000, () => console.log('Server running on port 5000'));
