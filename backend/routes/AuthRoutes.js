const express = require("express");
const router = express.Router();
const authController = require("../controllers/AuthController");

router.post("/signup/client",authController.signupClient);
router.post("/signup/provider",authController.signupProvider);
router.post("/login/client",authController.loginClient);
router.post("/login/provider",authController.loginProvider);
router.post("/forget-password/client",authController.forgetPasswordClient);
router.post("/reset-password/client",authController.resetPasswordClient);
module.exports = router;