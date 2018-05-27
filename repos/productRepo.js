var db = require('../fn/db');
var config = require('../config/config');

exports.loadAll = () => {
    var sql = 'select * from products';
    return db.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from products where CatID = ${catId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.loadAllByBrand = (brandId, offset) => {
    var sql = `select * from products where BrandID = ${brandId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByCat = catId => {
    var sql = `select count(*) as total from products where CatID = ${catId}`;
    return db.load(sql);
}

exports.countByBrand = brandId => {
    var sql = `select count(*) as total from products where BrandID = ${brandId}`;
    return db.load(sql);
}

exports.loadByNewestOption = (limit) => {
    var sql = `select * from products order by Date DESC limit ${limit}`;
    return db.load(sql);
}

exports.loadByViewOption = (limit) => {
    var sql = `select * from products order by Viewer DESC limit ${limit}`;
    return db.load(sql);
}

exports.loadBySoldOption = (limit) => {
    var sql = `select * from products order by Sold DESC limit ${limit}`;
    return db.load(sql);
}