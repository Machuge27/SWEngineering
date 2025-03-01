import { login } from './components/login.js';
import { showExpenses } from './components/expenses.js';

const app = document.getElementById('app');

login(app, (token) => {
    showExpenses(app, token);
});
