import React, { useState,useEffect } from 'react'

function Timer() {
    const [seconds, setSeconds] = useState(0);
    const [isRunning, setIsRunning] = useState(true);
    useEffect(() => {
        let interval;
        if (isRunning) {
            interval = setInterval(() => {
            setSeconds(seconds => seconds + 1);
            }, 1000);
        }
        return () => clearInterval(interval);
    }, [isRunning])
    const toggleTimer = () => {
        setIsRunning(prevIsRunning => !prevIsRunning);
    }
  return (
<>
        <h2>Timer: {seconds} seconds</h2>
        <button onClick={toggleTimer}>{ isRunning? 'Pause' : 'Resume' }</button>
</>
  );
}

export default Timer