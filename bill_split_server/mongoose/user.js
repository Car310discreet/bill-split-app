import mongoose from 'mongoose';
import bcrypt from 'bcrypt';

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        trim: true,
        required: true,
    },
    email: {
        type: String,
        lowercase: true,
        trim: true,
        unique: true,
        required: true,
    },
    password: {
        type: String,
        trim: true,
        required: true,
    },
    friends: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
        }
    ],
    groups: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Group',
        }
    ]
});

userSchema.pre(
    'save',
    async function (next) {
        const user = this;
        if (!this.isModified('password')) return next();
        
        const hash = await bcrypt.hash(this.password, 10);

        this.password = hash;
        console.log('Password hashed');
        next();
    }
);

userSchema.methods.isValidPassword = async function(password){
    const user = this;
    const compare = await bcrypt.compare(password,user.password);

    return compare;
}

const User = mongoose.model('User', userSchema);

export default User;