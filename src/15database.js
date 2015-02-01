/**

Main part of the WebSQLShim

See http://www.w3.org/TR/webdatabase/#preprocess-the-sql-statement
*/

// 1. Check, if WebSQL exists

// Main class

WebSQLShim.openDatabase = function(name, version, displayName, estimatedSize, creationCallback) {
	// Error messages
	if(arguments.length != 4) {
		throw new TypeError("Failed to execute 'openDatabase' on 'Window': 4 arguments required, but only 1 present.");
	}
	if(arguments.length >= 5 && typeof creationCallback != 'function') {
		throw new TypeError("Failed to execute 'openDatabase' on 'Window': The callback provided as parameter 5 is not a function.");
	}

	var database = new Database();
	if(creationCallback) {
		creationCallback(database);
		return;
	} else {
		return database;
	}
};

/*
var openDatabaseSync = function(name, version, displayName, estimatedSize, creationCallback) {
	
	var db = new Database();
	if(creationCallback) {
		creationCallback(db);
	} else {
		return db;
	}
};
*/

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

