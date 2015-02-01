if(typeof exports == 'object') {
	var parser = require("../../websqlshim.js");
	var fs = require('fs');
}

describe('001. Test SQLite databases', function(){
	it('1.Read Chinook SQLite database', function(done){
		var sql = fs.readFileSync('../../test-sql/chinook/chinook_Sqlite_AutoIncrementPKs.sql').toString();
		var res = parser.parsesql(sql);
		console.log(res.length);
		done();
	});
});

