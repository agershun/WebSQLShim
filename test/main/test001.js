if(typeof exports == 'object') {
	var WebSQLShim = require("../../websqlshim.js");
	var assert = require('assert');
}

describe('Main 001. Read and parse SQLite databases', function(){
	it('1.openDatabase() arguments errors', function(done){

		// 4 or 5 parameters		
		assert.throws(function(){
			WebSQLShim.openDatabase();
		}, TypeError);

		// 5th argument is a callback function
		assert.throws(function(){
			WebSQLShim.openDatabase("a","1",1000,123,112);
		}, TypeError);

		done();
	});

	it('2.openDatabase() returns Database', function(done){
		
		var db = WebSQLShim.openDatabase("one","1","Test DB", 1000);	
		assert(typeof db == 'object');
		assert(typeof db.transaction == 'function');
		done();
	});
});

