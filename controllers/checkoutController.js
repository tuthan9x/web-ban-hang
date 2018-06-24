var express = require('express');
var categoryRepo = require('../repos/categoryRepo');
var productRepo = require('../repos/productRepo');
var config = require('../config/config');
var router = express.Router();



router.get('/', (req, res) => {

        res.render('checkout/cart');
   
});

module.exports = router;