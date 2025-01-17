const express = require('express');
const {
    getExpenses,
    addExpense,
    updateExpense,
    deleteExpense,
    calculateTotal,
} = require('../controllers/expenseController');

const router = express.Router();

router.get('/', getExpenses);
router.post('/', addExpense);
router.put('/:id', updateExpense);
router.delete('/:id', deleteExpense);
router.get('/total', calculateTotal);

module.exports = router;
