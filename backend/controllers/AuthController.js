const Client = require('../models/client'); 
const bcrypt = require("bcryptjs");
const dotenv = require("dotenv");
dotenv.config()


exports.signupClient = async (req,res) =>{
    try{
        const { username, password } = req.body;
        
        //apply checks here.
        if(!username || !password){
            return res.status(400).json({error:"username and password are required"});
        }

        // get user 
        let user = await Client.findOne({userId:username});
        if(user){
            res.send(400).json({error:"User already exists"});
        }

        user = await Client.create({
            ...req.body,
            password: await bcrypt.hash(password,10)
        });

        const response = {
            message: "Admin user created successfully",
            user: {
              id: user.id,
              username: user.username,
            }
        };
        console.log("user sign up successful");
        res.status(200).json(response);
    }
    catch(error){
        console.log(`Error occured : ${error.message}`);
        return res.status(500).json({error:"Internal Server Error"});
    }
}