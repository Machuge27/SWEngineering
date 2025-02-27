import React, { useState, useEffect } from 'react';
import { Home, TrendingUp, Thermometer, Droplets, Zap, Shield, BellRing, Power, Tv, Coffee, Fan, Refrigerator, Wind, Moon, LayoutDashboard } from 'lucide-react';

const SmartHomeIoT = () => {
  const [lights, setLights] = useState([]);
  // State for rooms and devices
  const [rooms, setRooms] = useState({
    'Living Room': {
      temperature: 72,
      lights: true,
      blinds: 50,
      tv: false,
      motion: false,
      powerConsumption: {
        lights: 0.06,
        tv: 0.12
      }
    },
    'Kitchen': {
      temperature: 74,
      lights: false,
      coffeemaker: false,
      refrigerator: { temp: 38, status: 'normal' },
      powerConsumption: {
        lights: 0.08,
        coffeemaker: 0.9,
        refrigerator: 0.15
      }
    },
    'Bedroom': {
      temperature: 68,
      lights: false,
      blinds: 100,
      fan: false,
      powerConsumption: {
        lights: 0.05,
        fan: 0.03
      }
    },
    'Bathroom': {
      temperature: 75,
      lights: false,
      humidity: 65,
      powerConsumption: {
        lights: 0.04
      }
    }
  });
  
  // State for system metrics
  const [systemMetrics, setSystemMetrics] = useState({
    power: 2.4, // kWh
    network: 'Connected',
    security: 'Armed',
    notifications: []
  });
  
  // State for active room
  const [activeRoom, setActiveRoom] = useState('Living Room');
  const [activeTab, setActiveTab] = useState('devices');
  
  // Calculate total power consumption
  useEffect(() => {
    let totalPower = 0;
    
    Object.entries(rooms).forEach(([roomName, roomData]) => {
      Object.entries(roomData.powerConsumption).forEach(([device, power]) => {
        // Only add power if device is on
        if ((device === 'lights' && roomData.lights) ||
            (device === 'tv' && roomData.tv) ||
            (device === 'fan' && roomData.fan) ||
            (device === 'coffeemaker' && roomData.coffeemaker) ||
            (device === 'refrigerator')) { // refrigerator is always on
          totalPower += power;
        }
      });
    });
    
    // Add HVAC consumption based on temperature differences
    const outsideTemp = 85; // assumed outdoor temperature
    Object.values(rooms).forEach(room => {
      const tempDiff = Math.abs(outsideTemp - room.temperature);
      totalPower += tempDiff * 0.01; // Power increases as temperature difference increases
    });
    
    setSystemMetrics(prev => ({
      ...prev,
      power: parseFloat(totalPower.toFixed(2))
    }));
  }, [rooms]);
  
  // Handle light toggle
  const toggleLight = (room) => {
    setRooms({
      ...rooms,
      [room]: {
        ...rooms[room],
        lights: !rooms[room].lights
      }
    });
    
    // Add notification
    addNotification(`${room} lights turned ${!rooms[room].lights ? 'on' : 'off'}`);
  };
  
  // Handle device toggle
  const toggleDevice = (room, device) => {
    setRooms({
      ...rooms,
      [room]: {
        ...rooms[room],
        [device]: !rooms[room][device]
      }
    });
    
    // Add notification
    addNotification(`${room} ${device} turned ${!rooms[room][device] ? 'on' : 'off'}`);
  };
  
  // Handle temperature change
  const changeTemperature = (room, change) => {
    setRooms({
      ...rooms,
      [room]: {
        ...rooms[room],
        temperature: rooms[room].temperature + change
      }
    });
    
    // Add notification
    addNotification(`${room} temperature set to ${rooms[room].temperature + change}°F`);
  };
  
  // Handle blinds adjustment
  const adjustBlinds = (room, value) => {
    setRooms({
      ...rooms,
      [room]: {
        ...rooms[room],
        blinds: value
      }
    });
    
    // Add notification
    addNotification(`${room} blinds adjusted to ${value}%`);
  };
  
  // Add notification
  const addNotification = (message) => {
    const newNotification = {
      id: Date.now(),
      message: message,
      time: new Date().toLocaleTimeString()
    };
    
    setSystemMetrics({
      ...systemMetrics,
      notifications: [newNotification, ...systemMetrics.notifications].slice(0, 5)
    });
  };
  
  // Toggle security system
  const toggleSecurity = () => {
    const newStatus = systemMetrics.security === 'Armed' ? 'Disarmed' : 'Armed';
    
    setSystemMetrics({
      ...systemMetrics,
      security: newStatus
    });
    
    // Add notification
    addNotification(`Security system ${newStatus}`);
  };
  
  // Simulate motion detection
  const simulateMotion = (room) => {
    if (room === 'Living Room') {
      setRooms({
        ...rooms,
        [room]: {
          ...rooms[room],
          motion: true
        }
      });
      
      // Add notification
      addNotification(`Motion detected in ${room}`);
      
      // Reset after 3 seconds
      setTimeout(() => {
        setRooms(prevRooms => ({
          ...prevRooms,
          [room]: {
            ...prevRooms[room],
            motion: false
          }
        }));
      }, 3000);
    }
  };
  
  // Get device power consumption
  const getDevicePower = (room, device) => {
    if (rooms[room].powerConsumption && rooms[room].powerConsumption[device]) {
      return rooms[room].powerConsumption[device];
    }
    return 0;
  };
  
  // Check if device is active
  const isDeviceActive = (room, device) => {
    if (device === 'lights') return rooms[room].lights;
    if (device === 'tv') return rooms[room].tv;
    if (device === 'fan') return rooms[room].fan;
    if (device === 'coffeemaker') return rooms[room].coffeemaker;
    if (device === 'refrigerator') return true; // Always on
    return false;
  };
  
  // Function to render the floorplan simulation
  const renderFloorplan = () => {
    return (
      <div className="bg-white rounded-lg shadow p-6">
        <h3 className="font-semibold mb-6">Home Floorplan</h3>
        
        <div className="relative w-full h-64 border-2 border-gray-300 rounded">
          {/* Living Room */}
          <div 
            className={`absolute top-0 left-0 w-1/2 h-1/2 border-r-2 border-b-2 border-gray-300 p-2 ${rooms['Living Room'].motion ? 'bg-red-50' : rooms['Living Room'].lights ? 'bg-yellow-50' : 'bg-white'}`}
            onClick={() => setActiveRoom('Living Room')}
          >
            <div className="text-xs font-medium mb-1">Living Room</div>
            <div className="flex items-center space-x-1 mb-1">
              <Thermometer className="h-3 w-3 text-orange-500" />
              <span className="text-xs">{rooms['Living Room'].temperature}°F</span>
            </div>
            {rooms['Living Room'].lights && <div className="absolute top-1/4 right-1/4 w-3 h-3 rounded-full bg-yellow-400 animate-pulse"></div>}
            {rooms['Living Room'].tv && <div className="absolute bottom-1/4 left-1/4 w-6 h-3 bg-blue-400"></div>}
          </div>
          
          {/* Kitchen */}
          <div 
            className={`absolute top-0 right-0 w-1/2 h-1/2 border-b-2 border-gray-300 p-2 ${rooms['Kitchen'].lights ? 'bg-yellow-50' : 'bg-white'}`}
            onClick={() => setActiveRoom('Kitchen')}
          >
            <div className="text-xs font-medium mb-1">Kitchen</div>
            <div className="flex items-center space-x-1 mb-1">
              <Thermometer className="h-3 w-3 text-orange-500" />
              <span className="text-xs">{rooms['Kitchen'].temperature}°F</span>
            </div>
            {rooms['Kitchen'].lights && <div className="absolute top-1/4 right-1/4 w-3 h-3 rounded-full bg-yellow-400 animate-pulse"></div>}
            {rooms['Kitchen'].coffeemaker && <div className="absolute bottom-1/4 right-1/4 w-3 h-3 rounded bg-brown-400"></div>}
            <div className="absolute bottom-1/4 left-1/4 w-3 h-5 rounded bg-gray-300"></div> {/* Refrigerator */}
          </div>
          
          {/* Bedroom */}
          <div 
            className={`absolute bottom-0 left-0 w-1/2 h-1/2 border-r-2 border-gray-300 p-2 ${rooms['Bedroom'].lights ? 'bg-yellow-50' : 'bg-white'}`}
            onClick={() => setActiveRoom('Bedroom')}
          >
            <div className="text-xs font-medium mb-1">Bedroom</div>
            <div className="flex items-center space-x-1 mb-1">
              <Thermometer className="h-3 w-3 text-orange-500" />
              <span className="text-xs">{rooms['Bedroom'].temperature}°F</span>
            </div>
            {rooms['Bedroom'].lights && <div className="absolute top-1/4 right-1/4 w-3 h-3 rounded-full bg-yellow-400 animate-pulse"></div>}
            {rooms['Bedroom'].fan && <div className="absolute bottom-1/4 right-1/4 w-4 h-4 rounded-full border-2 border-blue-400 animate-spin"></div>}
          </div>
          
          {/* Bathroom */}
          <div 
            className={`absolute bottom-0 right-0 w-1/2 h-1/2 p-2 ${rooms['Bathroom'].lights ? 'bg-yellow-50' : 'bg-white'}`}
            onClick={() => setActiveRoom('Bathroom')}
          >
            <div className="text-xs font-medium mb-1">Bathroom</div>
            <div className="flex items-center space-x-1 mb-1">
              <Thermometer className="h-3 w-3 text-orange-500" />
              <span className="text-xs">{rooms['Bathroom'].temperature}°F</span>
            </div>
            <div className="flex items-center space-x-1 mb-1">
              <Droplets className="h-3 w-3 text-blue-500" />
              <span className="text-xs">{rooms['Bathroom'].humidity}%</span>
            </div>
            {rooms['Bathroom'].lights && <div className="absolute top-1/4 right-1/4 w-3 h-3 rounded-full bg-yellow-400 animate-pulse"></div>}
          </div>
        </div>
      </div>
    );
  };
  
  // Function to render the power consumption chart
  const renderPowerChart = () => {
    const deviceColors = {
      lights: 'bg-yellow-500',
      tv: 'bg-blue-500',
      fan: 'bg-green-500',
      coffeemaker: 'bg-amber-700',
      refrigerator: 'bg-sky-700',
      hvac: 'bg-orange-500'
    };
    
    // Calculate HVAC consumption
    const hvacConsumption = parseFloat((systemMetrics.power - Object.values(rooms).reduce((total, room) => {
      let roomConsumption = 0;
      Object.entries(room.powerConsumption).forEach(([device, power]) => {
        if (isDeviceActive(room, device)) {
          roomConsumption += power;
        }
      });
      return total + roomConsumption;
    }, 0)).toFixed(2));
    
    return (
      <div className="bg-white rounded-lg shadow p-6 mt-6">
        <h3 className="font-semibold mb-6">Power Consumption by Device</h3>
        
        <div className="space-y-4">
          {Object.keys(rooms).map(roomName => (
            <div key={roomName} className="border-b pb-4">
              <h4 className="font-medium text-sm mb-2">{roomName}</h4>
              {Object.entries(rooms[roomName].powerConsumption).map(([device, power]) => (
                <div key={device} className="flex items-center justify-between mb-2">
                  <div className="flex items-center space-x-2">
                    <div className={`w-3 h-3 rounded-full ${deviceColors[device]}`}></div>
                    <span className="text-sm capitalize">{device}</span>
                  </div>
                  <div className="flex items-center space-x-2">
                    <span className={`text-xs ${isDeviceActive(roomName, device) ? 'text-green-600' : 'text-gray-400'}`}>
                      {isDeviceActive(roomName, device) ? 'Active' : 'Inactive'}
                    </span>
                    <span className="text-sm font-medium">
                      {isDeviceActive(roomName, device) ? `${power} kWh` : '0 kWh'}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          ))}
          
          <div className="border-b pb-4">
            <h4 className="font-medium text-sm mb-2">HVAC System</h4>
            <div className="flex items-center justify-between mb-2">
              <div className="flex items-center space-x-2">
                <div className="w-3 h-3 rounded-full bg-orange-500"></div>
                <span className="text-sm">Climate Control</span>
              </div>
              <div className="flex items-center space-x-2">
                <span className="text-xs text-green-600">Active</span>
                <span className="text-sm font-medium">{hvacConsumption} kWh</span>
              </div>
            </div>
          </div>
          
          <div className="flex items-center justify-between font-medium">
            <span>Total Consumption</span>
            <span>{systemMetrics.power} kWh</span>
          </div>
        </div>
      </div>
    );
  };
  
  return (
    <div className="flex flex-col min-h-screen bg-gray-100">
      {/* Header */}
      <header className="bg-blue-600 text-white p-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center space-x-2">
            <Home className="h-6 w-6" />
            <h1 className="text-xl font-bold">Smart Home IoT Control Center</h1>
          </div>
          <div className="flex items-center space-x-4">
            <div className="flex items-center space-x-1">
              <Zap className="h-5 w-5" />
              <span>{systemMetrics.power} kWh</span>
            </div>
            <div className="flex items-center space-x-1">
              <Shield className={systemMetrics.security === 'Armed' ? 'text-green-300 h-5 w-5' : 'text-red-300 h-5 w-5'} />
              <span>{systemMetrics.security}</span>
            </div>
          </div>
        </div>
      </header>
      
      {/* Main Content */}
      <div className="flex flex-1 overflow-hidden">
        {/* Sidebar */}
        <aside className="w-64 bg-gray-800 text-white p-4">
          <nav>
            <h2 className="text-lg font-semibold mb-4">Rooms</h2>
            <ul className="space-y-2">
              {Object.keys(rooms).map(room => (
                <li key={room}>
                  <button
                    className={`w-full text-left px-4 py-2 rounded hover:bg-gray-700 flex items-center justify-between ${activeRoom === room ? 'bg-gray-700' : ''}`}
                    onClick={() => setActiveRoom(room)}
                  >
                    <span>{room}</span>
                    <div className="flex items-center space-x-2">
                      {rooms[room].lights && <div className="h-2 w-2 rounded-full bg-yellow-400"></div>}
                      {room === 'Living Room' && rooms[room].motion && <div className="h-2 w-2 rounded-full bg-red-400"></div>}
                    </div>
                  </button>
                </li>
              ))}
            </ul>
            
            <h2 className="text-lg font-semibold mt-6 mb-4">System</h2>
            <ul className="space-y-2">
              <li>
                <button 
                  className={`w-full text-left px-4 py-2 rounded hover:bg-gray-700 ${activeTab === 'dashboard' ? 'bg-gray-700' : ''}`}
                  onClick={() => setActiveTab('dashboard')}
                >
                  Dashboard
                </button>
              </li>
              <li>
                <button 
                  className={`w-full text-left px-4 py-2 rounded hover:bg-gray-700 ${activeTab === 'simulation' ? 'bg-gray-700' : ''}`}
                  onClick={() => setActiveTab('simulation')}
                >
                  Simulation
                </button>
              </li>
              <li>
                <button 
                  className={`w-full text-left px-4 py-2 rounded hover:bg-gray-700 ${activeTab === 'notifications' ? 'bg-gray-700' : ''}`}
                  onClick={() => setActiveTab('notifications')}
                >
                  Notifications
                </button>
              </li>
              <li>
                <button 
                  className={`w-full text-left px-4 py-2 rounded hover:bg-gray-700 ${activeTab === 'devices' ? 'bg-gray-700' : ''}`}
                  onClick={() => setActiveTab('devices')}
                >
                  Devices
                </button>
              </li>
            </ul>
          </nav>
        </aside>
        
        {/* Content Area */}
        <main className="flex-1 p-6 overflow-auto">
          {activeTab === 'devices' && (
            <div>
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-2xl font-bold">{activeRoom}</h2>
                <button
                  className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 shadow"
                  onClick={() => simulateMotion(activeRoom)}
                >
                  Simulate Activity
                </button>
              </div>
              
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {/* Temperature Control */}
                <div className="bg-white rounded-lg shadow p-6">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="font-semibold flex items-center">
                      <Thermometer className="h-5 w-5 mr-2 text-orange-500" />
                      Temperature
                    </h3>
                    <span className="text-2xl font-bold">{rooms[activeRoom].temperature}°F</span>
                  </div>
                  <div className="flex justify-between space-x-4">
                    <button
                      className="flex-1 py-2 bg-blue-100 text-blue-800 rounded hover:bg-blue-200"
                      onClick={() => changeTemperature(activeRoom, -1)}
                    >
                      -
                    </button>
                    <button
                      className="flex-1 py-2 bg-red-100 text-red-800 rounded hover:bg-red-200"
                      onClick={() => changeTemperature(activeRoom, 1)}
                    >
                      +
                    </button>
                  </div>
                </div>
                
                {/* Lighting Control */}
                <div className="bg-white rounded-lg shadow p-6">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="font-semibold flex items-center">
                      <Power className="h-5 w-5 mr-2 text-yellow-500" />
                      Lights
                    </h3>
                    <div
                      className={`relative w-12 h-6 transition-colors duration-200 ease-in-out rounded-full ${
                        rooms[activeRoom].lights ? 'bg-green-400' : 'bg-gray-200'
                      }`}
                      onClick={() => toggleLight(activeRoom)}
                    >
                      <div
                        className={`absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-transform duration-200 ease-in-out transform ${
                          rooms[activeRoom].lights ? 'translate-x-6' : 'translate-x-0'
                        }`}
                      ></div>
                    </div>
                  </div>
                  <div className="flex justify-between text-gray-500">
                    <span>{rooms[activeRoom].lights ? 'ON' : 'OFF'}</span>
                    <span>{rooms[activeRoom].lights ? getDevicePower(activeRoom, 'lights') : 0} kWh</span>
                  </div>
                </div>
                
                {/* Blinds Control (if available) */}
                {'blinds' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Wind className="h-5 w-5 mr-2 text-blue-500" />
                        Blinds
                      </h3>
                      <span className="text-sm">{rooms[activeRoom].blinds}% open</span>
                    </div>
                    <input
                      type="range"
                      min="0"
                      max="100"
                      value={rooms[activeRoom].blinds}
                      onChange={(e) => adjustBlinds(activeRoom, parseInt(e.target.value))}
                      className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer"
                    />
                  </div>
                )}
                
                {/* TV Control (if available) */}
                {'tv' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Tv className="h-5 w-5 mr-2 text-gray-500" />
                        Television
                      </h3>
                      <div
                        className={`relative w-12 h-6 transition-colors duration-200 ease-in-out rounded-full ${
                          rooms[activeRoom].tv ? 'bg-green-400' : 'bg-gray-200'
                        }`}
                        onClick={() => toggleDevice(activeRoom, 'tv')}
                      >
                        <div
                          className={`absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-transform duration-200 ease-in-out transform ${
                            rooms[activeRoom].tv ? 'translate-x-6' : 'translate-x-0'
                          }`}
                        ></div>
                      </div>
                    </div>
                    <div className="flex justify-between text-gray-500">
                      <span>{rooms[activeRoom].tv ? 'ON' : 'OFF'}</span>
                      <span>{rooms[activeRoom].tv ? getDevicePower(activeRoom, 'tv') : 0} kWh</span>
                    </div>
                  </div>
                )}
                
                {/* Fan Control (if available) */}
                {'fan' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Fan className="h-5 w-5 mr-2 text-blue-500" />
                        Fan
                      </h3>
                      <div
                        className={`relative w-12 h-6 transition-colors duration-200 ease-in-out rounded-full ${
                          rooms[activeRoom].fan ? 'bg-green-400' : 'bg-gray-200'
                        }`}
                        onClick={() => toggleDevice(activeRoom, 'fan')}
                      >
                        <div
                          className={`absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-transform duration-200 ease-in-out transform ${
                            rooms[activeRoom].fan ? 'translate-x-6' : 'translate-x-0'
                          }`}
                        ></div>
                      </div>
                    </div>
                    <div className="flex justify-between text-gray-500">
                      <span>{rooms[activeRoom].fan ? 'ON' : 'OFF'}</span>
                      <span>{rooms[activeRoom].fan ? getDevicePower(activeRoom, 'fan') : 0} kWh</span>
                    </div>
                  </div>
                )}
                
                {/* Coffee Maker Control (if available) */}
                {'coffeemaker' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Coffee className="h-5 w-5 mr-2 text-amber-700" />
                        Coffee Maker
                      </h3>
                      <div
                        className={`relative w-12 h-6 transition-colors duration-200 ease-in-out rounded-full ${
                          rooms[activeRoom].coffeemaker ? 'bg-green-400' : 'bg-gray-200'
                        }`}
                        onClick={() => toggleDevice(activeRoom, 'coffeemaker')}
                      >
                        <div
                          className={`absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-transform duration-200 ease-in-out transform ${
                            rooms[activeRoom].coffeemaker ? 'translate-x-6' : 'translate-x-0'
                          }`}
                        ></div>
                      </div>
                    </div>
                    <div className="flex justify-between text-gray-500">
                      <span>{rooms[activeRoom].coffeemaker ? 'BREWING' : 'OFF'}</span>
                      <span>{rooms[activeRoom].coffeemaker ? getDevicePower(activeRoom, 'coffeemaker') : 0} kWh</span>
                    </div>
                  </div>
                )}
                
                {/* Humidity Display (if available) */}
                {'humidity' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Droplets className="h-5 w-5 mr-2 text-blue-500" />
                        Humidity
                      </h3>
                      <span className="text-2xl font-bold">{rooms[activeRoom].humidity}%</span>
                    </div>
                    <div className="w-full bg-gray-200 rounded-full h-2.5">
                      <div 
                        className="bg-blue-400 h-2.5 rounded-full" 
                        style={{ width: `${rooms[activeRoom].humidity}%` }}
                      ></div>
                    </div>
                  </div>
                )}
                
                {/* Refrigerator Status (if available) */}
                {'refrigerator' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Refrigerator className="h-5 w-5 mr-2 text-blue-500" />
                        Refrigerator
                      </h3>
                      <span className="text-2xl font-bold">{rooms[activeRoom].refrigerator.temp}°F</span>
                    </div>
                    <div className="flex justify-between text-gray-500">
                      <span>Status: {rooms[activeRoom].refrigerator.status}</span>
                      <span>{getDevicePower(activeRoom, 'refrigerator')} kWh</span>
                    </div>
                  </div>
                )}
                
                {/* Motion Sensor (if available) */}
                {'motion' in rooms[activeRoom] && (
                  <div className="bg-white rounded-lg shadow p-6">
                    <div className="flex items-center justify-between mb-4">
                      <h3 className="font-semibold flex items-center">
                        <Moon className="h-5 w-5 mr-2 text-purple-500" />
                        Motion Sensor
                      </h3>
                      <span className={`text-sm font-medium px-2.5 py-0.5 rounded ${
                        rooms[activeRoom].motion ? 'bg-red-100 text-red-800' : 'bg-green-100 text-green-800'
                      }`}>
                        {rooms[activeRoom].motion ? 'Motion Detected' : 'No Motion'}
                      </span>
                    </div>
                    <div className="text-center">
                      <button
                        className="px-4 py-2 bg-purple-100 text-purple-800 rounded hover:bg-purple-200"
                        onClick={() => simulateMotion(activeRoom)}
                      >
                        Simulate Motion
                      </button>
                    </div>
                  </div>
                )}
                
                {/* Security Control */}
                <div className="bg-white rounded-lg shadow p-6">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="font-semibold flex items-center">
                      <Shield className="h-5 w-5 mr-2 text-blue-500" />
                      Security
                    </h3>
                    <div
                      className={`relative w-12 h-6 transition-colors duration-200 ease-in-out rounded-full ${
                        systemMetrics.security === 'Armed' ? 'bg-green-400' : 'bg-red-400'
                      }`}
                      onClick={toggleSecurity}
                    >
                      <div
                        className={`absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-transform duration-200 ease-in-out transform ${
                          systemMetrics.security === 'Armed' ? 'translate-x-6' : 'translate-x-0'
                        }`}
                      ></div>
                    </div>
                  </div>
                  <div className="text-center text-sm">
                    {systemMetrics.security === 'Armed' ? 'System is armed and active' : 'System is disarmed'}
                  </div>
                </div>
              </div>
            </div>
          )}
          
          {activeTab === 'dashboard' && (
            <div>
              <h2 className="text-2xl font-bold mb-6 flex items-center">
                <LayoutDashboard className="h-6 w-6 mr-2" />
                System Dashboard
              </h2>
              
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                {/* System Summary */}
                <div className="bg-white rounded-lg shadow p-6">
                  <h3 className="font-semibold mb-4">System Summary</h3>
                  
                  <div className="space-y-4">
                    <div className="flex justify-between items-center border-b pb-2">
                      <div className="flex items-center">
                        <Power className="h-5 w-5 mr-2 text-blue-500" />
                        <span>Total Power Consumption</span>
                      </div>
                      <span className="font-medium">{systemMetrics.power} kWh</span>
                    </div>
                    
                    <div className="flex justify-between items-center border-b pb-2">
                      <div className="flex items-center">
                        <Thermometer className="h-5 w-5 mr-2 text-orange-500" />
                        <span>Average Temperature</span>
                      </div>
                      <span className="font-medium">
                        {(Object.values(rooms).reduce((sum, room) => sum + room.temperature, 0) / Object.keys(rooms).length).toFixed(1)}°F
                      </span>
                    </div>
                    
                    <div className="flex justify-between items-center border-b pb-2">
                      <div className="flex items-center">
                        <Shield className="h-5 w-5 mr-2 text-blue-500" />
                        <span>Security Status</span>
                      </div>
                      <span className={`font-medium ${systemMetrics.security === 'Armed' ? 'text-green-600' : 'text-red-600'}`}>
                        {systemMetrics.security}
                      </span>
                    </div>
                    
                    <div className="flex justify-between items-center pb-2">
                      <div className="flex items-center">
                        <Power className="h-5 w-5 mr-2 text-yellow-500" />
                        <span>Active Lights</span>
                      </div>
                      <span className="font-medium">
                        {Object.values(rooms).filter(room => room.powerConsumption.lights).length} / {Object.keys(rooms).length}
                      </span>
                    </div>
                  </div>
                </div>
                
                {renderFloorplan()}
                
                {renderPowerChart()}
              </div>
            </div>
          )}
          
          {activeTab === 'simulation' && (
            <div>
              <h2 className="text-2xl font-bold mb-6 flex items-center">
                <TrendingUp className="h-6 w-6 mr-2" />
                Home Simulation
              </h2>
              
              <div className="bg-white rounded-lg shadow p-6 mb-6">
                <h3 className="font-semibold mb-6">Simulation Controls</h3>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium mb-2">Simulate Motion</label>
                    <div className="space-y-2">
                      {Object.keys(rooms).map(room => (
                        <button
                          key={room}
                          className="w-full px-4 py-2 bg-purple-100 text-purple-800 rounded hover:bg-purple-200 mb-2"
                          onClick={() => simulateMotion(room)}
                        >
                          {room}
                        </button>
                      ))}
                    </div>
                  </div>
                  
                  <div>
                    <label className="block text-sm font-medium mb-2">Quick Actions</label>
                    <div className="space-y-2">
                      <button 
                        className="w-full px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
                        onClick={() => {
                          // Turn off all lights
                          const newRooms = {...rooms};
                          Object.keys(newRooms).forEach(room => {
                            newRooms[room] = {...newRooms[room], lights: false};
                          });
                          setRooms(newRooms);
                          addNotification('All lights turned off');
                        }}
                      >
                        Turn Off All Lights
                      </button>
                      
                      <button 
                        className="w-full px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700"
                        onClick={() => {
                          // Set eco mode (reduce temperature by 2)
                          const newRooms = {...rooms};
                          Object.keys(newRooms).forEach(room => {
                            newRooms[room] = {...newRooms[room], temperature: newRooms[room].temperature - 2};
                          });
                          setRooms(newRooms);
                          addNotification('Eco mode activated');
                        }}
                      >
                        Activate Eco Mode
                      </button>
                      
                      <button 
                        className="w-full px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700"
                        onClick={() => {
                          toggleSecurity();
                          // Turn on all lights if disarming
                          if (systemMetrics.security === 'Armed') {
                            const newRooms = {...rooms};
                            Object.keys(newRooms).forEach(room => {
                              newRooms[room] = {...newRooms[room], lights: true};
                            });
                            setRooms(newRooms);
                            addNotification('Welcome home mode activated');
                          }
                        }}
                      >
                        {systemMetrics.security === 'Armed' ? 'Disarm & Welcome Home' : 'Arm Security System'}
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              
              {renderFloorplan()}
            </div>
          )}
          
          {activeTab === 'notifications' && (
            <div>
              <h2 className="text-2xl font-bold mb-6 flex items-center">
                <BellRing className="h-6 w-6 mr-2" />
                System Notifications
              </h2>
              
              <div className="bg-white rounded-lg shadow">
                <div className="p-4 border-b bg-gray-50">
                  <h3 className="font-semibold">Recent Activity</h3>
                </div>
                
                {systemMetrics.notifications.length > 0 ? (
                  <ul className="divide-y divide-gray-200">
                    {systemMetrics.notifications.map(notification => (
                      <li key={notification.id} className="p-4 hover:bg-gray-50">
                        <div className="flex justify-between">
                          <p>{notification.message}</p>
                          <p className="text-sm text-gray-500">{notification.time}</p>
                        </div>
                      </li>
                    ))}
                  </ul>
                ) : (
                  <div className="p-4 text-center text-gray-500">
                    No recent notifications
                  </div>
                )}
              </div>
            </div>
          )}
        </main>
      </div>
    </div>
  );
};

export default SmartHomeIoT;