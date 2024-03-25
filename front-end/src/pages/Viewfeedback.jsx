import React, { useEffect, useState } from "react";
import { Card, CardBody, CardHeader, Input, Typography, Button, Avatar } from "@material-tailwind/react";
import { useParams } from "react-router-dom";
import axios from "axios";

const Viewfeedback = () => {
    const [feedback, setFeedback] = useState();
    const { id } = useParams();

    const userId = JSON.parse(localStorage.getItem('user')).id;

    const [formData, setFormData] = useState({
        message: '',
    });

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    useEffect(() => {
        fetchFeedback();
    }, [id]);


    const fetchFeedback = async () => {
        try {
            const response = await axios.get(`http://localhost:8000/api/viewFeedback/${id}`);
            setFeedback(response.data);
            // console.log(response.data)
        } catch (error) {
            console.error('Error fetching feedback:', error);
        }
    };

    const handleCommentSubmit = async () => {
        try {
            const dataToSend = {
                ...formData,
                user_id: userId
            };
            const response = await axios.post(`http://localhost:8000/api/feedbackComment/${id}`, dataToSend);
            if (response.status === 201) {
                console.log('Comment stored successfully');
                fetchFeedback();
                setFormData({ message: '' });
            }
        } catch (error) {
            console.error('Error submitting comment:', error);
        }
    };
    return <div>
        <div className="mx-auto max-w-screen-2xl flex justify-center mt-12">
            <Card className="max-w-[44rem] lg:w-2/3 overflow-hidden">
                <CardBody>
                    {feedback ? (
                        <>
                            <Typography variant="h4" color="blue-gray">
                                {feedback.title}
                            </Typography>
                            <Typography variant="h6" className="font-normal mt-1" color="blue-gray">
                                {feedback.category}
                            </Typography>
                            <Typography variant="paragraph" color="gray" className="mt-1 font-normal">
                                {feedback.description}
                            </Typography>
                        </>
                    ) : (
                        <Typography variant="lead" color="blue-gray">Loading...</Typography>
                    )}
                </CardBody>

                {feedback && feedback.comment && feedback.comment.length > 0 ? (
                    feedback.comment.map((comment) => (
                        <CardHeader
                            key={comment.id}
                            color="transparent"
                            floated={false}
                            shadow={false}
                            className="mx-0 flex items-center gap-4 px-7"
                        >
                            <Avatar
                                size="lg"
                                variant="circular"
                                src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?w=770&t=st=1711329828~exp=1711330428~hmac=9de8b397093a363cc28c5a58ddcb4e0163bad3c941fc9d1da49d17a228a706c3"
                                alt="User Avatar"
                            />

                            <div className="flex w-full flex-col gap-0.5">
                                <div className="flex items-center justify-between">
                                    <Typography variant="h6" color="blue-gray">
                                        {comment.user.name}
                                    </Typography>
                                    <Typography color="gray">{new Date(comment.created_at).toLocaleDateString()}</Typography>
                                </div>
                                <Typography color="blue-gray">{comment.content}</Typography>
                            </div>
                        </CardHeader>
                    ))
                ) : (
                    <Typography variant="paragraph" color="gray" className="mt-1 font-normal px-5">
                        No comments yet.
                    </Typography>
                )}
                <div className="px-7 py-3 mt-8">
                    <Typography variant="h6" color="gray">
                        Add Comment
                    </Typography>
                    <div className="w-full mt-3">
                        <Input
                            size="lg"
                            placeholder="Enter title"
                            name="message"
                            value={formData.message}
                            onChange={handleChange}
                            className=" !border-t-blue-gray-200 focus:!border-t-gray-900"
                        />
                    </div>
                    <Button color="blue" className="float-end mt-3" onClick={handleCommentSubmit}>
                        Submit
                    </Button>

                </div>
            </Card>
        </div>
    </div>;
};

export default Viewfeedback;
