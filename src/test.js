
var parser = require("./start.js");
var fs = require('fs');

var sql = fs.readFileSync('chinsmall.sql').toString();

var res = parser.parsesql(sql);

console.log(res);