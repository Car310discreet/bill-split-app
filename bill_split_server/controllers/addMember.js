import Group from "../mongoose/groups.js";
import User from "../mongoose/user.js";

const addMember = async (req,res,next)=>{
    try{
        const user = await User.findById(req.user._id);
        const member = await User.findOne({name: req.body.memberName});
        const group = await Group.findOne({
            _id: { $in: user.groups },
            groupName: req.body.groupName
          });

        if(group && member){
            if(group.members.includes(member._id)){
                console.log('Member already exists');
                const err = new Error('Member already exists');
                err.status = 400;
                return next(err);
            }

            group.members.push(member._id);
            member.groups.push(group._id);
            await member.save();
            await group.save();
            console.log(group);
            res.status(200).json({message: 'Member added successfully'});
            return next();
        }
        else{
            if(group){
                console.log('User not found');
                const err = new Error('User not found');
                err.status = 404;
                return next(err);
            }
            else if(member){
                console.log('Group not found');
                const err = new Error('Group not found' );
                err.status = 404;
                return next(err);
            }
        }
        
    }
    catch(err){
        console.log(err.message);
        return next(err);
    }
}

export default addMember;