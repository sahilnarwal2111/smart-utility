const Provider = require("../models/provider");
const Services = require("../models/service");
const Booking = require("../models/booking")

const dotenv = require("dotenv");
dotenv.config();

exports.bookProvider = async (req,res) => {
    try{
        const {clientUsername,providerUsername,service,date,time} = req.body;

        let provider = await Provider.findOne({username:providerUsername}); 
            
        if( !(date in provider.booking)){
            provider.booking[date] = new Array(24).fill("")
        }
        if(provider.booking[date][time] !== ""){
                console.log("here2")
                return res.status(400).json({message:"Already Booked",added:false})
        }
        
        let booking = await Booking.create({
            client: clientUsername,
            provider: providerUsername,
            service:service,
            price:"999",
            date:date,
            time:time
        })

        provider.booking[date][time] = booking._id

        provider.markModified('booking');
        await provider.save()

        res.status(200).json({
            message:" Booked Successfully",
            bookingId:booking._id,
            booked:true
        })
    }
    catch(error){
        console.log(error.message)
        res.status(500).json({message:"Internal Server Error"})
    }
} 