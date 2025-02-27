import React from 'react';
import '../styles/global.css'
import styles from '../styles/Button.module.css';

function Greetings(props){
    const inlineStyles = {
        color: 'blue',
        backgroundColor: 'lightblue',
        padding: '10px',
        borderRadius: '5px',
        fontSize: '20px',
        textAlign: 'center',
        margin: '10px 0'
    }
    return (
        <div>
            <h1 style={inlineStyles}>Hello {props.firstName}!</h1>
            <p>Welcome to our React Deep-dive session. ✨🎉</p>
            <button className={styles.button}>Click Me 👍</button>
        </div>
    )
}

export default Greetings;
