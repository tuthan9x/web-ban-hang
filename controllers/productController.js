var express = require('express');
var productRepo = require('../repos/productRepo');
var brandRepo = require('../repos/brandRepo');
var catRepo = require('../repos/categoryRepo');

var config = require('../config/config');

var router = express.Router();

router.get('/byCat/:catId', (req, res) => {
    var catId = req.params.catId;

    var page = req.query.page;
    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var loadAll = productRepo.loadAllByCat(catId, offset);
    var countByCat = productRepo.countByCat(catId);
    var category = catRepo.single(catId);
    Promise.all([loadAll, countByCat, category]).then(([pRows, countRows, categoryRows]) => {
        // console.log(pRows);
        // console.log(countRows);
        console.log(categoryRows);
        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
            products: pRows,
            noProducts: pRows.length === 0,
            page_numbers: numbers,
            catName: categoryRows.CatName
        };
        res.render('product/byCat', vm);
    });
});

router.get('/byBrand/:brandId', (req, res) => {
    var brandId = req.params.brandId;

    var page = req.query.page;
    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var loadAll = productRepo.loadAllByBrand(brandId, offset);
    var countByBrand = productRepo.countByBrand(brandId);
    var brand = brandRepo.single(brandId);
    Promise.all([loadAll, countByBrand, brand]).then(([pRows, countRows, brandRows]) => {
        // console.log(pRows);
        // console.log(countRows);
        // console.log(brandNameRows);

        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
            products: pRows,
            noProducts: pRows.length === 0,
            page_numbers: numbers,
            brandName: brandRows.BrandName
        };
        res.render('product/byBrand', vm);
    });
});

module.exports = router;