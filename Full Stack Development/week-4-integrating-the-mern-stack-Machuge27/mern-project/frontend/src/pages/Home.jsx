import { useState, useEffect } from 'react';
import axios from 'axios';

function Home(){
    const [users, setUsers] = useState([]);
    useEffect(() => {
        axios.get('http://localhost:5000/api/users')
        .then(res => setUsers(res.data))
        .catch(err => console.log(err))
    }, []);
    return (
        <div>
            <h1>User list</h1>
            <ul>
                {users.map(user => (
                    <li key={user._id}>{user.name} - {user.email}</li>
                ))}
            </ul>
        </div>
    );
}

export default Home;