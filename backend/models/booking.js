const mongoose = require('mongoose');

// Define the Client schema
const bookingSchema = new mongoose.Schema({
  client: {
    type:String,
    required:true
  },
  provider: {
    type:String,
    required:true
  },
  price: {
    type: String
  },
});

const Booking = mongoose.model('booking', bookingSchema);

module.exports = Booking;
