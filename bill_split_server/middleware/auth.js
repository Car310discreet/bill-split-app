import passport from "passport";
import {Strategy as LocalStrategy} from 'passport-local';
import { Strategy as JWTStrategy } from "passport-jwt";
import { ExtractJwt} from "passport-jwt";
import User from "../mongoose/user.js";
import bcrypt from 'bcrypt';

passport.use(
    'signup',
    new LocalStrategy(
        {
            usernameField: 'email',
            passwordField: 'password',
            passReqToCallback: true
        },
        async (req,email,password,done) => {
            try{
                console.log('Signup request received');
                const foundUser = await User.findOne({email: email});
                if (foundUser){
                    console.log('Email already in use');
                    return done(null,false, {message: 'Email ID has already been used'});
                }
                else{
                    const user = await User.create({name: req.body.name,email: email,password: password });
                    console.log('User created');
                    return done(null, user);
                }
            }
            catch(error){
                console.log('Error occurred')
                return done(error);
            }
        }
    )
);

passport.use(
    'login',
    new LocalStrategy(
        {
            usernameField: 'email',
            passwordField: 'password'
        },
        async (email,password,done) =>{
            try{
                const user =await User.findOne({email: email});

                if(!user){
                    const err = new Error('User not found');
                    err.status = 404;
                    return done(err);
                }

                const validate = await user.isValidPassword(password);
                console.log("Input password:", password);
                console.log("Stored hash:", user.password);
                console.log("Match result:", await bcrypt.compare(password, user.password));
                if(!validate){
                    const err = new Error('Invalid password')
                    err.status = 400;
                    return done(err);
                }

                return done(null,user,{message: 'Logged in successfully'});
            }
            catch(error){
                done(error);
            }
        }
    )
);

passport.use(
    new JWTStrategy(
        {
            secretOrKey: process.env.JWT_KEY,
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
        },
        async (token,done)=>{
            try{
                return done(null,token.user);
            }
            catch(error){
                done(error);
            }
        }
    )
)
