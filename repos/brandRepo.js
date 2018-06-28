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
exports.add = (c) => {
    var sql = `insert into brands(BrandName) values('${c.BrandName}')`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from brands where BrandID = ${id}`;
    return db.save(sql);
}

exports.update = (b) => {
    var sql = `update brands set BrandName = '${b.BrandName}' where BrandID = ${b.BrandID}`;
    return db.save(sql);
}
exports.count = () => {
    var sql = "select count(*) as soluongth from brands";
    return db.load(sql);
}