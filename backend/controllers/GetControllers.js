const Client = require("../models/client")
const Provider = require("../models/provider");
const Services = require("../models/service");
const Booking = require("../models/booking")

const dotenv = require("dotenv");
dotenv.config();


exports.getProvidersWithService = async (req,res) => {
    try{
        const {service} = req.body;
        let name = service.toLowerCase().trim()
        console.log(service)
        let data  = await Services.findOne({serviceName:name})
        console.log(data)
        
        let providerData = await Provider.find({username: { $in: data.providers}}).select('-password')
        
        console.log(providerData)
        
        const response = {
            message: "All providers with given services are here...",
            providers : providerData
        }

        res.status(200).json(response)
    }
    catch(error){
        console.log(error.message)
        res.status(500).json({error:"Internal Server Error"});
    }
}


exports.getAllProviders = async (req,res) => {
    try{
        let providers = await Provider.find();
        const response = {
            message:"Details of all providers",
            data: providers
        }
        res.status(200).json(response)
    }
    catch(error){
        res.status(500).json({error:"Internal Server Error"});
    }
}

exports.getClientBookings = async (req,res) => {
    try {
        const {username} = req.body;

        let bookings = await Booking.find({client:username})

        const response = {
            message : "all booking by client",
            bookings : bookings
        }

        res.status(200).json(response)
    }
    catch(error){
        res.status(500).json({message:"Internal Server Error"})
    }
}

exports.getProviderBookings = async (req,res) => {
    try {
        const {username} = req.body;

        let bookings = await Booking.find({provider:username})

        const response = {
            message : "all booking by client",
            bookings : bookings
        }

        res.status(200).json(response)
    }
    catch(error){
        res.status(500).json({message:"Internal Server Error"})
    }
}

exports.getAllServices = async (req,res) => {
    try{
        let services = await Services.find();

        const response = {
            message : "all available services",
            services : services
        }
        
        res.status(200).json(response)
    }
    catch(error){
        res.status(500).json({message:"Internal Server Error"})
    }
}

exports.getClientData = async (req,res) => {
    try{
        const {username} = req.body;
        let user = await Client.findOne({username:username}).select('-password').select('-resetToken');
        if(!user){
            return res.status(400).json({message:"User Not Found"})
        }

        const response = {
            message: " Data Fetched Successfully",
            data : user
        }

        res.status(200).json(response);
    }
    catch(err){
        console.log(err.message)
        res.status(500).json({message:"Internal Server Error."});
    }
}

exports.getProviderData = async (req,res) => {
    try{
        const {username} = req.body;
        let user = await Provider.findOne({username:username}).select('-password').select('-resetToken')
        if(!user){
            return res.status(400).json({message:"User Not Found"})
        }

        const response = {
            message: " Data Fetched Successfully",
            data : user
        }

        res.status(200).json(response);
    }
    catch(err){
        res.status(500).json({message:"Internal Server Error."});
    }
}