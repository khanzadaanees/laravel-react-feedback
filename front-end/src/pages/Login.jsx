import React, { useState } from "react";
import { Card, CardHeader, CardBody, CardFooter, Typography, Input, Checkbox, Button, } from "@material-tailwind/react";
import { Link, useNavigate,  } from "react-router-dom";

const Login = ({onLogin}) => {
  const navigate = useNavigate();
  // const [isLoggedIn, setIsLoggedIn] = useState(false);

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(null);


  // Handle form submission
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost:8000/api/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });
      if (response.ok) {
        const  data = await response.json()
        localStorage.setItem("user", JSON.stringify(data.user));
        localStorage.setItem("token", data.token);
        // console.log(data)
        // setIsLoggedIn(true);
        onLogin();
        navigate('/');
      } else {
        const errorData = await response.json();
        setError(errorData.error);
        // console.log(errorData.error)
      }
    } catch (error) {
      console.error("Error occurred:", error);
    }
  };

  return (
    <div>
      <div className="mx-auto max-w-screen-2xl flex justify-center mt-24">
        <Card className="w-96">
          <CardHeader
            variant="gradient"
            color="gray"
            className="mb-4 grid h-28 place-items-center"
          >
            <Typography variant="h3" color="white">
              Login
            </Typography>
          </CardHeader>
          {error && (
              <Typography variant="small" color="red" className="mt-2 text-center">
                {error}
              </Typography>
            )}
          <form onSubmit={handleSubmit}>
            <CardBody className="flex flex-col gap-4">
              <Input
                label="Email"
                size="lg"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
              <Input
                label="Password"
                size="lg"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
              <div className="-ml-2.5">
                <Checkbox label="Remember Me" />
              </div>
            </CardBody>
            
            <CardFooter className="pt-0">
              <Button type="submit" variant="gradient" fullWidth>
                Sign In
              </Button>
              <Typography
                variant="small"
                className="mt-6 flex justify-center"
              >
                Don&apos;t have an account?
                <Link
                  to={"/register"}
                  variant="small"
                  color="blue-gray"
                  className="ml-1 font-bold"
                >
                  Register
                </Link>
              </Typography>
            </CardFooter>
          </form>
        </Card>
      </div>
    </div>
  );
};

export default Login;
