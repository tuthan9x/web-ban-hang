var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from ordersdetails';
    return db.load(sql);
}

exports.single = (detailsId) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from orders where ID = ${detailsId}`;
        db.load(sql).then(rows => {
            if (rows.length === 0) {
                resolve(null);
            }
            else {
                resolve(rows[0]);
            }
        }).catch(err => {
            reject(err);
        });
    });
}