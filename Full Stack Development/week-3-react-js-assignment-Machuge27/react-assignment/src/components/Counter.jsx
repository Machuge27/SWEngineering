import React, { useState } from 'react';
import '../styles/Counter.css';

const Counter = () => {
  const [count, setCount] = useState(0);

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  const reset = () => {
    setCount(0);
  };

  return (
    <div className="counter-card">
      <h2>Counter</h2>
      
      <div className="counter-display">
        {count}
      </div>
      
      <div className="counter-buttons">
        <button
          onClick={decrement}
          className="button button-decrement"
        >
          Decrement
        </button>
        
        <button
          onClick={reset}
          className="button button-reset"
        >
          Reset
        </button>
        
        <button
          onClick={increment}
          className="button button-increment"
        >
          Increment
        </button>
      </div>
    </div>
  );
};

export default Counter;