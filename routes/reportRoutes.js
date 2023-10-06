const express = require('express');
const Product = require('../Models/reportModel')
const {getreports, createreport} = require('../controllers/reportController')

const router = express.Router();

router.get('/:uid', getreports);


router.post('/',
    createreport
);


module.exports = router;