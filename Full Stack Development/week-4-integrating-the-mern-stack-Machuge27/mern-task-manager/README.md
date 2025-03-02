# MERN Task Manager

A full-stack task management application built with the MERN stack (MongoDB, Express, React, Node.js).

<!-- ![Task Manager Screenshot](https://picsum.photos/800/400) -->

![alt text](frontend/public/image-2.png)

## Features

- Create, view, update, and delete tasks
- Task status tracking (pending, in progress, completed)
- Due date assignment for tasks
- Responsive design using Tailwind CSS
- RESTful API with Express and MongoDB

## Tech Stack

### Backend
- Node.js
- Express.js
- MongoDB with Mongoose ODM
- Cors for cross-origin requests
- Dotenv for environment variables

### Frontend
- React
- React Router for navigation
- Axios for API requests
- React Hot Toast for notifications
- Tailwind CSS for styling
- Date-fns for date formatting

## Installation

### Prerequisites
- Node.js (v14 or higher)
- MongoDB Atlas account (or local MongoDB installation)
- Git

### Clone the Repository
```bash
git clone https://github.com/PLP-Full-Stack-Development-MERN/week-4-integrating-the-mern-stack-Machuge27.git
cd mern-task-manager
```

### Backend Setup
1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the backend directory with the following variables:
```
NODE_ENV=development
PORT=5000
MONGO_URI=mongodb+srv://your_username:your_password@cluster0.mongodb.net/taskmanager?retryWrites=true&w=majority
```
Replace the MONGO_URI with your MongoDB connection string.

4. Start the backend server:
```bash
npm run dev
```
The server will run on http://localhost:5000

### Frontend Setup
1. Open a new terminal and navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the frontend directory:
```
REACT_APP_API_URL=http://localhost:5000/api
```

4. Start the frontend development server:
```bash
npm start
```
The application will open in your browser at http://localhost:3000

## API Endpoints

### Tasks
- `GET /api/tasks` - Get all tasks
- `GET /api/tasks/:id` - Get a specific task by ID
- `POST /api/tasks` - Create a new task
- `PUT /api/tasks/:id` - Update a task
- `DELETE /api/tasks/:id` - Delete a task

### Request & Response Examples

#### Get all tasks
```
GET /api/tasks
```

Response:
```json
[
  {
    "_id": "60f7b0b9e1b9a02d58b5a2c3",
    "title": "Complete MERN project",
    "description": "Finish the task manager project",
    "status": "in progress",
    "dueDate": "2023-04-15T00:00:00.000Z",
    "createdAt": "2023-04-01T12:00:00.000Z",
    "updatedAt": "2023-04-02T09:30:00.000Z"
  },
  {
    "_id": "60f7b0f3e1b9a02d58b5a2c4",
    "title": "Learn TypeScript",
    "description": "Complete TypeScript course",
    "status": "pending",
    "dueDate": "2023-04-30T00:00:00.000Z",
    "createdAt": "2023-04-01T13:00:00.000Z",
    "updatedAt": "2023-04-01T13:00:00.000Z"
  }
]
```

#### Create a new task
```
POST /api/tasks
Content-Type: application/json

{
  "title": "Study React Hooks",
  "description": "Learn about useContext and useMemo",
  "status": "pending",
  "dueDate": "2023-04-20"
}
```

Response:
```json
{
  "_id": "60f7b12ce1b9a02d58b5a2c5",
  "title": "Study React Hooks",
  "description": "Learn about useContext and useMemo",
  "status": "pending",
  "dueDate": "2023-04-20T00:00:00.000Z",
  "createdAt": "2023-04-03T10:15:00.000Z",
  "updatedAt": "2023-04-03T10:15:00.000Z"
}
```
![alt text](frontend/public/image.png)

![alt text](frontend/public/image-1.png)

