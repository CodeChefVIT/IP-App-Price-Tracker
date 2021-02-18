const mongoose = require('mongoose')

const groupSchema = new mongoose.Schema({
    
    groupName: {
        type: String,
        trim: true
    },
    expenditure: [{
        //////FOR INDIVIDUAL SPENDINGS
        amount: Number,
        categories: [{
            type: String
        }],
        title: String,
        date: Date,
        place: String,
        members: [{
            owner: {
                type: mongoose.Schema.Types.ObjectId,
                ref: 'User'
            },
            owner_name: String,
            amount:{
                type:Number,
                default:0,
                validate(value){
                   if(value<0){
                       throw new Error('Must be postive')
                   }
              }
            },
            amount_given: [{
                //To Member
                owner:{
                    type: mongoose.Schema.Types.ObjectId,
                    ref: 'User'
                },
                owner_name: String,
                amount: Number,
                date: Date,
                comments: String,
                is_completed: {type: Boolean, default: false},
            }],
            amount_collected: [{
                //from Member
                owner:{
                    type: mongoose.Schema.Types.ObjectId,
                    ref: 'User'
                },
                owner_name: String,
                amount: Number,
                date: Date,
                comments: String,
                is_completed: {type: Boolean, default: false},
            }],
        }],
    }],
    ///FOR DASHBOARD
    members: [{

        owner: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        },
        owner_name: String,
        amount: { type: Number, default: 0 },
        is_creator: { type: Boolean, default: false }
    }],
   
    
}, {
    timestamps: true
})

const Group = mongoose.model('Group', groupSchema)


module.exports = Group
        // contribution:{
        //     type:Number,
        //     default:0,
        //     validate(value){
        //        if(value<0){
        //            throw new Error('Must be postive')
        //        }
        //   }
        // },
        // total_amount_given: [{
        //     //to Member
        //     owner:{
        //         type: mongoose.Schema.Types.ObjectId,
        //         required: true,
        //         ref: 'User'
        //     },
        //     amount: Number,
        //     date: Date,
        //     comments: String,
        //     is_completed: {type: Boolean, default: false},
        // }],
        // total_amount_collected: [{
        //     //from Member
        //     owner:{
        //         type: mongoose.Schema.Types.ObjectId,
        //         required: true,
        //         ref: 'User'
        //     },
        //     amount: Number,
        //     date: Date,
        //     comments: String,
        //     is_completed: {type: Boolean, default: false},
        // }],