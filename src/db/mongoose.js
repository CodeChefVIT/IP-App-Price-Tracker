const mongoose = require('mongoose')

mongoose.connect('mongodb+srv://shkonda:Iwgtawia2#@cluster0.lb18q.mongodb.net/test?retryWrites=true&w=majority', {
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: false
})