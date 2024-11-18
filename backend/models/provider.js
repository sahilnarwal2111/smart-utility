// models/client.js

const mongoose = require('mongoose');

// Define the Client schema
const providerSchema = new mongoose.Schema({
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
  services:{
    type:Array,
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
});

// Create the Client model based on the schema
const Provider = mongoose.model('Provider', providerSchema);

module.exports = Provider;
