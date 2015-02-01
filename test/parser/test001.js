if(typeof exports == 'object') {
	var WebSQLShim = require("../../websqlshim.js");
	var assert = require("assert");
	var fs = require('fs');
}

describe('Parser 001. Read and parse SQLite databases', function(){
	it('1.Parse Chinook SQLite database', function(done){
		this.timeout(10000);
		var sql = fs.readFileSync('../../stuff/db/chinook/chinook_Sqlite.sql').toString();
		var res = WebSQLShim.parse(sql);
//		console.log(res.length);
		assert(res.length == 15639);
		done();
	});


	it('2.Parse Chinook AutoIncrement SQLite database', function(done){
		this.timeout(10000);
		var sql = fs.readFileSync('../../stuff/db/chinook/chinook_Sqlite_AutoIncrementPKs.sql').toString();
		var res = WebSQLShim.parse(sql);
		assert(res.length == 15639);
		done();
	});

	it('3.Parse Northwind SQLite database', function(done){
		this.timeout(10000);
		var sql = fs.readFileSync('../../stuff/db/northwind/Northwind.Sqlite3.sql').toString();
		var res = WebSQLShim.parse(sql);
//		console.log(res.length);
		assert(res.length == 3399);
		done();
	});
});

