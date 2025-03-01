**Week 2: Express.js Fundamentals Assignment**

**Objective:**

- Apply Express.js concepts learned throughout the week.
- Develop hands-on experience with creating routes, middleware, and API endpoints.
- Understand and implement RESTful APIs.

**Instructions:**

1. **Setup Express.js Project:**

   - Install Node.js using NVM.
   - Create a new project folder named `express-assignment`.
   - Initialize a Node.js project using:
     ```sh
     npm init -y
     ```
   - Install necessary dependencies:
     ```sh
     npm install express dotenv
     ```

2. **Project Structure:**

   - Organize your project files with a clear folder structure:
     ```
     express-assignment/
     │-- routes/
     │    ├── userRoutes.js
     │    ├── productRoutes.js
     │-- middleware/
     │    ├── logger.js
     │-- controllers/
     │    ├── userController.js
     │    ├── productController.js
     │-- index.js
     │-- package.json
     │-- README.md
     │-- .env
     ```

3. **Create Routes:**

   - Create `userRoutes.js` and `productRoutes.js` inside the `routes/` folder.
   - Implement RESTful routes for users and products (GET, POST, PUT, DELETE).
   - Ensure proper usage of route parameters and query strings.

4. **Implement Middleware:**

   - Create a custom middleware function in `middleware/logger.js` to log request details (method, URL, timestamp).
   - Apply middleware globally to all routes.

5. **Develop Controllers:**

   - Create controller functions in `controllers/userController.js` and `controllers/productController.js`.
   - Implement business logic to handle requests and responses.

6. **Environment Variables:**

   - Use `dotenv` to manage environment variables.
   - Define variables such as `PORT` in the `.env` file and access them inside the application.

7. **Error Handling:**

   - Implement a global error-handling middleware to catch and respond to errors gracefully.

8. **Testing:**

   - Run the server using:
     ```sh
     node index.js
     ```
   - Test API endpoints using Postman or cURL.
   - Verify routes, middleware functionality, and error handling.

9. **Documentation:**

   - Add a `README.md` with instructions on setting up and running the project.
   - Document available API endpoints with descriptions and example requests.

10. **Submission:**

   - Push your code to your GitHub repository.

**Evaluation Criteria:**

- Correct implementation of Express routes and middleware.
- Proper error handling and logging.
- Clean project structure and code organization.
- Detailed documentation with clear instructions.
- Successful testing of all endpoints.

- [git link](https://github.com/PLP-Full-Stack-Development-MERN/week-2-express-js-fundamentals-assignment-Machuge27.git)
