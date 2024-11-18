const express = require("express");
const router = express.Router();
const BookingController = require("../controllers/BookingController");

router.post("/book-provider",BookingController.bookProvider)

module.exports = router;