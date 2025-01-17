const bcrypt = require('bcrypt');
const jwt = require('../utils/jwtUtils');

const mockUsers = [
    { id: 1, username: 'test', password: bcrypt.hashSync('password', 10) },
];

exports.login = async (req, res, next) => {
    try {
        const { username, password } = req.body;
        const user = mockUsers.find(u => u.username === username);
        if (!user || !bcrypt.compareSync(password, user.password)) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }
        const token = jwt.generateToken({ id: user.id, username: user.username });
        res.json({ token });
    } catch (err) {
        next(err);
    }
};
