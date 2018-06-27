var express = require('express'),
    SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var accountRepo = require('../repos/accountRepo');
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

router.get('/profile', restrict, (req, res) => {
    res.render('account/profile');
});

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.user = null;
    res.redirect('/home');
});

module.exports = router;