# WebSQLShim - WebSQL shim over IndexedDB

Version 0.0.2 (31.01.2015) [Changelog](CHANGELOG.md) [Release plan](RELEASES.md)


**Warning:** Work in Progress.

## Usage

To shart use WebSQLShim add the following lines to your page:
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
In case you want to use WebSQLShim as WebSQL shim add this code:
```html
	<script src="websqlshim.js"></script>
	<script>
		if(typeof openDatabase == 'undefined') openDatabase = WebSQLShim.openDatabase;
		var db = openDatabase("mybase",'0.1','',100000);
		//...
	</script>
```

## SQL parser

WebSQL/SQLite language [Jison grammar file](https://github.com/agershun/WebSQLShim/blob/master/src/sqlidxparser.jison) and JavaScript parser.

## Tests
Use Mocha.js test package. To run tests in Node.js:

```
    cd test/parser
    mocha .
```

(c) 2015 Andrey Gerhsun, Nolan Lawson
