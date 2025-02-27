# React Assignment

This project demonstrates React components, state management with hooks, and basic CSS styling.

## Features

- Header component with title
- Profile component with editable user information
- Counter component with increment, decrement, and reset functionality
- Responsive design using vanilla CSS

## Project Structure

```
react-assignment/
├── public/
├── css/
│   ├── Header.css
│   ├── Profile.css
│   └── Counter.css
├── src/
│   ├── components/
│   │   ├── Header.js
│   │   ├── Profile.js
│   │   └── Counter.js
│   ├── App.js
│   ├── App.css
│   ├── index.js
│   └── index.css
├── package.json
└── README.md
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/PLP-Full-Stack-Development-MERN/week-3-react-js-assignment-Machuge27.git
cd react-assignment
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

4. Open your browser and navigate to:
```
http://localhost:3000
```

## Components

### Header
- Displays the application title
- Styled with basic CSS for a clean look

### Profile
- Displays user information (name and email)
- Allows editing of user information
- Uses useState hook to manage form state
- Toggle between view and edit modes

### Counter
- Displays a counter with buttons to increment, decrement, and reset
- Uses useState hook to manage count state
- Styled with CSS for visual appeal

## Technologies Used

- React.js
- CSS
- React Hooks (useState)

## Screenshots

(Add screenshots of your application here)

## Future Improvements

- Add form validation for the Profile component
- Implement dark mode toggle
- Add local storage to persist user data
- Add more interactive components

## License

MIT