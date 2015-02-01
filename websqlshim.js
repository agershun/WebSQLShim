
/**
	WebSQLShim
	==========
*/

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['./sqliteparser.js'], factory);
    } else if (typeof exports === 'object') {
        module.exports = factory(require('./sqliteparser.js').parser);
    } else {
        root.alasql = factory(root.parser);
    }
}(this, function (parser) {

/**
	Main WebSQLShim object
*/
var WebSQLShim = {};


/**
	Extend an object with another object properties
*/
function extend (a,b){
    if(typeof a == 'undefined') a = {};
    for(key in b) {
        if(b.hasOwnProperty(key)) {
            a[key] = b[key]
        }
    }
    return a;
};

/**
	Remove star-slash multiline comments from the string
*/
function uncomment(str) {
	str = ('__' + str + '__').split('');
	var quote = false,
		quoteSign,
		blockComment = false,
		lineComment = false;

	for (var i = 0, l = str.length; i < l; i++) {
		var unescaped = str[i - 1] !== '\\' || str[i - 2] === '\\';

		if (quote) {
			if (str[i] === quoteSign && unescaped)
				quote = false;
		} else if (blockComment) {
			if (str[i] === '*' && str[i + 1] === '/') {
					str[i] = str[i + 1] = '';
				blockComment = false;
				i++;
			} else { 
				str[i] = '';
			}
		} else if (lineComment) {
			if (str[i + 1] == '\n' || str[i + 1] == '\r')
				lineComment = false;
			str[i] = '';
		} else {
			if (str[i] == '"' || str[i] == "'") {
				quote = true;
				quoteSign = str[i];
			} else if (str[i] == '[' && str[i-1] != "@") {
				quote = true;
				quoteSign = ']';
			} else if (str[i] === '/' && str[i + 1] === '*') {
						str[i] = '';
					blockComment = true;
			}
		}
	}
	str = str.join('').slice(2, -2);
	return str;
};


/** 
	To use extend() function in the parser 
*/
parser.yy.extend = extend;

/** 
	Main parse function
	@return string ast Abstract Syntax Tree
*/
function parse(sql){
	return parser.parse(uncomment(sql));
}


// For debugging purposes
WebSQLShim.parse = parse;



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



// Transaction class


var SQLTransaction = function(readonly){
	this.readonly = readonly;
};

/*
var SQLTransactionSync = function(readonly){
	this.readonly = readonly;	
};
*/

Transaction.prototype.executeSql = function(sql, args, callback){
	
	// 1. Parse
	var ast = parseSql(sql);
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


return WebSQLShim;

}));


//# sourceMappingURL=websqlshim.js.map