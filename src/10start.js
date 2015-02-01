
/**
	WebSQLShim
	==========
*/

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['./sqliteparser.js'], factory);
    } else if (typeof exports === 'object') {
        module.exports = factory(require('./sqliteparser.js').parser);
    } else {
        root.alasql = factory(root.parser);
    }
}(this, function (parser) {

/**
	Main WebSQLShim object
*/
var WebSQLShim = {};
