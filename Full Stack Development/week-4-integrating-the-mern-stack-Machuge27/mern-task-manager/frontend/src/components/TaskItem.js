import React from 'react';
import { Link } from 'react-router-dom';
import { format } from 'date-fns';

const TaskItem = ({ task, onDelete }) => {
  const getStatusClass = (status) => {
    switch (status) {
      case 'completed':
        return 'bg-green-100 text-green-800';
      case 'in progress':
        return 'bg-blue-100 text-blue-800';
      default:
        return 'bg-yellow-100 text-yellow-800';
    }
  };

  const formatDate = (date) => {
    if (!date) return 'No due date';
    try {
      return format(new Date(date), 'MMM dd, yyyy');
    } catch (error) {
      return 'Invalid date';
    }
  };

  return (
    <div className="bg-white rounded-lg shadow-md overflow-hidden">
      <div className="p-4">
        <div className="flex justify-between items-start">
          <h3 className="text-lg font-semibold text-gray-800 mb-2">{task.title}</h3>
          <span className={`px-2 py-1 rounded-full text-xs font-medium ${getStatusClass(task.status)}`}>
            {task.status}
          </span>
        </div>
        
        <p className="text-gray-600 mb-4 line-clamp-3">{task.description}</p>
        
        <div className="flex items-center text-sm text-gray-500 mb-4">
          <svg className="h-4 w-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
          </svg>
          <span>{formatDate(task.dueDate)}</span>
        </div>
        
        <div className="flex justify-end gap-2">
          <Link to={`/edit/${task._id}`} className="text-sm bg-gray-100 hover:bg-gray-200 text-gray-800 py-1 px-3 rounded">
            Edit
          </Link>
          <button 
            onClick={() => onDelete(task._id)}
            className="text-sm bg-red-100 hover:bg-red-200 text-red-800 py-1 px-3 rounded"
          >
            Delete
          </button>
        </div>
      </div>
    </div>
  );
};

export default TaskItem;