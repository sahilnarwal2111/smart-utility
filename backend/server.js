const express = require("express");
require("dotenv").config();

const app= express();

const PORT = process.env.PORT || 3000;
app.get("/",(req,res)=>{
    res.send("This is API");
})
app.listen(PORT , () => {
    console.log(`server running on PORT ${PORT} `);
})