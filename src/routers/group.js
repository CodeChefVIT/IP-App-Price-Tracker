const express = require('express')
const Group = require('../models/group')
const User = require('../models/user')
const auth = require('../middleware/auth')
const router = new express.Router()


//create group
router.post('/groups', auth, async (req, res) => {
    const group = new Group({
        ...req.body,
        owner: req.user._id
    })
    try {
        await group.save().then(async(result)=>{
            for(let member in result.members){
                await  User.updateOne(
                    { _id: member.owner },
                    { $push: { joinedgroups: result._id } }
                 )
            }
            res.status(201).send(result)
        }).catch((err)=>{
            res.status(500).send(err)
        })
    } catch (e) {
        res.status(400).send(e)
    }
})


//send all data


// GET /groups?limit=10&skip=20
// GET /groups?sortBy=createdAt:desc
///TODO populate user groups via req.user.groups
// router.get('/groups', auth, async (req, res) => {

//     const sort = {}

//     if (req.query.sortBy) {
//         const parts = req.query.sortBy.split(':')
//         sort[parts[0]] = parts[1] === 'desc' ? -1 : 1
//     }

//     try {
//         await req.user.populate({
//             path: 'groups',
//             options: {
//                 limit: parseInt(req.query.limit),
//                 skip: parseInt(req.query.skip),
//                 sort
//             }
//         }).execPopulate()
//         res.send(req.user.groups)
//     } catch (e) {
//         res.status(500).send()
//     }
// })




//Deletion of a group

router.delete('/group/:id', auth, async (req, res) => {
    try {

        const group = await Group.findById( req.params.id )

        if (!group) {
            res.status(404).send()
        }
        if(group){
            for(member of group.members){
                if(req.user._id == member.owner && member.is_creator){
                    await Group.deleteOne({_id: req.params.id})
                    res.send(group)
                }
            }
        }
        else{
            res.status(401).send("Not a creator")
        }
    } catch (e) {
        res.status(500).send()
    }
})


//Get a group
router.get('/group',auth, async(req,res,next)=>{
    try{
        const group = await Group.findById(req.body.groupId)
        if(group){
            res.status(200).json(group)
        }
        else{
            res.status(404).send('Group not found')
        }
    }
    catch(e){
        return res.status(500).send('Network error/Backend down', e.toString())
    }
})

//Add an expenditure 
router.post('/group/addexpenditure', auth, async(req,res)=>{
    try{
        const group = await Group.findById(req.body.groupId)
        if(group){
            const expenditure = group.expenditure
            expenditure.push(req.body.expenditure)
            for(let member of group.members){
                for(let memberinner of group.expenditure.members){
                    if(member.owner == memberinner.owner){
                        member.amount += memberinner.amount
                    }
                }
            }
            await group.save()
            res.status(200).json(group)
        }
        else{
            res.status(404).send('Group not found')
        }
    }
    catch(e){
        return res.status(500).send('Network error/Backend down', e.toString())
    }
})


//Get user details in a group
router.get('/group/userDetails', auth, async (req,res,next)=>{
    try {
        const group = await Group.findById(req.body.groupId)
        const userFound = await User.findById(req.body._id)
        if(group){
            var user = {}
            var userArr = []

            for(i=0;i<group.expenditure.length;i++){
                for(j=0;j<group.expenditure.members.length;j++){
                    if(group.expenditure[i].members[j].owner == req.body._id){
                        userArr.push(group.expenditure[i].members[j])
                    }
                }
            }
            user.userArr = userArr
            user.name = userFound.name
            return res.status(200).json({
                user: user,
            })
        }
        else{
            return res.status(404).send('Something went wrong')
        }
    } catch (e) {
       return res.status(500).send('Network error/Backend down', e.toString())
    }
})

module.exports = router