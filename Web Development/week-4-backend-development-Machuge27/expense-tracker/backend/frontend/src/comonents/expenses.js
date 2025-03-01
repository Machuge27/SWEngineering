import { getExpenses, addExpense } from '../api.js';

export const showExpenses = async (container, token) => {
    const expenses = await getExpenses(token);

    container.innerHTML = `
        <h1>Your Expenses</h1>
        <ul>
            ${expenses.map((e) => `<li>${e.description}: $${e.amount}</li>`).join('')}
        </ul>
        <form id="expenseForm">
            <input type="number" id="amount" placeholder="Amount" required />
            <input type="text" id="description" placeholder="Description" required />
            <button type="submit">Add Expense</button>
        </form>
    `;

    const form = document.getElementById('expenseForm');
    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const amount = parseFloat(document.getElementById('amount').value);
        const description = document.getElementById('description').value;

        await addExpense(token, { amount, description });
        showExpenses(container, token);
    });
};
