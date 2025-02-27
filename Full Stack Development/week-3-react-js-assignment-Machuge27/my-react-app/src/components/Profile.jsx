import React from 'react'

const Profile = ({firstName, lastName, age, profession}) => (
    <div>
        <h1>{firstName} {lastName}</h1>
        <p>Age: {age}</p>
        <p>Profession: {profession}</p>
    </div>
)


export default Profile