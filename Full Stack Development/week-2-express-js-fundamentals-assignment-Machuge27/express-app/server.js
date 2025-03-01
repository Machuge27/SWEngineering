const express = require('express');
const app = express();
const port = 3000;  
app.get('/', (req, res) => {
  res.send('Hello World!');
});
const users = [
    { id: 1, name: 'John Doe' },
    { id: 2, name: 'Jane Doe' },
    { id: 3, name: 'Jim Doe' },
    { id: 4, name: 'Jill Doe' },
]
app.get('/about', (req, res) => {
    res.send('About Us');
  });
app.get('/users', (req, res) => {
    res.json(users);
    });
app.get('/user/:id', (req, res) => {
    const user = user.find(u => u.id === parseInt(req.params.id));
    // req.send(`User ID: ${req.params,id}`);
    if (!user) {
        return res.status(404).send('User not found');
    }
    res.json(user);
})

app.get('/search', (req, res) => {
    const query = req.query.q;
    res.send(`Search results for: ${query}`);
});

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
    });