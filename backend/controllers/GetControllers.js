const Provider = require("../models/provider");
const Services = require("../models/service");

const dotenv = require("dotenv");
dotenv.config();


exports.getProvidersWithService = async (req,res) => {
    try{
        const {service} = req.body;
        let name = service.toLowerCase().trim()
        console.log(service)
        let data  = await Services.findOne({serviceName:service})
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