import React, { useEffect, useState } from "react";
import {
  Navbar,
  Collapse,
  Typography,
  IconButton,
} from "@material-tailwind/react";
import { IoClose } from "react-icons/io5";
import { FaBars } from "react-icons/fa6";
import { Link, useNavigate } from "react-router-dom";



const Header = ({ isLoggedIn, onLogout }) => {

  const [openNav, setOpenNav] = React.useState(false);
  
  const handleWindowResize = () =>
    window.innerWidth >= 960 && setOpenNav(false);

  React.useEffect(() => {
    window.addEventListener("resize", handleWindowResize);

    return () => {
      window.removeEventListener("resize", handleWindowResize);
    };
  }, []);

  return <div>
    <Navbar className="mx-auto mt-4 mb-8 shadow-md">
      <div className="flex items-center justify-between text-blue-gray-900">
        <Link
          to={"/"}
          variant="h6"
          className="mr-4 cursor-pointer py-1.5"
        >
          Feedback Test
        </Link>
        <div className="hidden lg:block">
        <ul className="my-2 flex flex-col gap-2 lg:mb-0 lg:mt-0 lg:flex-row lg:items-center lg:gap-6">
        {!isLoggedIn ? (
                <>
                  <Typography as="li" variant="small" color="blue-gray" className="p-1 font-medium" >
                    <Link to={'login'} className="flex items-center hover:text-blue-500 transition-colors">
                      Login
                    </Link>
                  </Typography>
                  <Typography as="li" variant="small" color="blue-gray" className="p-1 font-medium" >
                    <Link to={'register'} className="flex items-center hover:text-blue-500 transition-colors">
                      Register
                    </Link>
                  </Typography>
                </>
              ) : (
                <Typography as="li" variant="small" color="blue-gray" className="p-1 font-medium" >
                  <button onClick={onLogout} className="flex items-center hover:text-blue-500 transition-colors">
                    Logout
                  </button>
                </Typography>
              )}

      </ul>
        </div>
        <IconButton
          variant="text"
          className="ml-auto h-6 w-6 text-inherit hover:bg-transparent focus:bg-transparent active:bg-transparent lg:hidden"
          ripple={false}
          onClick={() => setOpenNav(!openNav)}
        >
          {openNav ? (
            <IoClose className="h-6 w-6" strokeWidth={2} />
          ) : (
            <FaBars className="h-6 w-6" strokeWidth={2} />
          )}
        </IconButton>
      </div>
      <Collapse open={openNav}>
      {!isLoggedIn ? (
                <>
                  <Typography as="li" variant="small" color="blue-gray" className="p-1 font-medium" >
                    <Link to={'login'} className="flex items-center hover:text-blue-500 transition-colors">
                      Login
                    </Link>
                  </Typography>
                  <Typography as="li" variant="small" color="blue-gray" className="p-1 font-medium" >
                    <Link to={'register'} className="flex items-center hover:text-blue-500 transition-colors">
                      Register
                    </Link>
                  </Typography>
                </>
              ) : (
                <Typography as="li" variant="small" color="blue-gray" className="p-1 font-medium" >
                  <button onClick={onLogout} className="flex items-center hover:text-blue-500 transition-colors">
                    Logout
                  </button>
                </Typography>
              )}
      </Collapse>
    </Navbar>

  </div>;
};

export default Header;
