// Transaction class


var SQLTransaction = function(readonly){
	this.readonly = readonly;
};

/*
var SQLTransactionSync = function(readonly){
	this.readonly = readonly;	
};
*/

SQLTransaction.prototype.executeSql = function(sql, params, callback){
	
	// 1. Parse
	var ast = parse(sql);
	if(ast.length != 1) {
		throw new Error('WebSQL supports only one statement');
	}

	bindParameters(ast,params);
	interpret[ast[0].statement](ast, callback);
	// 2. Bind parameters
	// bindParameters(ast);
	//
	// run(ast, params) 
	//
	// var data = new SQLResultSet(); 
	// callback(data);
};

