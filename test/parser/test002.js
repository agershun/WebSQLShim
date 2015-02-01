if(typeof exports == 'object') {
	var WebSQLShim = require("../../websqlshim.js");
	var assert = require("assert");
	var fs = require('fs');
}

describe('Parser 002. Read and parse SQLite databases', function(){
	it('1.Parse SQLFiddle example', function(done){
		this.timeout(10000);
		var sql = fs.readFileSync('test002.sql').toString();
		var res = WebSQLShim.parse(sql);
		console.log(res.length);
		assert(res.length == 4);
		done();
	});

});

