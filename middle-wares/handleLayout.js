var categoryRepo = require('../repos/categoryRepo');
var brandRepo = require('../repos/brandRepo');

module.exports = (req, res, next) => {
    var category = categoryRepo.loadAll();
    var brand = brandRepo.loadAll();
    Promise.all([category, brand]).then(([categoryRows, brandRows]) =>{
        res.locals.layoutVM = {
            categories : categoryRows,
            brands : brandRows
        };
        next();
    });
};