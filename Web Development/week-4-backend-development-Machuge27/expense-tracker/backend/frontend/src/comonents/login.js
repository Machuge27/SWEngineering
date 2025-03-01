import { loginUser } from '../api.js';

export const login = (container, onSuccess) => {
    container.innerHTML = `
        <h1>Login</h1>
        <form id="loginForm">
            <input type="text" id="username" placeholder="Username" required />
            <input type="password" id="password" placeholder="Password" required />
            <button type="submit">Login</button>
        </form>
        <div id="error"></div>
    `;

    const form = document.getElementById('loginForm');
    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        try {
            const token = await loginUser(username, password);
            onSuccess(token);
        } catch (error) {
            document.getElementById('error').textContent = error.message;
        }
    });
};
