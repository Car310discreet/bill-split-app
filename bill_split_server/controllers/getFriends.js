import User from "../mongoose/user.js";

const getFriends = async (req,res,next)=>{
    try{
        const user = await User.findById(req.user._id);
        const friends = await User.find({_id: {$in: user.friends}});
        res.status(200).json(friends);
        return next();
    }
    catch(err){
        console.log(err.message);
        next(err);
    }
}

export default getFriends;