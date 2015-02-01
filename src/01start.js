
/**
	WebSQLShim
	==========
*/

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define([], factory);
    } else if (typeof exports === 'object') {
        module.exports = factory();
    } else {
        root.alasql = factory();
    }
}(this, function (parser) {

/**
	Main WebSQLShim object
*/
var WebSQLShim = {};
