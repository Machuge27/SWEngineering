const BASE_URL = 'http://localhost:3030';

export const loginUser = async (username, password) => {
    const response = await fetch(`${BASE_URL}/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password }),
    });
    if (!response.ok) throw new Error('Login failed');
    const { token } = await response.json();
    return token;
};

export const getExpenses = async (token) => {
    const response = await fetch(`${BASE_URL}/expenses`, {
        headers: { Authorization: `Bearer ${token}` },
    });
    return response.json();
};

export const addExpense = async (token, expense) => {
    await fetch(`${BASE_URL}/expenses`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(expense),
    });
};
