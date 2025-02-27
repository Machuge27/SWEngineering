import React, { useState } from 'react';
import '../styles/Profile.css';

const Profile = ({ initialName, initialEmail }) => {
  const [name, setName] = useState(initialName || '');
  const [email, setEmail] = useState(initialEmail || '');
  const [isEditing, setIsEditing] = useState(false);

  const handleSave = () => {
    setIsEditing(false);
  };

  return (
    <div className="profile-card">
      <h2>User Profile</h2>
      
      {isEditing ? (
        <div className="profile-form">
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input
              id="name"
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
          </div>
          
          <div className="form-group">
            <label htmlFor="email">Email</label>
            <input
              id="email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>
          
          <button
            onClick={handleSave}
            className="button button-primary"
          >
            Save
          </button>
        </div>
      ) : (
        <div className="profile-info">
          <div className="info-row">
            <span className="info-label">Name:</span>
            <span className="info-value">{name}</span>
          </div>
          
          <div className="info-row">
            <span className="info-label">Email:</span>
            <span className="info-value">{email}</span>
          </div>
          
          <button
            onClick={() => setIsEditing(true)}
            className="button button-primary"
          >
            Edit Profile
          </button>
        </div>
      )}
    </div>
  );
};

export default Profile;