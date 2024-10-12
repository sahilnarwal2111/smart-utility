const Client = require('../models/client'); 
const Provider = require("../models/provider");

const crypto = require('crypto');
const nodemailer = require('nodemailer');
const bcrypt = require("bcryptjs");
const dotenv = require("dotenv");
dotenv.config()

//temperory setup nodemailer here only

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

exports.forgetPasswordClient = async (req,res) => {
    try{
        // const transporter = nodemailer.createTransport({
        //     service: 'Gmail',
        //     auth: {
        //         user: process.env.USER_EMAIL,
        //         pass: process.env.EMAIL_PASS,
        //     },
        // });
        const { key , value } = req.body;
        let user = await Client.findOne({[key]:value});
        if(!user){
            return res.status(400).json({error: "User doesn't exist."});
        }

        const resetToken = crypto.randomBytes(32).toString('Hex');

        user.resetToken = resetToken;
        user.resetTokenExpires = Date.now() + 3600000;
        await user.save();

        // put your front-end route here....
        // this api will work for front-end to get to a page where we can put new-password
        const resetUrl = `${process.env.FRONTEND_ROUTE}/reset-password/${user.username}/${resetToken}`;
        
        const mailOptions = {
            from: process.env.EMAIL_USER,
            to: user.email, 
            subject: 'Password Reset Request',
            text: `You requested to reset your password. Click the link below to reset it:\n\n${resetUrl}`,
        };
        res.status(200).json({
            message:"Password Reset successful.",
            token:resetToken
        });
        // transporter.sendMail(mailOptions, (err, info) => {
        //     if (err) {
        //       return res.status(500).json({ message: 'Error sending email', error: err.message });
        //     }
        //     res.status(200).json({ message: 'Password reset email sent successfully'});
        // });
    }
    catch(error){
        res.status(500).json({error:`Internal server error - ${error.message}`})
    }
}

exports.resetPasswordClient = async (req,res) => {
    try{
        const {username , token , newPassword} = req.body;

        const user = await Client.findOne({
            username:username,
            resetToken:token,
            resetTokenExpires: {$gt:Date.now()},
        });

        if(!user){
            return res.status(400).json({error:"Invalid username or reset Token"});
        }

        user.password = await bcrypt.hash(newPassword,10);
        user.resetToken = null;
        user.resetTokenExpires = Date.now();
        user.save();

        res.status(200).json({message:"Password Reset Successfully..."});
    }
    catch(error){
        res.status(500).json({error:`Internal Server Error - ${error.message}`});
    }
}