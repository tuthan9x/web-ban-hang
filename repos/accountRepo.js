var db = require('../fn/db');

exports.add = user => {
    var sql = `insert into users(f_Username, f_Password, f_Name, f_Email, f_DOB, f_Permission) values('${user.username}', '${user.password}', '${user.name}', '${user.email}', '${user.dob}', ${user.permission})`;
    return db.save(sql);
}

exports.login = user => {
    var sql = `select * from users where f_Username = '${user.username}' and f_Password = '${user.password}'`;
    return db.load(sql);
}


exports.single = id => {
    return new Promise((resolve, reject) => {
        var sql = `select * from users where f_ID = ${id}`;
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

exports.update = user => {
    var sql=`update users set f_Password='${user.password}', f_Name='${user.name}', f_Email='${user.email}',f_DOB='${user.dob}' where f_ID = ${user.id}`;
    return db.save(sql);
}
