import mongoose from 'mongoose';

const groupSchema = new mongoose.Schema({
    groupName: {
        type: String,
        trim: true,
        required: true
    },
    members: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
        }
    ],
    expenses: [
        {
            expense: {
                type: Number,
                required: true,
            },
            user: {
                type: mongoose.Schema.Types.ObjectId,
                ref: 'User',
                required: true,
            }
        }
    ],
});

groupSchema.methods.splitExpense = function() {
    
    if(this.members.length>0){
        let totalExpenses = 0;
        for (const expenseObj of this.expenses) {
            totalExpenses += expenseObj.expense;
        }

        const splittedExpense = totalExpenses/this.members.length;
        return splittedExpense;
    }
    
    return 0;
}

const Group = mongoose.model('Groups', groupSchema);

export default Group;