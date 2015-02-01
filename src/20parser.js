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

