const express = require("express");
const router = express.Router();
const authController = require("../controllers/AuthController");

router.post("/signup/client",authController.signupClient);

module.exports = router;