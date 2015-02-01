if(typeof exports == 'object') {
	var WebSQLShim = require("../../websqlshim.js");
	var assert = require('assert');
}

describe('Main 002. Transactions', function(){
	it('1. Database.transaction()', function(done){

		var db = WebSQLShim.openDatabase("a","1","My DB",100);

		db.transaction(function(tx){
			assert(typeof tx == 'object');
			done();
		});

	});

	it('2. Transaction.executeSql()', function(done){

		var db = WebSQLShim.openDatabase("a","1","My DB",100);

		db.transaction(function(tx){
			tx.executeSql("SELECT 100", [], function(result){
				assert(typeof result == 'object');
				assert(typeof result.rows == 'object');
				assert(typeof result.rows.item == 'function');
				done();
			}, function(err){
				throw err;

			});

		});

	});
});

