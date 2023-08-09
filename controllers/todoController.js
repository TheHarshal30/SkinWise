const Product = require('../Models/todoModels')
const asyncHandler = require('express-async-handler')

// get all product
const gettodo = asyncHandler(async (req, res) => {
    const product = await Product.find({ user_id: req.user.id });
    res.status(200).json(product);
  });
  

// get a single product
const gettodoc = asyncHandler(async(req, res) =>{
    try {
        const {cat} = req.params;
        const product = await Product.find({cat : cat, user_id : req.user.id});
        res.status(200).json(product);
    } catch (error) {
        res.status(500);
        throw new Error(error.message);
    }
})

// create a product
const createtodo = asyncHandler(async(req, res) => {
        const { cat, title, disc } = req.body;
        if (!cat || !title || !disc) {
            res.status(400);
            throw new Error("All fields are mandatory !");
          }
        const product = await Product.create({
            cat,
            title,
            disc,
            user_id : req.user.id
        })
        res.status(200).json(product);
})

// update a product
const updatetodo = asyncHandler(async(req, res) => {
    try {
        const {id} = req.params;
        const product = await Product.findByIdAndUpdate(id, req.body,{new : true});
        // we cannot find any product in database
        if(!product){
            res.status(404);
            throw new Error(`cannot find any product with ID ${id}`);
        }
        const updatedProduct = await Product.findById(id);
        res.status(200).json(updatedProduct);
        
    } catch (error) {
        res.status(500);
        throw new Error(error.message);
    }
})

const deletetodo = asyncHandler(async(req, res) =>{
    try {
        const {id} = req.params;
        const product = await Product.findByIdAndDelete(id);
        if(!product){
            res.status(404);
            throw new Error(`cannot find any product with ID ${id}`);
        }
        res.status(200).json(product);
        
    } catch (error) {
        res.status(500);
        throw new Error(error.message);
    }
})

module.exports = {
    gettodo,
    gettodoc,
    createtodo,
    updatetodo,
    deletetodo
}