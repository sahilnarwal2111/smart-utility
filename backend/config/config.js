const mongoose = require('mongoose');
const dotenv = require('dotenv');

// Load .env file
dotenv.config();

const connectDB = async () => {
  try {
    // Attempt to connect to MongoDB
    await mongoose.connect(process.env.MONGO_URI, {
      useNewUrlParser: true,        // These options help avoid deprecation warnings
      useUnifiedTopology: true      // Ensures proper connection management
    });

    console.log('MongoDB connected successfully');
    return true; // Return true to signal successful connection

  } catch (error) {
    console.error('Error connecting to MongoDB:', error.message);
    process.exit(1); // Exit process with failure if connection fails
  }
};

module.exports = connectDB;
