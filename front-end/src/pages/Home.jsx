import React from "react";
import { Table } from "../components/Table";
import { Button } from "@material-tailwind/react";
import { Link } from "react-router-dom";

const Home = () => {
  return <div>
    <div className="mx-auto max-w-screen-2xl flex justify-center mt-20">
        <div className="lg:w-2/3 w-full lg:p-0 p-4">
            <div className="flex justify-end">
            <Link to={'add-feedback'} className="mb-4"><Button color="green">Add Feedback</Button></Link>
        </div>
        <Table />

        </div>
    </div>
  </div>;
};

export default Home;
