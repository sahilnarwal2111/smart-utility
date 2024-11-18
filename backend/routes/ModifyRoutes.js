const express = require("express");
const router = express.Router();
const ModifyController = require("../controllers/ModifyController");

router.post("/add-service",ModifyController.addService);
router.post("/insert-service",ModifyController.insertSerivce)
router.post("/update-client",ModifyController.updateClient)
module.exports = router;