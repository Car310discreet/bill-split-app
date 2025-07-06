import Group from "../mongoose/groups.js";
import User from "../mongoose/user.js"

const getExpenses = async (req,res,next)=>{
    try{
        console.log('Get Expenses started');
        const user = await User.findById(req.user._id);
        const group = await Group.findOne({
            _id: { $in: user.groups },
            groupName: req.body.groupName,
        }).populate('expenses.user');

        if(group){
            res.status(200).json(group.expenses);
            return next();
        }
        else{
            const err = new Error('Group not found');
            err.status = 404;
            return next(err);
        }
    }
    catch(err){
        console.log(err.message);
        return next(err);
    }
}

export default getExpenses;