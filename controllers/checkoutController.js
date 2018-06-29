var express = require('express');
var cartRepo = require('../repos/cartRepo'),
productRepo = require('../repos/productRepo'),
orderRepo = require('../repos/orderRepo');
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
router.post('/addOne', (req, res) => {
	var item = {
		ProId: req.body.proID,
		Quantity: +1
	};
	cartRepo.add(req.session.cart, item);
	res.redirect('/checkout');
});
router.post('/subOne', (req, res) => {
	var item = {
		ProId: req.body.proID,
		Quantity: -1
};
	cartRepo.add(req.session.cart, item);
	res.redirect('/checkout');
});
router.post('/remove', (req, res) => {
	cartRepo.remove(req.session.cart, req.body.ProId);
	res.redirect(req.headers.referer);
});
router.get('/order', (req, res) => {
	res.render('checkout/order');
});

router.post('/billpay', (req, res) => {
    var date = new Date();
    var bill = {
        name: req.session.user.Name,
        email: req.session.user.Email,
        address: req.body.addresss,
        phone: req.body.phone,
        total: req.body.sum,
	}

    var arr_p = [];
    var itemsquanti = [];
   
    for (var i = 0; i < req.session.cart.length; i++) {
        var quan = req.session.cart[i].Quantity;
        itemsquanti.push(quan);
    }

    orderRepo.addbill(bill).then(row => {
		orderRepo.getbillid(bill.phone).then(rowid => {
            var billid = rowid[0].ID;
            Promise.all([arr_p, itemsquanti]).then(([result, qui]) => {
                for (var i = result.length - 1; i >= 0; i--) {
                    var pro = result[i][0];
                    console.log(result.length);
                    var detail = {
                        orderId: billid,
                        proId: pro.ProID,
                        quantity: qui[i],
                        price: pro.Price,
                        sum: pro.Price * qui[i]
                    }
                    console.log(detail);
                    orderRepo.addbilldetail(detail);
				}
			});
        });
		console.log(req.body);
    });
    orderRepo.removeall(req.session.cart);
    res.redirect('order');
});
module.exports = router;