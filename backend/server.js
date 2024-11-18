const express = require('express');
const connectDB = require('./config/config');  // Import the database config
const AuthRouter = require('./routes/AuthRoutes');
const ModifyRouter = require('./routes/ModifyRoutes')
const GetRouter = require('./routes/GetRoutes')
const BookingRouter = require('./routes/BookingRoutes')

const cors = require('cors')


const app = express();
app.use(cors());
// Middleware setup
app.use(express.json()); // For parsing JSON requests


// setting API's 
app.use("/api/auth",AuthRouter);
app.use("/api/modify",ModifyRouter)
app.use("/api/get-details",GetRouter)
app.use("/api/book",BookingRouter)
// Function to start the server
const startServer = () => {
  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
};

// Connect to MongoDB and start the server only if the connection is successful
connectDB().then((connected) => {
  if (connected) {  
    startServer();  // Start the server if MongoDB connection is successful
  }
}).catch((err) => {
  console.error("Failed to start the server due to MongoDB connection failure");
});
