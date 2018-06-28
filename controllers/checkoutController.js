var express = require('express');
var cartRepo = require('../repos/cartRepo'),
productRepo = require('../repos/productRepo');

var router = express.Router();

router.get('/', (req, res) => {
	var arr_p = [];
	for (var i = 0; i < req.session.cart.length; i++) {
		var cartItem = req.session.cart[i];
		var p = productRepo.single(cartItem.ProId);
		arr_p.push(p);
	}

	var items = [];
	Promise.all(arr_p).then(result => {
		var sum = 0;	
		for (var i = result.length - 1; i >= 0; i--) {
		var pro = result[i];
		var item = {
				Product: pro,
				Quantity: req.session.cart[i].Quantity,
				Amount: pro.Price,
				Available: pro.Quantity-pro.Sold
			};
			items.push(item);
			sum += req.session.cart[i].Quantity * pro.Price;
		}

		var vm = {
			items: items,
			sum: sum
		};
		res.render('checkout/cart', vm);
	});
});
    
router.post('/add', (req, res) => {
	var item = {
		ProId: req.body.proID,
		Quantity: +req.body.quantity
	};
	cartRepo.add(req.session.cart, item);
	res.redirect('/checkout');
});

router.post('/remove', (req, res) => {
	cartRepo.remove(req.session.cart, req.body.ProId);
	res.redirect(req.headers.referer);
});
    
module.exports = router;