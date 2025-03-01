const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

const expenses = []; // Mock database
const JWT_SECRET = process.env.JWT_SECRET || 'your_secret_key';

// Middleware for authentication
const authenticateToken = (req, res, next) => {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Unauthorized' });

    jwt.verify(token, JWT_SECRET, (err, user) => {
        if (err) return res.status(403).json({ error: 'Forbidden' });
        req.user = user;
        next();
    });
};

// GET /api/expenses
router.get('/', authenticateToken, (req, res) => {
    res.json(expenses.filter((e) => e.username === req.user.username));
});

// POST /api/expenses
router.post('/', authenticateToken, (req, res) => {
    const { amount, description } = req.body;
    const expense = { id: Date.now(), username: req.user.username, amount, description };
    expenses.push(expense);
    res.status(201).json(expense);
});

module.exports = router;
