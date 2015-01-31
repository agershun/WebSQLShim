
var parser = require("./start.js");
var fs = require('fs');

var sql = fs.readFileSync('Northwind.Sqlite3.sql').toString();

var res = parser.parsesql(sql);

console.log(res);