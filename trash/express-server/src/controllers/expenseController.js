let expenses = [];

exports.getExpenses = (req, res) => {
    res.json(expenses);
};

exports.addExpense = (req, res) => {
    const { description, amount } = req.body;
    const newExpense = { id: expenses.length + 1, description, amount };
    expenses.push(newExpense);
    res.status(201).json(newExpense);
};

exports.updateExpense = (req, res) => {
    const { id } = req.params;
    const { description, amount } = req.body;
    const index = expenses.findIndex(e => e.id === parseInt(id));
    if (index !== -1) {
        expenses[index] = { id: parseInt(id), description, amount };
        res.json(expenses[index]);
    } else {
        res.status(404).json({ error: 'Expense not found' });
    }
};

exports.deleteExpense = (req, res) => {
    const { id } = req.params;
    const index = expenses.findIndex(e => e.id === parseInt(id));
    if (index !== -1) {
        expenses.splice(index, 1);
        res.status(204).send();
    } else {
        res.status(404).json({ error: 'Expense not found' });
    }
};

exports.calculateTotal = (req, res) => {
    const total = expenses.reduce((sum, expense) => sum + expense.amount, 0);
    res.json({ total });
};
