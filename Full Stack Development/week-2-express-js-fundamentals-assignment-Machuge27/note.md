### 1. Introduction to Express.js and Setting Up a Server

🎯 **Objective:**
- Learn the fundamentals of Express.js.
- Set up a basic Express.js server.
- Understand how the request-response cycle works.
📖 **What is Express.js?**
Express.js is a fast, unopinionated, and minimalist web framework Node.js. It provides a robust set of features to build web mobile applications.
**Why Use Express.js?**
- ✅ Simplifies backend development with minimal boilerplate.
- ✅ Provides routing and middleware support.
- ✅ Supports integration with databases (MongoDB, PostgreSQL, ).
- ✅ Enables fast REST API development.
- ✅ Works seamlessly with Node.js async features.
🔹 **Understanding the Request-Response Cycle**
When a client (browser or mobile app) sends a request to a server:
1. The client makes an HTTP request (e.g., GET, POST).
2. The server receives and processes the request.
3. The server sends back a response (e.g., HTML, JSON, or errors).
🛠️ **Step 1: Install Node.js Using NVM (Node Version Manager)**
Before we install Express.js, we need to set up Node.js. The best to manage multiple versions of Node.js is by using NVM (Node ion Manager).
**Install NVM**
**Windows:**
1. Download and install NVM for Windows from [nvm-windows]ps://github.com/coreybutler/nvm-windows).
2. Run the installer and restart your terminal.
3. Verify installation:
    ```sh
    nvm version
    ```
**MacOS/Linux:**
1. Install NVM using the official script:
    ```sh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/all.sh | bash
    ```
2. Restart your terminal and verify installation:
    ```sh
    nvm --version
    ```
