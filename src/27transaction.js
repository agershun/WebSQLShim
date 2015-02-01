// Transaction class


var SQLTransaction = function(readonly){
	this.readonly = readonly;
};

/*
var SQLTransactionSync = function(readonly){
	this.readonly = readonly;	
};
*/

SQLTransaction.prototype.executeSql = function(sql, args, callback){
	
	// 1. Parse
	var ast = parse(sql);
	console.log(ast);
	// 2. Bind parameters
	// bindParameters(ast);
	//
	// run(ast, params) 
	//
	var data = new SQLResultSet(); 
	// {
	// 	insertId:10,
	// 	rowsAffectd:10,
	// 	rows: [[1],[2],[3]]
	// };
	callback(data);
};

