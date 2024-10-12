// models/client.js

const mongoose = require('mongoose');

// Define the Client schema
const clientSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,  // Ensures that email is unique
  },
  password: {
    type: String,
    required: true,
  },
  phone: {
    type: String,
    required: true,
  },
  address: {
    type: String,
  },
  dateCreated: {
    type: Date,
    default: Date.now,  // Auto-assigns current date and time
  },
  resetToken: {
    type:String,
    default: null,
  },
  resetTokenExpires: {
    type: Date,
    default: Date.now,
  }
});

// Create the Client model based on the schema
const Client = mongoose.model('Client', clientSchema);

module.exports = Client;
