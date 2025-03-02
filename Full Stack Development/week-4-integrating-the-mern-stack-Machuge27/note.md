[Repo](https://github.com/PLP-Full-Stack-Development-MERN/week-4-integrating-the-mern-stack-Machuge27.git)

# 1. Introduction to the MERN Stack

## 🎯 Objective:

- Understand how the four components (MongoDB, Express.js, React.js, Node.js) work together.
- Learn the overall architecture of a MERN application.

## 🛠️ Step 1: Understanding the MERN Stack

**MERN** stands for:

- **MongoDB**: A NoSQL database to store application data as flexible JSON-like documents.
- **Express.js**: A lightweight web framework to build server-side logic and handle HTTP requests.
- **React.js**: A front-end library used to build dynamic and responsive user interfaces.
- **Node.js**: A runtime environment that allows JavaScript to be run server-side.

### How it Works:

1. The React front end sends HTTP requests to the Express server.
2. Express processes these requests and interacts with MongoDB for data retrieval or storage.
3. The server sends responses back to React, dynamically updating the UI.

### Benefits of the MERN Stack:

- Full-stack JavaScript: Write both client and server-side code using the same language.
- Scalability: MongoDB's flexible schema allows seamless scaling.
- Component-based UI with React.
- RESTful API architecture with Express and Node.

## Hands-On Activities:

- **Diagram Exercise**: Draw a diagram mapping out the flow of data in a MERN application.
- **Real-Life Analogy**: Write a short explanation comparing MERN components to a retail system (e.g., MongoDB as a storage room, Express as a manager, etc.).
- **Discussion**: What are some use cases where the MERN stack might not be the best fit?

# 2. Setting Up the MERN Project

## 🎯 Objective:

- Set up a full-stack project structure with proper configuration.
- Establish backend and frontend environments.

## 🌐 Step 1: Initialize the Backend

### Create Backend Directory:

```sh
mkdir mern-project && cd mern-project
mkdir backend && cd backend
npm init -y
```

### Install Backend Dependencies:

```sh
npm install express mongoose dotenv cors
```

### Setup Backend Directory Structure:

```
backend/
├── models/
├── routes/
├── controllers/
├── config/
├── server.js
└── .env
```

### Hands-On Tasks:

- Write a `README.md` for the backend setup with clear instructions on running the server.
- Explain the role of each folder (e.g., `models/` for database schemas, `routes/` for API endpoints).

## ⚙️ Step 2: Setting Up the Express Server

### Create `server.js`:

```js
const express = require('express');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const cors = require('cors');

dotenv.config();
const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log('MongoDB Connected'))
.catch(err => console.log(err));

app.listen(process.env.PORT || 5000, () => console.log('Server running on port 5000'));
```

### Define Environment Variables: Create a `.env` file:

```
MONGO_URI=your_mongodb_connection_string
PORT=5000
```

### Hands-On Tasks:

- Test the server by running `node server.js` and visiting `http://localhost:5000`.
- Create middleware for logging incoming requests (e.g., log the method and URL).

## 📦 Step 3: Initialize the Frontend

### Set Up React Application:

```sh
npx create-react-app frontend
cd frontend
npm install axios react-router-dom
```

### Frontend Directory Structure:

```
frontend/
├── src/
│   ├── components/
│   ├── pages/
│   ├── App.jsx
│   ├── index.jsx
├── public/
├── package.json
├── README.md
```

### Hands-On Tasks:

- Write a description of each folder's purpose in the `README.md`.
- Create an initial wireframe for the React app UI.

# 3. Building the Backend

## 🎯 Objective:

- Set up an Express server.
- Connect to MongoDB.
- Create RESTful API routes and controllers.

## ⚙️ Step 1: Creating Models and Controllers

### User Model (`backend/models/User.js`):

```javascript
const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
    },
    password: {
        type: String,
        required: true,
    },
});

module.exports = mongoose.model('User', UserSchema);
```

### User Controller (`backend/controllers/userController.js`):

```javascript
const User = require('../models/User');

const getUsers = async (req, res) => {
    try {
        const users = await User.find();
        res.json(users);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

const createUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const user = new User({ name, email, password });
        await user.save();
        res.status(201).json(user);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = { getUsers, createUser };
```

## ⚙️ Step 2: Setting Up Routes

### User Routes (`backend/routes/userRoutes.js`):

```javascript
const express = require('express');
const router = express.Router();
const { getUsers, createUser } = require('../controllers/userController');

router.get('/', getUsers);
router.post('/', createUser);

module.exports = router;
```

### Connecting Routes in `server.js`:

```javascript
const userRoutes = require('./routes/userRoutes');
app.use('/api/users', userRoutes);
```

## Hands-On Tasks:

- Test endpoints (`/api/users`) using Postman or curl.
- Add validation middleware to ensure required fields are provided when creating users.

# 4. Building the Frontend

## 🎯 Objective:

- Set up routing in React.
- Make API requests using Axios.
- Display data using reusable components.

## 📊 Step 1: Set Up Routing

### Modify `App.jsx`:

```jsx
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Home.jsx';

function App() {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<Home />} />
            </Routes>
        </Router>
    );
}

export default App;
```

### Home Page Component (`pages/Home.jsx`):

```jsx
import { useState, useEffect } from 'react';
import axios from 'axios';

function Home() {
    const [users, setUsers] = useState([]);

    useEffect(() => {
        axios.get('/api/users')
            .then(res => setUsers(res.data))
            .catch(err => console.error(err));
    }, []);

    return (
        <div>
            <h1>User List</h1>
            <ul>
                {users.map(user => (
                    <li key={user._id}>{user.name} - {user.email}</li>
                ))}
            </ul>
        </div>
    );
}

export default Home;
```

## Hands-On Tasks:

- Style the user list using Tailwind CSS.
- Add loading and error states for the API call.