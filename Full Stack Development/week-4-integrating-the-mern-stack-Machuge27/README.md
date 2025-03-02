**Week 4: MERN Stack Integration Project**

**Objective:**

- Develop a full-stack web application using the MERN stack.
- Apply backend and frontend integration skills.
- Practice RESTful API development and consumption.
- Implement CRUD operations and proper project structuring.

**Project Suggestion:** Build a "Task Manager" application where users can create, read, update, and delete tasks. Each task should include fields like title, description, status, and due date.

**Instructions:**

1. **Setup the Project:**
   - Create a new project folder called `mern-task-manager`.
   - Initialize both backend and frontend directories within the project.
   - Install necessary dependencies such as Express, Mongoose, React, and Axios.

2. **Backend Development:**
   - Set up an Express server and connect to MongoDB.
   - Create a `Task` model with the following fields:
     - `title` (String, required)
     - `description` (String)
     - `status` (String, default: 'pending', enum: ['pending', 'in progress', 'completed'])
     - `dueDate` (Date)
   - Implement RESTful API routes to:
     - Create a new task
     - Retrieve all tasks
     - Update a task by ID
     - Delete a task by ID
   - Use environment variables for database connection.

3. **Frontend Development:**
   - Set up a React project and configure routing.
   - Create components:
     - `TaskList` to display all tasks.
     - `TaskForm` to add or update tasks.
     - `TaskItem` to show an individual task.
   - Implement forms to capture task details.
   - Use Axios to make API requests to the backend.
   - Implement UI styling using Tailwind CSS.

4. **State Management:**
   - Use React's `useState` and `useEffect` hooks to manage task state.
   - Handle user interactions such as adding, updating, and deleting tasks.

5. **Testing:**
   - Run the backend server and test API endpoints using Postman.
   - Run the React app and ensure API calls work correctly.
   - Verify CRUD operations.

6. **Project Deployment:**
   - Deploy the backend to a cloud platform such as Render.
   - Deploy the frontend to Vercel.
   - Ensure proper connection between frontend and backend.

7. **Documentation:**
   - Write a `README.md` file including:
     - Project overview
     - Installation steps
     - API endpoint documentation
     - Features and usage guide

8. **Submission:**
   - Push your project to your GitHub repository.

**Evaluation Criteria:**

- Proper project setup and folder structuring.
- Working CRUD operations in both frontend and backend.
- Correct use of React state and hooks.
- Well-structured API endpoints with appropriate error handling.
- A functional and user-friendly UI with Tailwind CSS.
- Clear and concise documentation.

