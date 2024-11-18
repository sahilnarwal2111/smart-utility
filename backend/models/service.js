const mongoose = require('mongoose');

// Define the Client schema
const serviceSchema = new mongoose.Schema({
  serviceName: {
    type: String,
    required: true,
    unique: true
  },
  desc: {
    type:String,
  },
  providers: {
    type:Array
  }
});

const Services = mongoose.model('services', serviceSchema);

module.exports = Services;
