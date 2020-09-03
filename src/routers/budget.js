const express = require('express')
const Budget = require('../models/budget')
const auth = require('../middleware/auth')
const router = new express.Router()


//create budget
router.post('/budgets', auth, async (req, res) => {
    const budget = new Budget({
        ...req.body,
        owner: req.user._id
    })
    
    try {
        await budget.save()
        res.status(201).send(budget)
    } catch (e) {
        res.status(400).send(e)
    }
})


//send all data


// GET /budgets?limit=10&skip=20
// GET /budgets?sortBy=createdAt:desc
router.get('/budgets', auth, async (req, res) => {

    const sort = {}

    if (req.query.sortBy) {
        const parts = req.query.sortBy.split(':')
        sort[parts[0]] = parts[1] === 'desc' ? -1 : 1
    }

    try {
        await req.user.populate({
            path: 'budgets',
            options: {
                limit: parseInt(req.query.limit),
                skip: parseInt(req.query.skip),
                sort
            }
        }).execPopulate()
        res.send(req.user.budgets)
    } catch (e) {
        res.status(500).send()
    }
})



//update
router.patch('/budgets/:id', auth, async (req, res) => {
    const updates = Object.keys(req.body)
    const allowedUpdates = ['Maxmedical',' Maxmiscellaneous','Maxwater','MaxHouseRent','Maxapparel','Maxgrocery','Maxaccessories','Maxelectricity','Maxfurniture']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

    if (!isValidOperation) {
        return res.status(400).send({ error: 'Invalid updates!' })
    }

    try {
        const budget = await Budget.findOne({ _id: req.params.id, owner: req.user._id})

        if (!budget) {
            return res.status(404).send()
        }

        updates.forEach((update) => task[update] = req.body[update])
        await budget.save()
        res.send(budget)
    } catch (e) {
        res.status(400).send(e)
    }
})


//use id of budget
router.delete('/budget/:id', auth, async (req, res) => {
    try {
        const budget = await Budget.findOneAndDelete({ _id: req.params.id, owner: req.user._id })

        if (!budget) {
            res.status(404).send()
        }

        res.send(budget)
    } catch (e) {
        res.status(500).send()
    }
})

module.exports = router