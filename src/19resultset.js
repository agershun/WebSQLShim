
var SQLResultSet = function(){
	this.insertId = 0;
	this.rowsAffected = 0;
	// this.rows = new SQLResultSetRowList();

};

var SQLResultSetRowList = function(){
	this.data = [{a:1},{a:2}];
	this.length = this.data.length;
};

SQLResultSetRowList.prototype.item = function(idx){
	return this.data[idx];
};


