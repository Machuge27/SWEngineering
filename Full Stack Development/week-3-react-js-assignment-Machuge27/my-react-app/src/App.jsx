import React, { PropTypes, Component, useState } from 'react'
import Greetings from './components/Greetings'
import Profile from './components/Profile'
import Counter from './components/Counter'
import Timer from './components/Timer'
import './App.css'

function App() {
  const [count, setCount] = useState(0)
  const firstName = 'Hillary';
  const lastName = 'Mutai';
  const age = 21;
  const profession = 'Software Developer';

  return (
    <>
      <div>
        <Greetings name={firstName} />
        <Counter />
        <Timer />
        {/* <Profile {...{firstName, lastName, age, profession}} /> */}
      </div>
    </>
  )
}

export default App
