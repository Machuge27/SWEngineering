// const express = require('express');
// const bodyParser = require('body-parser');
// require('dotenv').config();

// const authRoutes = require('./routes/auth');
// const expenseRoutes = require('./routes/expenses');

// const app = express();
// const PORT = process.env.PORT || 3030;

// app.use(bodyParser.json());
// app.use('/api/auth', authRoutes);
// app.use('/api/expenses', expenseRoutes);

// app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));

const express = require('express'); // Corrected 'reqruire' to 'require'
const path = require('path'); // Add path module for more robust file path handling

const app = express();

// Use path.join to create absolute paths
app.use(express.static(path.join(__dirname, 'frontend', 'public')));

// Root route with corrected path
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend', 'public', 'index.html'));
});

// User Authentication and Expense Management API routes
const authRoutes = require('./routes/auth');
const expenseRoutes = require('./routes/expenses');

app.use('/api/auth', authRoutes);
app.use('/api/expenses', expenseRoutes);

const PORT = 3030;
app.listen(PORT, () => {
    console.log(`Server running at http://192.168.2.170:${PORT}/`);
});
