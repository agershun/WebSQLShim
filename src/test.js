// mymodule.js
var parser = require("./sqlidxparser.js").parser;

parser.yy.extend = function (a,b){
    if(typeof a == 'undefined') a = {};
    for(key in b) {
        if(b.hasOwnProperty(key)) {
            a[key] = b[key]
        }
    }
    return a;
};

var res = parser.parse("ALTER TABLE one RENAME TO two");

console.log(res);