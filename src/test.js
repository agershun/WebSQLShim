
var parser = require("./start.js");
var fs = require('fs');

var sql = fs.readFileSync('chinook_Sqlite_AutoIncrementPKsPKsPKs.sql').toString();

var res = parser.parsesql(sql);

console.log(res);