import passport from "passport";
import jwt from 'jsonwebtoken';


const signUp = async (req,res)=>{
    res.status(201).json({
        message: 'Signup successful',
        user: req.user
    });
}

const login = async (req, res, next) => {
    passport.authenticate(
        'login',
        async (err,user,info)=>{
            try{
                if(err || !user){
                    return next(err);
                }

                req.login(
                    user,
                    {session: false},
                    async (error)=>{
                        if(error) return next(error);

                        const body = {_id: user._id, email: user.email};
                        const token = jwt.sign({user: body}, process.env.JWT_KEY);

                        return res.status(200).json({token});
                    }
                );
            }
            catch(error){
                return next(error);
            }
        }
    )(req,res,next);
}

export {signUp,login};