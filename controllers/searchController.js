var express = require('express');
var productRepo = require('../repos/productRepo');
var config = require('../config/config');

var router = express.Router();

router.get('/', (req, res) => {
    var query = unescape(req.query.q);
    var sortPrice = req.query.sort;
    if (query) {
        var page = req.query.page;
        if (!page) {
            page = 1;
        }

        var offset = (page - 1) * config.PRODUCTS_PER_PAGE;
    
        productRepo.search(query).then(rows => {
            var nPages = rows.length / config.PRODUCTS_PER_PAGE;
            if (rows.length % config.PRODUCTS_PER_PAGE > 0) {
                nPages++;
            }

            var numbers = [];
            for (let i = 1; i <= nPages; i++) {
                numbers.push({
                    value: i,
                    isCurPage: i === +page
                });
            }
            if (sortPrice){
                if (sortPrice === "price:asc"){
                    rows.sort((a, b) => {return (a.Price >= b.Price) ? 1 : ((b.Price > a.Price) ? - 1 : 1)});
                }
                else if (sortPrice === "price:desc"){
                    rows.sort((a, b) => {return (a.Price <= b.Price) ? 1 : ((b.Price < a.Price) ? - 1 : 1)});
                }
                else {
                    rows.sort((a, b) => {return (a.Viewer <= b.Viewer) ? 1 : ((b.Viewer < a.Viewer) ? - 1 : 1)});
                }
            }
            var vm = {
                products: rows.slice(offset, offset + config.PRODUCTS_PER_PAGE),
                len: rows.length,
                query: query,
                page_numbers: numbers,
                hasPrevious: page != 1,
                hasNext: page != numbers.length,
                maxPage: numbers.length,
                sortPrice: sortPrice !== undefined ? "&sort=" + sortPrice : ""
            }
            res.render('search/index', vm);
        });
    }
    else {
        res.render('error/index');
    }
})
module.exports = router;