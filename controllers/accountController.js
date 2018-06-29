var express = require('express'),
    SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var accountRepo = require('../repos/accountRepo'),
    orderRepo = require('../repos/orderRepo'),
    orderdetailsRepo = require('../repos/orderdetailsRepo');

var restrict = require('../middle-wares/restrict');

var router = express.Router();

router.get('/register', (req, res) => {
    res.render('account/register');
});

router.post('/register', (req, res) => {

    var dob = moment(req.body.dob, 'D/M/YYYY')
        .format('YYYY-MM-DDTHH:mm');

    var user = {
        username: req.body.username,
        password: SHA256(req.body.rawPWD).toString(),
        name: req.body.name,
        email: req.body.email,
        dob: dob,
        permission: 0
    };

    accountRepo.add(user).then(value => {
        var vm = {
                showError: true,
                errorMsg: 'Register successfull.Please login.'
            };
        res.render('account/register',vm);
    });
});

router.get('/login', (req, res) => {
    res.render('account/login');
});

router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        password: SHA256(req.body.rawPWD).toString()
    };

    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            if (rows[0].f_Permission === 0) {
                req.session.isLogged = true;
                req.session.user = rows[0];
                req.session.cart = [];
    
                var url = '/';
                if (req.query.retUrl) {
                    url = req.query.retUrl;
                }
                res.redirect(url);
            }
            else {
                req.session.isLogged = true;
                req.session.user = rows[0];
                req.session.cart = [];
                res.redirect('/admin');
            }

            } else {
                var vm = {
                    showError: true,
                    errorMsg: 'Login failed'
                };
                res.render('account/login', vm);
            }
    });
});


router.get('/profile', (req, res) => {
    res.render('account/profile');
});

router.post('/profile', (req, res) => {

    var dob = moment(req.body.dob, 'D/M/YYYY')
        .format('YYYY-MM-DD');

    var password = req.session.user.f_Password;
    if (req.body.new_password != ""){
        password = SHA256(req.body.new_password).toString()
    }
    var user = {
        id:req.body.id,
        name: req.body.name,
        password: password,
        email: req.body.email,
        dob: dob,
        permission: 0
    };

    accountRepo.update(user).then(value => {
        var vm = {
                showError: true,
                errorMsg: 'Update successfull!'
            };

        req.session.user.f_Name = user.name;
        req.session.user.f_Password = user.password;
        req.session.user.f_Email = user.email;
        req.session.user.f_DOB = user.dob
        res.redirect('/account/profile');
    });
});

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.user = null;
    req.session.cart = [];
    res.redirect('/');
});

router.get('/history', restrict, (req, res) => {
    var orders = orderRepo.loadByUser(req.session.user.f_ID);
    var list_order = []
    Promise.all([orders]).then(([rows]) => {
        for (let i = 0;i < rows.length; i++) {
            var order = orderdetailsRepo.singleID(rows[i].OrderID);
            list_order.push(order);
        }
        Promise.all(list_order).then(list => {
            var items = rows;
            for (let j = 0;j < rows.length; j++) {
                var item = [];
                list.forEach(element => {
                    for (let i = 0;i < element.length; i++) {
                        if (element[i].OrderID == rows[j].OrderID) {
                            console.log(element[i])
                            item.push(element[i]);
                        }
                    }
                })
                items[j]['item'] = item;
                items[j].OrderDate = items[j].OrderDate.getDate() + '/' + items[j].OrderDate.getMonth() + '/' + (items[j].OrderDate.getYear() + 1900); 
            }
            res.render('account/history', {items: items});
        })
    })
});

module.exports = router;