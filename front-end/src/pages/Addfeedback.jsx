import { Card,  Input, Button, Typography, } from "@material-tailwind/react";
import axios from 'axios';
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

  const Addfeedback = () => {
    const navigate = useNavigate();
    const [error, setError] = useState("");

    const userId = JSON.parse(localStorage.getItem('user')).id;

    const [formData, setFormData] = useState({
        title: '',
        description: '',
        category: ''
    });
    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        try {
            const dataToSend = {
                ...formData,
                user_id: userId
            };
            const response = await axios.post('http://localhost:8000/api/storeFeedback', dataToSend);
            console.log('Feedback stored:', response.data);
            navigate('/');
        } catch (error) {
            console.error('Error storing feedback:', error.response.data);
            setError(error.response.data.error)
        }
    };
    return (
        <div className="mx-auto max-w-screen-2xl flex justify-center mt-12">
            <Card color="transparent" shadow={false}>
                <Typography variant="h4" color="blue-gray">
                    Add Feedback
                </Typography>
                {error && (
  <Typography variant="small" color="red" className="mt-2 text-center">
    {Object.keys(error).map((key) => (
      <div key={key}>{error[key]}</div>
    ))}
  </Typography>
)}
                <form className="mt-8 mb-2 w-80 max-w-screen-lg sm:w-96" onSubmit={handleSubmit}>
                    <div className="mb-1 flex flex-col gap-6">
                        <Typography variant="h6" color="blue-gray" className="-mb-5">
                            Enter Title
                        </Typography>
                        <Input
                            size="lg"
                            placeholder="Enter title"
                            name="title"
                            value={formData.title}
                            onChange={handleChange}
                            className=" !border-t-blue-gray-200 focus:!border-t-gray-900"
                        />
                        <Typography variant="h6" color="blue-gray" className="-mb-5">
                            Enter Description
                        </Typography>
                        <Input
                            size="lg"
                            placeholder="Enter description"
                            name="description"
                            value={formData.description}
                            onChange={handleChange}
                            className=" !border-t-blue-gray-200 focus:!border-t-gray-900"
                        />
                        <Typography variant="h6" color="blue-gray" className="-mb-5">
                            Enter Category
                        </Typography>
                        <Input
                            size="lg"
                            placeholder="Enter category"
                            name="category"
                            value={formData.category}
                            onChange={handleChange}
                            className=" !border-t-blue-gray-200 focus:!border-t-gray-900"
                        />
                    </div>
                    <Button className="mt-6" fullWidth type="submit">
                        Submit
                    </Button>
                </form>
            </Card>
        </div>
    );
  }

  export default Addfeedback;
