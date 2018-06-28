var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from orders';
    return db.load(sql);
}

exports.single = (OrderId) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from orders where OrderID = ${OrderID}`;
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
 exports.addorder =(Order)=>{
     var sql = `INSERT INTO orders VALUES('${Order.Id}','NOW()','${Order.userId}','${Order.address}','${Order.total}')`;
     return db.save(sql);

}

exports.addorderdetail = detail => {
    var sql = `INSERT INTO orderdetails VALUES('${detail.Id}', '${detail.OrderId}','${detail.proId}', '${ct.quantity}', '${ct.price}','${detail.sum}')`;
    return db.save(sql);
}

exports.add = (cart, item) => {
    for (i = cart.length - 1; i >= 0; i--) {
        if (cart[i].proId === item.proId) {
            cart[i].quantity += item.quantity;
            return;
        }
       
    }
    cart.push(item);
}

