const express = require("express");
const router = express.Router();
const GetController = require("../controllers/GetControllers");

router.post("/get-providers-with-service",GetController.getProvidersWithService);
router.get("/get-all-providers",GetController.getAllProviders);
router.post("/get-bookings-client",GetController.getClientBookings)
router.post("/get-bookings-provider",GetController.getProviderBookings)
module.exports = router;