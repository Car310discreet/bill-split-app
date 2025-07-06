import express from 'express';
import mongoose from 'mongoose';
import passport from 'passport';
import path, { dirname } from 'path';
import { fileURLToPath } from 'url';
import errorHandler from './middleware/errorHandler.js';
const port = process.env.PORT;
const host = process.env.HOST;

async function connectMongoose() {
    try{
        mongoose.connect('mongodb://127.0.0.1:27017/passport-jwt');
        mongoose.connection.on('error', error => console.log(error));
        mongoose.Promise = global.Promise;
        console.log('mongoose connected');
    }
    catch(err){
        console.log(err.message);
    }
}

connectMongoose();

import routes from './routes/routes.js';
import secureRoutes from './routes/secure_routes.js'
import logger from './middleware/logger.js';

//directory name
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

//body parser
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(logger);

app.use('/',routes);
app.use('/user', passport.authenticate('jwt',{session: false}), secureRoutes);

app.use(errorHandler);

app.listen(port,host,()=>{
    console.log(`Server running on port ${port}`);
});