**Install Node.js with NVM**
```sh
nvm install node  # Installs the latest version
nvm use node      # Uses the installed version
node -v           # Verify installation
```
🛠️ **Step 2: Install Express.js and Set Up a Server**
**Initialize a new Express project:**
```sh
mkdir express-app && cd express-app
npm init -y
```
**Install Express.js:**
```sh
npm install express
```
**Project Structure:**
```
express-app/
│-- server.js
│-- package.json
│-- node_modules/
└── README.md
```
**server.js:**
```js
const express = require('express');
const app = express();
const PORT = 3000;
app.get('/', (req, res) => {
    res.send('Hello, Express.js!');
});
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
```
🔹 **Run the server:**
```sh
node server.js
```
🔹 **Test the server:** Open [http://localhost:3000/](http://lhost:3000/) in your browser.


---

### 2. Middleware and Routing in Express

🎯 **Objective:**

- Understand middleware and its types.
- Learn how to create routes in Express.js.

📖 **What is Middleware?**

Middleware functions intercept requests before they reach the final route. They can:
- ✅ Modify request/response objects.
- ✅ Execute code before handling the request.
- ✅ Terminate requests before they reach routes.
- ✅ Handle errors.

🔹 **Types of Middleware in Express.js**

- **Built-in Middleware** (e.g., `express.json()`, `express.urlencoded()`).
- **Third-party Middleware** (e.g., `morgan`, `cors`).
- **Custom Middleware** (user-defined functions).

📂 **Example: Creating Custom Middleware**

```js
app.use((req, res, next) => {
    console.log(`Request received at ${new Date().toISOString()}`);
    next();
});
```

🛠️ **Step 1: Creating Routes in Express.js**

📂 **Example Routes:**

```js
app.get('/about', (req, res) => {
    res.send('About Us Page');
});

app.get('/user/:id', (req, res) => {
    res.send(`User ID: ${req.params.id}`);
});
```

📌 **Test:** Run the server and visit [http://localhost:3000/about](http://localhost:3000/about).


### 3. Routing in Express.js

# 🎯 Objective

- Learn how to define and manage routes in Express.js.
- Understand different types of routing and their use cases.
- Use route parameters and query parameters.

## 📖 What is Routing?

Routing in Express.js determines how an application responds to client requests based on different URL paths and HTTP methods. It is one of the most essential parts of backend development, allowing developers to create endpoints for their web applications.

## 🌟 Types of Routing in Express.js

- **Static Routes**: Predefined endpoints that always return the same response.
- **Dynamic Routes**: Endpoints that accept variables as part of the URL.
- **RESTful Routes**: Follow REST principles for API design, supporting CRUD operations.
- **Middleware-based Routing**: Uses middleware functions to execute logic before handling the request.

## 🛠️ Step 1: Creating Routes

### Basic Static Route

```javascript
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('Welcome to Express.js Routing!');
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});
```

### Using Route Parameters

Route parameters are used to pass values dynamically within the URL.

```javascript
app.get('/user/:id', (req, res) => {
    res.send(`User ID: ${req.params.id}`);
});
```

### Handling Query Parameters

Query parameters are used to send optional parameters with a request.

```javascript
app.get('/search', (req, res) => {
    const query = req.query.q;
    res.send(`Search results for: ${query}`);
});
```


### 4. Building a REST API with Express.js
# 🎯 Objective

Learn how to create a REST API with Express.js.

Implement CRUD operations (Create, Read, Update, Delete).

## 📖 What is a REST API?

A REST API (Representational State Transfer API) is an architectural style that allows different software applications to communicate with each other over HTTP. REST APIs follow a standardized set of CRUD operations:

- **GET** - Retrieve data from the server.
- **POST** - Send data to the server to create new resources.
- **PUT/PATCH** - Update an existing resource.
- **DELETE** - Remove data from the server.

## 🛠️ Step 1: Setting Up a Basic REST API

### Define API Endpoints and Implement CRUD Operations

```javascript
const express = require('express');
const app = express();
app.use(express.json()); // Middleware to parse JSON data

let users = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' }
];

// GET - Retrieve all users
app.get('/users', (req, res) => {
    res.json(users);
});

// GET - Retrieve a single user by ID
app.get('/users/:id', (req, res) => {
    const user = users.find(u => u.id === parseInt(req.params.id));
    if (!user) return res.status(404).send('User not found');
    res.json(user);
});

// POST - Create a new user
app.post('/users', (req, res) => {
    const newUser = { id: users.length + 1, ...req.body };
    users.push(newUser);
    res.status(201).json(newUser);
});

// PUT - Update an existing user
app.put('/users/:id', (req, res) => {
    const user = users.find(u => u.id === parseInt(req.params.id));
    if (!user) return res.status(404).send('User not found');
    Object.assign(user, req.body);
    res.json(user);
});

// DELETE - Remove a user
app.delete('/users/:id', (req, res) => {
    users = users.filter(u => u.id !== parseInt(req.params.id));
    res.status(204).send();
});

app.listen(3000, () => console.log('Server running on port 3000'));
```

## 📖 Best Practices for Building REST APIs

- **Use Proper HTTP Methods** - Ensure that GET, POST, PUT, and DELETE are used appropriately.
- **Use Meaningful Status Codes** - Return 200 OK for success, 404 Not Found for missing resources, and 400 Bad Request for incorrect input.
- **Implement Request Validation** - Validate incoming data before processing requests.
- **Use Middleware for Authentication & Security** - Protect endpoints using authentication middleware like JWT.
- **Paginate Large Responses** - If a database query returns large amounts of data, implement pagination.


### 5. API Documentation with Swagger in Express.js

🎯 **Objective:**

- Understand the importance of API documentation.
- Learn how to set up Swagger in an Express.js application.
- Generate interactive API documentation for easy testing and integration.

📖 **What is Swagger?**

Swagger is a set of open-source tools that help developers design, build, document, and consume REST APIs. It follows the OpenAPI Specification (OAS) and allows you to create interactive API documentation, making it easier for teams and third-party users to understand and test APIs.

🌟 **Why Use Swagger?**

- ✅ Interactive API Documentation – Provides a user-friendly interface for testing APIs.
- ✅ Standardized Specification – Uses OpenAPI to ensure consistency across APIs.
- ✅ Easier Collaboration – Helps developers and teams understand API endpoints.
- ✅ Auto-Generated Documentation – Reduces manual work and ensures up-to-date API docs.

🚀 **Setting Up Swagger in an Express.js Project**

🛠️ **Step 1: Install Dependencies**

To integrate Swagger into an Express.js project, install the required package:

```sh
npm install swagger-ui-express swagger-jsdoc
```

🛠️ **Step 2: Create a Swagger Configuration File**

Create a new file `swaggerConfig.js` in the root directory:

```js
const swaggerJSDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Express API Documentation',
            version: '1.0.0',
            description: 'A simple API documentation using Swagger',
        },
        servers: [
            {
                url: 'http://localhost:3000',
            },
        ],
    },
    apis: ['./routes/*.js'], // Path to the API routes
};

const swaggerSpec = swaggerJSDoc(options);

const swaggerDocs = (app) => {
    app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};

module.exports = swaggerDocs;
```

🛠️ **Step 3: Integrate Swagger in Your Express Server**

Modify `server.js` or `app.js` to include Swagger documentation:

```js
const express = require('express');
const swaggerDocs = require('./swaggerConfig');

const app = express();
const PORT = 3000;

// Middleware
app.use(express.json());

// Initialize Swagger
swaggerDocs(app);

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
    console.log(`Swagger docs available at http://localhost:${PORT}/api-docs`);
});
```

🚀 **Documenting API Endpoints**

Swagger allows you to annotate your API routes using JSDoc comments. Let's document an example User API.

🛠️ **Step 4: Add Documentation to API Routes**

Modify the `routes/userRoutes.js` file:

```js
const express = require('express');
const router = express.Router();

