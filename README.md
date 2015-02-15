# WebSQLShim - SQLite/WebSQL SQL Parser

Version 0.0.2 (31.01.2015) [Changelog](CHANGELOG.md) [Release plan](RELEASES.md)


## Warning
Work in Progress. 

Only [WebSQL/SQLite SQL parser](src/sqliteparser.jison) is ready for the moment.


## Usage

To use WebSQLShim add the [websqlshim.js](websqlshim.js) library to your page:
```html
	<script src="websqlshim.js"></script>
	<script>
	var db = WebSQLShim.openDatabase("mybase",'0.1','',100000);
	db.transaction(function(tx){
		tx.executeSql('SELECT * FROM one WHERE a = ?', [10], function(result){

		}, function(error){
			console.log(error);
		});
	});
	</script>
```
In case you want to use WebSQLShim as WebSQL shim add this replacement code:
```html
	<script src="websqlshim.js"></script>
	<script>
		if (typeof openDatabase == 'undefined') openDatabase = WebSQLShim.openDatabase;
		//...
		var db = openDatabase("mybase",'0.1','',100000);
		//...
	</script>
```

## SQL parser

WebSQL/SQLite language [Jison grammar file](src/sqliteparser.jison) and JavaScript parser.

## Tests
Use Mocha.js test package. To run tests in Node.js:

```
    cd test/main    // main function tests
    mocha .

    cd test/parser  // parser tests
    mocha .

```

Andrey Gershun
MIT LICENSE
