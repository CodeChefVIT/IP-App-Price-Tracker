const mongoose = require('mongoose')

const taskSchema = new mongoose.Schema({
    day:{
        type:String,
        required:true
    },
    apparel:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    accessories:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    grocery:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    medical:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    miscellaneous:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    electricity:{
        type:Number,

        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    water:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
   HouseRent:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    furniture:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    totalDaySpent:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User'
    }
}, {
    timestamps: true
})

const Task = mongoose.model('Task', taskSchema)

module.exports = Task



