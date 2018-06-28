var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from brands';
    return db.load(sql);
}

exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from brands where BrandID = ${id}`;
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

exports.count = () => {
    var sql = `select count(*) as soluongth from brands`;
    return db.load(sql);
}