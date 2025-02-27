import React from 'react';
import Header from './components/Header';
import Profile from './components/Profile';
import Counter from './components/Counter';
import './App.css';

function App() {
  return (
    <div className="app">
      <Header title="React Assignment" />
      
      <main className="main container">
        <div className="grid">
          <Profile initialName="John Doe" initialEmail="john@example.com" />
          <Counter />
        </div>
      </main>
      
      <footer className="footer">
        <div className="container">
          <p>React Assignment - Built with React and CSS</p>
        </div>
      </footer>
    </div>
  );
}

export default App;