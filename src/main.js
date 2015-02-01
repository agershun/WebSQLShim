/**

Main part of the WebSQLShim

See http://www.w3.org/TR/webdatabase/#preprocess-the-sql-statement
*/

// 1. Check, if WebSQL exists

// Main class

var openDatabase = function(name, version, displayName, estimatedSize, creationCallback) {
	
	var db = new Database();
	if(creationCallback) {
		creationCallback(db);
	} else {
		return db;
	}
};


var openDatabaseSync = function(name, version, displayName, estimatedSize, creationCallback) {
	
	var db = new Database();
	if(creationCallback) {
		creationCallback(db);
	} else {
		return db;
	}
};

// Database class

var Database = function(){
	this.readonly = false; // read only option
};

Database.prototype.transaction = function(callback){
	var tx = new SQLTransaction(false);
	callback(tx);
};

Database.prototype.readTransaction = function(callback){
	var tx = new SQLTransaction(true);
	callback(tx);
};

Database.prototype.changeVersion = function(oldversion, newversion, callback){
	var tx = new SQLTransaction(true);
	callback(tx);
};

// Transaction class


var SQLTransaction = function(readOnly){};
var SQLTransactionSync = function(readOnly){};

Transaction.prototype.executeSql = function(sql, args, callback){
	
	// 1. Parse
	var ast = parser.parseSql(sql);
	// 2. Bind parameters
	// bindParameters(ast);
	//
	// run(ast, params) 
	//
	var data = {
		insertId:10,
		rowsAffectd:10,
		rows: [[1],[2],[3]];
	};
	callback(this, data);
};


var SQLResultSet = function(){};

var SQLResultSetRowList = function(){};

// Error / Exception classes