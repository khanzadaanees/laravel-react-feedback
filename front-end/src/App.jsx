import { useEffect, useState } from 'react'
import './App.css'
import Header from './components/Header'
import { Route, Routes, Navigate, useNavigate } from 'react-router-dom'
import Login from './pages/Login'
import Home from './pages/Home'
import Register from './pages/Register'
import Addfeedback from './pages/Addfeedback'
import Viewfeedback from './pages/Viewfeedback'

function App() {
  const navigate = useNavigate();
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const checkUserToken = () => {
      const userToken = localStorage.getItem('token');
      if (userToken && userToken !== 'undefined') {
        setIsLoggedIn(true);
      } else {
        navigate('/login');
        setIsLoggedIn(false);
      }
    };
    checkUserToken();
  }, [isLoggedIn]);


  const handleLogout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    setIsLoggedIn(false);
    navigate('/login');
  };
  const handleLogin = () => {
    setIsLoggedIn(true);
  };

  return (
    <>
      <Header isLoggedIn={isLoggedIn} onLogout={handleLogout} />
      <Routes>
        <Route path='/' element={<Home />} />
        <Route path='/login' element={<Login onLogin={handleLogin} />} />
        <Route path='/register' element={<Register />} />
        <Route path='/add-feedback' element={<Addfeedback />} />
        <Route path='/view-feedback/:id' element={<Viewfeedback />} />
          
      </Routes>

    </>
  )
}

export default App
