var categoryRepo = require('../repos/categoryRepo');
var brandRepo = require('../repos/brandRepo');
var accountRepo=require('../repos/accountRepo');
module.exports = (req, res, next) => {
	if (req.session.isLogged === undefined) {
		req.session.isLogged = false;
	}
    var category = categoryRepo.loadAll();
    var brand = brandRepo.loadAll();
    
    Promise.all([category, brand]).then(([categoryRows, brandRows]) =>{
        res.locals.layoutVM = {
            categories : categoryRows,
            brands : brandRows,
            isLogged:req.session.isLogged,
            curUser:req.session.user
        };
        next();
    });
};