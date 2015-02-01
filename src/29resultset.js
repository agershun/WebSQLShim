
var SQLResultSet = function(){
	this.insertId = 10;
	this.rowsAffectd = 10;
	this.rows = new SQLResultSetRowList();

};

var SQLResultSetRowList = function(){
	this.length = 2;
	this.data = [{a:1},{a:2}];
};

SQLResultSetRowList.prototype.item = function(idx){
	return this.data[idx];
};


