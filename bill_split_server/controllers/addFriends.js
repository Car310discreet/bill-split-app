import User from "../mongoose/user.js"

const addFriends = async (req,res,next)=>{
    try{
        const user = await User.findById(req.user._id);
        const friend = await User.findOne({name: req.body.name});
        console.log(user);

        if(!friend){
            console.log('User not found');
            const err = new Error('User not found');
            err.status = 404;
            return next(err);
        }

        if(friend._id === user._id){
            console.log('Cant add yourself as a friend');
            const err = new Error('Cant add yourself as a friend');
            err.status = 400;
            return next(err);
        }

        if(user.friends.includes(friend._id)){
            console.log('User is already your friend');
            const err = new Error('User is already your friend');
            err.status = 400;
            return next(err);
        }

        if(!user.friends){
            user.friends=[];
        }
        user.friends.push(friend._id);
        await user.save();
        console.log(user);
        res.status(200).json('Friend added successfully')
        return next();
    }
    catch(err){
        console.log(err.message);
        return next(err);
    }
}

export default addFriends;