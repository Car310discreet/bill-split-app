import Group from "../mongoose/groups.js";
import User from "../mongoose/user.js";

const addGroup = async (req,res,next)=>{
    try{
        const user = await User.findById(req.user._id);
        const group = await Group.create({groupName: req.body.groupName, members: [user._id]});
        user.groups.push(group._id);
        await user.save();
        console.log('Group added: ', group);
        res.status(201).json({message: 'Group addded successfully'});
    }
    catch(err){
        console.log(err.message);
        return next(err);
    }
}

export default addGroup;