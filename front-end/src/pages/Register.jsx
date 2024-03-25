import React, { useEffect, useState } from "react";
import { Card, CardHeader, CardBody, CardFooter, Typography, Input, Checkbox, Button, }
from "@material-tailwind/react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";


const Register = () => {
  const navigate = useNavigate();
  const [error, setError] = useState("");

  const [formData, setFormData] = useState({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
  });

  const handleChange = (e) => {
    setFormData({...formData, [e.target.name]: e.target.value })
  }
  
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:8000/api/register', formData);
      navigate('/login');
    } catch (error) {
      console.error('Error :', error.response.data);
      setError(error.response.data.error);
    }
  }

  return <div>
    <div className="mx-auto max-w-screen-2xl flex justify-center mt-24 mb-5">
    <Card className="w-96">
      <CardHeader variant="gradient" color="gray" className="mb-4 grid h-28 place-items-center" >
        <Typography variant="h3" color="white">
          Register
        </Typography>
      </CardHeader>
      {error && (
              <Typography variant="small" color="red" className="mt-2 text-center">
                {error}
              </Typography>
            )}
      <form onSubmit={handleSubmit}>
      <CardBody className="flex flex-col gap-4">
        <Input label="Name" name="name" value={formData.name} onChange={handleChange} size="lg" />
        <Input label="Email" name="email" value={formData.email} onChange={handleChange} size="lg" />
        <Input label="Password" name="password" type="password" value={formData.password} onChange={handleChange} size="lg" />
        <Input label="Confirm Password" type="password" value={formData.password_confirmation} onChange={handleChange} name="password_confirmation" size="lg" />
        
      </CardBody>

      <CardFooter className="pt-0">
        <Button variant="gradient" type="submit" fullWidth>
          Sign Up
        </Button>
        <Typography variant="small" className="mt-6 flex justify-center">
          Already have an account?
          <Link to={"/login"} variant="small" color="blue-gray" className="ml-1 font-bold" >
            Login
          </Link>
        </Typography>
      </CardFooter>
      </form>

    </Card>
    </div>
  </div>;
};

export default Register;