/**
 * @swagger
 * /users:
 *   get:
 *     summary: Retrieve a list of users
 *     description: Returns a list of all users
 *     responses:
 *       200:
 *         description: A list of users.
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: integer
 *                     example: 1
 *                   name:
 *                     type: string
 *                     example: John Doe
 */
router.get('/users', (req, res) => {
    res.json([
        { id: 1, name: 'John Doe' },
        { id: 2, name: 'Jane Doe' }
    ]);
});

module.exports = router;
```

🎯 **Testing Swagger API Documentation**

Once your server is running, open Swagger UI in your browser at:

[http://localhost:3000/api-docs](http://localhost:3000/api-docs)

Here, you can interact with the documented API endpoints, send test requests, and view responses!

🌟 **Best Practices for API Documentation**

- **Keep It Updated** – Ensure documentation is always in sync with the API.
- **Use Clear Descriptions** – Write meaningful summaries and descriptions.
- **Include Request and Response Examples** – Help users understand how to interact with the API.
- **Organize Routes in Sections** – Group related endpoints logically.
- **Enable CORS for Public APIs** – Allow external clients to access the documentation.

📚 **Additional Resources**

- [Swagger Official Documentation](https://swagger.io/docs/)
- [OpenAPI Specification](https://swagger.io/specification/)
- [Express.js Official Documentation](https://expressjs.com/)
- [Swagger UI GitHub](https://github.com/swagger-api/swagger-ui)


### 6. Additional Resources

## 📚 Week 2: Additional Resources for Express.js

### 🌟 Official Documentation & Guides
- **Express.js Official Documentation** – The best place to understand Express.js from the creators.
- **Node.js Official Documentation** – Learn about Node.js, its core modules, and best practices.
- **NVM (Node Version Manager)** – A tool to install and manage multiple versions of Node.js.
- **MDN Web Docs – HTTP Request Methods** – Deep dive into HTTP methods used in REST APIs.

### 🔧 Middleware & Security
- **Middleware in Express.js** – Learn how middleware works and how to use it effectively.
- **CORS in Express.js** – Guide on enabling Cross-Origin Resource Sharing.
- **Helmet.js – Security Middleware** – Protect your Express apps by setting various HTTP headers.
- **OWASP Node.js Security Cheat Sheet** – Best practices for securing Express applications.

### 🔄 REST API Design & Best Practices
- **REST API Best Practices** – Understand best practices for structuring APIs.
- **API Versioning in Express.js** – Learn why and how to version your APIs.
- **Pagination in REST APIs** – Best practices for handling large datasets in APIs.

### 🧪 Testing & Debugging
- **Jest for Node.js Testing** – Guide to testing Express apps with Jest.
- **Supertest for API Testing** – A powerful library to test HTTP endpoints.
- **Postman API Testing** – Learn how to manually test APIs with Postman.
- **Debugging in Node.js** – Debugging techniques for Node.js applications.

### 🔥 Deployment & DevOps
- **Deploy Express.js on Render** – Step-by-step guide to deploying an Express app on Render.
- **Using PM2 for Process Management** – Keep your Express server running in production.
- **Logging in Express.js with Winston** – Best practices for logging errors and requests.
- **GitHub Actions for CI/CD** – Automate deployment workflows.

### 🛠️ Additional Tools & Libraries
- **Swagger for API Documentation** – Generate interactive API documentation.
- **Morgan – Request Logging Middleware** – Log HTTP requests in Express apps.
- **Socket.io – Real-Time Communication** – Learn how to add WebSockets to Express apps.
- **GraphQL with Express.js** – Build GraphQL APIs with Express.

## 7. Class Recordings

[Session 1](https://powerlearnproject-org.zoom.us/rec/share/dtnh40B774KmYaz2lz02suTkVHiFCGG78VcKVMdRh59uQv_9L2V-kZ57sk90fscM.n8NroB-tuPRCWsop)  
Passcode: 5VV2!8Rr