const express = require('express')
const router = express.Router()
const request = require('request')

var app_data

router.get('/invoice', (req,res,next) => {
    request('http://127.0.0.1:5000', (err, resp, body) => {
        //console.log('error:', err)
        res.send(body)
    })
})

router.get('/invoice/about', (req,res,next) => {
    request('http://127.0.0.1:5000/about', (err, resp, body) => {
        res.send(body)
    })
})


router.post('/invoice/uploader', (req,res,next) => {
    app_data = req.body.app_data
})


router.get('/invoice/uploader', (req,res,next) => {
    res.send(app_data)
})


module.exports = router