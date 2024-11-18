const Client = require('../models/client'); 
const Provider = require("../models/provider");
const Services = require("../models/service")

const dotenv = require("dotenv");
dotenv.config();

exports.insertSerivce = async (req,res) => {
    try{
        const {service , provider} = req.body;
        let serviceProviders = await Services.findOne({serviceName:service})
        let providersServices = await Provider.findOne({username:provider})
        if(serviceProviders.providers.includes(provider)){
            res.status(400).json({message:"Provider already provides this service"})
            return;
        }
        serviceProviders.providers.push(provider)
        providersServices.services.push(service)
        serviceProviders.save()
        providersServices.save()
        res.status(200).json({message:"Service added successfully"})
    }
    catch(error){
        console.log(error.message)
        res.status(500).json({message:"Invalid Server Error"})
    }
}

exports.addService = async (req,res) => {
    try{
        const {serviceName, desc} = req.body;
        let name = serviceName.toLowerCase().trim()
        
        let service = await Services.findOne({serviceName:name});
        if(service){
            res.status(400).json({message:"Service Already Exist"})
            return;
        }

        let created = await Services.create({
            serviceName:name,
            desc:desc,
            providers:[]
        })
        const response = {
            message:"service added successfully",
            service: created
        }
        res.status(200).json(response)

    }
    catch(error){
        console.log(error.message)
        res.status(500).json({message:"Invalid Server Error"});
    }
}

exports.updateClient = async (req,res) => {
    try
    {
        const {username , key ,value} = req.body;

        let user = await Client.findOne({username:username});

        if(!user){
            res.status(400).json({message: " User not Found"})
            return;
        }
        if(key == "username"){
            return res.status(400).json({message:"username can't be changed"})
        }
        if(key == "password"){
            //hash here not now
            return res.status(400).json({message:"working on change password functionality"})
        }
        else {
            user[key] = value;
        }
        user.save();

        res.status(200).json({
            message:"Data Updated Successfully"
        })
    }
    catch(error)
    {
        res.status(500).json({message:"Internal Server Error",err: error.message});
    }
}

exports.updateProvider = async (req,res) => {
    try
    {
        const {username , key ,value} = req.body;

        let user = await Provider.findOne({username:username});

        if(!user){
            res.status(400).json({message: " User not Found"})
            return;
        }
        if(key == "username"){
            return res.status(400).json({message:"username can't be changed"})
        }
        else if(key == "password"){
            //hash here not now
            return res.status(400).json({message:"working on change password functionality"})
        }
        else {
            user[key] = value;
        }
        user.save();

        res.status(200).json({
            message:"Data Updated Successfully"
        })
    }
    catch(error)
    {
        res.status(500).json({message:"Internal Server Error",err: error.message});
    }
}