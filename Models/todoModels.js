const mongoose = require('mongoose')

const todoSchema = mongoose.Schema(
    {
        user_id: {
            type: mongoose.Schema.Types.ObjectId,
            required: true,
            ref: "User",
          },
        cat: {
            type: String,
            required: [true, "Please enter a product name"]
        },
        title: {
            type: String,
            required: true,
        },
        disc: {
            type: String,
            required: true,
        },
    },
    {
        timestamps: true
    }
)


const todo = mongoose.model('Product', todoSchema);

module.exports = todo;