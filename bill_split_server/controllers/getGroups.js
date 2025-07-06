import User from "../mongoose/user.js";
import Groups from "../mongoose/groups.js";

const getGroups = async (req,res,next)=>{
    try{
        const user = await User.findById(req.user._id);
        const groups = await Groups.find({_id: {$in: user.groups }});
        res.status(200).json(groups);
        return next();
    }
    catch(err){
        console.log(err.message);
        next(err);
    }
}

export default getGroups;