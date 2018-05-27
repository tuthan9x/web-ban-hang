var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from details';
    return db.load(sql);
}

exports.single = (ProId) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from details where ProID = ${ProId}`;
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