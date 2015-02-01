interpreter['SELECT'] = function(ast, callback){
	var res = new SQLResultSet();
	res.insertId = undefined;
	res.rowsAffected = 1;
	res.rows = new SQLResultSetRowsList();
	res.rows.data = [{a:1},{a:2}];
};