
var parser = require("./sqlidxparser.js").parser;
var fs = require('fs');

// Utility for parser
parser.yy.extend = function (a,b){
    if(typeof a == 'undefined') a = {};
    for(key in b) {
        if(b.hasOwnProperty(key)) {
            a[key] = b[key];
        }
    }
    return a;
};

var sql = fs.readFileSync('test.sql').toString();

var res = parser.parse(sql);

console.log(res);