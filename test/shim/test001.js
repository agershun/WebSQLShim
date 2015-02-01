if(typeof exports == 'object') {
	var WebSQLShim = require("../../websqlshim.js");
	var assert = require("assert");
	var fs = require('fs');
}

describe('Shim 001. Test on w3cschool database ', function(){
	it('1.Create w3school database', function(done){
//		this.timeout(10000);
		var js = fs.readFileSync('test001-js.js').toString();
		var window = WebSQLShim;

		eval(js);

		var db = new w3WebSQLInit();
		db.w3InitDatabase();
//		assert(res.length == 4);
		done();
	});

});

