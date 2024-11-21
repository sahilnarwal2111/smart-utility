const express = require("express");
const router = express.Router();
const GetController = require("../controllers/GetControllers");

router.post("/get-providers-with-service",GetController.getProvidersWithService);
router.get("/get-all-providers",GetController.getAllProviders);
router.post("/get-bookings-client",GetController.getClientBookings)
router.post("/get-bookings-provider",GetController.getProviderBookings)
router.post("/get-services",GetController.getAllServices)
router.post("/get-client-data",GetController.getClientData)
router.post("/get-provider-data",GetController.getProviderData)
module.exports = router;