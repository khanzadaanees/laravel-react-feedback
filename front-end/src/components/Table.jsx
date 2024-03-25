import { Card, Typography, Button  } from "@material-tailwind/react";
import axios from 'axios';
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const TABLE_HEAD = ["Name", "Job", "Employed", ""];
 
export function Table() {
  const [feedbackList, setFeedbackList] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  useEffect(() => {
    fetchFeedback();
  }, [currentPage]);

  const fetchFeedback = async () => {
    try {
      const response = await axios.get(`http://localhost:8000/api/allFeedback?page=${currentPage}`);
      // console.log('API Response:', response.data);
      setFeedbackList(response.data.data);
      setTotalPages(response.data.last_page);

    } catch (error) {
      console.error('Error fetching feedback:', error.response.data);
    }
  };
  const handlePrevPage = () => {
    setCurrentPage(currentPage - 1);
  };
  
  const handleNextPage = () => {
    setCurrentPage(currentPage + 1);
  };
  
  return (
    <div>
    <Card className="h-full w-full">
        
      <table className="w-full min-w-max table-auto text-left">
        <thead>
          <tr>
          <th className="border-b border-blue-gray-100 bg-blue-gray-50 p-4">
              <Typography variant="small" color="blue-gray" className="font-bold leading-none opacity-70">
                Title
              </Typography>
            </th>            
            <th className="border-b border-blue-gray-100 bg-blue-gray-50 p-4">
              <Typography variant="small" color="blue-gray" className="font-bold leading-none opacity-70">
                Category
              </Typography>
            </th>
            <th className="border-b border-blue-gray-100 bg-blue-gray-50 p-4">
              <Typography variant="small" color="blue-gray" className="font-bold leading-none opacity-70">
                Author
              </Typography>
            </th>
            <th className="border-b border-blue-gray-100 bg-blue-gray-50 p-4">
              <Typography variant="small" color="blue-gray" className="font-bold leading-none opacity-70">
                Action
              </Typography>
            </th>
          </tr>
        </thead>
        <tbody>
        {feedbackList.map(({ id, title, user, category }) => (
            <tr key={id} className="even:bg-blue-gray-50/50">
              <td className="p-4">
                <Typography variant="small" color="blue-gray" className="font-normal">
                  {title}
                </Typography>
              </td>
              <td className="p-4">
                <Typography variant="small" color="blue-gray" className="font-normal">
                  {category}
                </Typography>
              </td>
              <td className="p-4">
                <Typography variant="small" color="blue-gray" className="font-normal">
                  {user.name}
                </Typography>
              </td>
              <td className="p-4">
              <Link to={"/view-feedback/" + id}>
                <Button color="blue">
                  View
                </Button>
              </Link>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </Card>
    <div className="mt-4 flex justify-center gap-3">
    <Button variant="outlined" disabled={currentPage === 1} onClick={handlePrevPage}>
      Previous
    </Button>
    <Button variant="outlined" disabled={currentPage === totalPages} onClick={handleNextPage}>
      Next
    </Button>
  </div>
    </div>
  );
}