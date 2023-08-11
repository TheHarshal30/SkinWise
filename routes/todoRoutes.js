const express = require('express');
const Product = require('../Models/todoModels')
const {gettodo, gettodoc, createtodo, updatetodo, deletetodo, getallc} = require('../controllers/todoController')

const router = express.Router();
const validateToken = require("../middleware/validateTokenHandler");

router.use(validateToken);
router.get('/', gettodo);

router.get('/:cat', gettodoc);


router.get('/cat/all', getallc);

router.post('/', createtodo);

// // update a product
router.put('/:id', updatetodo);

// // delete a product

router.delete('/:id', deletetodo);

module.exports = router;