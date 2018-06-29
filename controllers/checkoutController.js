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
    var bill = {
		userID:req.session.user.f_ID,
        name: req.session.user.f_Name,
        email: req.session.user.f_Email,
        address: req.body.address,
        phone: req.body.phone,
        total: req.body.sum,
	}
    var arr_p = [];
    var itemsquanti = [];
   
    for (let i = 0; i < req.session.cart.length; i++) {
        var quan = req.session.cart[i].Quantity;
		itemsquanti.push(quan);
		var p = productRepo.single(req.session.cart[i].ProId);
        arr_p.push(p);
	}

    orderRepo.addbill(bill).then(row => {
		orderRepo.getIDBill(bill.userID).then(row => {
			var billid = row[row.length - 1].ID;
			Promise.all(arr_p).then(result => {
				for (var i = result.length - 1; i >= 0; i--) {
					var pro = result[i];
					var detail = {
						orderId: billid,
						proId: pro.ProID,
						avai:pro.Quantity-itemsquanti[i],
						soldup:pro.Sold+itemsquanti[i],
						proName: pro.ProName,
						quantity: itemsquanti[i],
						price: pro.Price,
						sum: pro.Price * itemsquanti[i]
					}
					console.log(detail.avai);
					orderRepo.addbilldetail(detail);
					orderRepo.upquantity(detail);
					orderRepo.upsold(detail);
				}
			});
        });
	});


    orderRepo.removeall(req.session.cart);
    res.redirect('/account/history');
});
module.exports = router;