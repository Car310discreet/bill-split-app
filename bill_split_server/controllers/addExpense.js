import Group from "../mongoose/groups.js";
import User from "../mongoose/user.js";

const addExpense = async (req,res,next)=>{
    try{
        const user = await User.findById(req.user._id);
        const group = await Group.findOne({
            _id: { $in: user.groups },
            groupName: req.body.groupName,
        });

        if (group) {
            group.expenses.push({ expense: req.body.expense, user: user._id });
            await group.save();
            console.log(group.expenses);
            res.status(200).json({ message: 'Expense added' });
            return next();
        }
        else {
            const err = new Error('Group not found');
            err.status = 404;
            return next(err);
        }
    }
    catch(err){
        console.log((err.message));
        return next(err)
    }
}

export default addExpense;