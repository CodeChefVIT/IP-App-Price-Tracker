const mongoose = require('mongoose')

const budgetSchema = new mongoose.Schema({
    
    Maxapparel:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
   
    Maxaccessories:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
   
    Maxgrocery:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
  
    Maxmedical:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
  
    Maxmiscellaneous:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
   
    Maxelectricity:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
  
    Maxwater:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
  
    MaxHouseRent:{
        type:Number,
        default:0,
        validate(value){
           if(value<0){
               throw new Error('Must be postive')
           }
      }
    },
   
    Maxfurniture:{
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

const Budget = mongoose.model('Budget', budgetSchema)

module.exports = Budget