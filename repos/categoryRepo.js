var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from categories';
    return db.load(sql);
}

exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from categories where CatID = ${id}`;
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
    var sql = `insert into categories(catname) values('${c.CatName}')`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from categories where CatId = ${id}`;
    return db.save(sql);
}

exports.update = (c) => {
    var sql = `update categories set CatName = '${c.CatName}' where CatID = ${c.CatId}`;
    return db.save(sql);
}
exports.count = () => {
    var sql = "select count(*) as soluongtl from categories";
    return db.load(sql);
}