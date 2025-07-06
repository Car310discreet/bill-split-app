import express from 'express';
import passport from 'passport';
import { signUp, login } from '../controllers/loginAndSignUp.js';
import '../middleware/auth.js';

const router = express.Router();

router.post(
    '/signup',
    (req,res,next)=>{
        passport.authenticate('signup', { session: false }, (err,user,info)=>{
            if(err){
                console.log(err.message);
                return next(err);
            }
            if(!user){
                const err =new Error('Signup failed');
                err.status = 400;
                return next(err);
            }

            req.user = user;
            console.log(req.user);
            return next();
        })(req,res,next);
    },
    signUp
);

router.post(
    '/login',
    login
);


export default router;