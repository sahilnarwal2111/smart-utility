const Client = require('../models/client'); 
const Provider = require("../models/provider");
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
        let user = await Client.findOne({username:username});
        console.log("try ");
        console.log(user);
        if(user){
            return res.status(400).json({error:"User already exists"});
        }

        user = await Client.create({
            ...req.body,
            password: await bcrypt.hash(password,10)
        });

        const response = {
            message: "Client created successfully",
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

exports.signupProvider = async (req,res) => {
    try{
        const { username, password } = req.body;
        
        //apply checks here.
        if(!username || !password){
            return res.status(400).json({error:"username and password are required"});
        }

        // get user 
        let user = await Provider.findOne({username:username});
        console.log("try ");
        console.log(user);
        if(user){
            return res.status(400).json({error:"User already exists"});
        }

        user = await Provider.create({
            ...req.body,
            password: await bcrypt.hash(password,10)
        });

        const response = {
            message: "Provider created successfully",
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

exports.loginClient = async (req,res) => {
    try{
        const {username,password} = req.body;

        let user = await Client.findOne({username:username});
        if(!user){
            return res.status(400).json({error:"User Not Found"});
        }

        const validPass = await bcrypt.compare(password,user.password);
        if(!validPass){
            return res.status(400).json({error:"Invalid Password"});
        }

        let client = user.toObject();
        delete client["password"];

        //tokenize here.
        console.log(client);
        res.status(200).json({
            user:{
                ...client
            }
        })
    }
    catch(error){
        console.log("error :"+error.message);
        res.status(500).json({error:"Internal Server Error"});
    }
}

exports.loginProvider = async (req,res) => {
    try{
        const {username,password} = req.body;

        let user = await Provider.findOne({username:username});
        if(!user){
            return res.status(400).json({error:"User Not Found"});
        }

        const validPass = await bcrypt.compare(password,user.password);
        if(!validPass){
            return res.status(400).json({error:"Invalid Password"});
        }

        let provider = user.toObject();
        delete provider["password"];

        //tokenize here.
        res.status(200).json({
            user:{
                ...provider
            }
        })
    }
    catch(error){
        console.log("error :"+error.message);
        res.status(500).json({error:"Internal Server Error"});
    }
}