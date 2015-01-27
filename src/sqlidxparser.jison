/*
//
// sqlidxparser.jison
// SQL Parser for SqlIdx.js
// Date: 27.01.2015
// Modified: 27.01.2015
// (c) 2015, Andrey Gershun
//
*/

%lex
%options case-insensitive
%%

\s+                                             /* skip whitespace */
'SELECT'										return 'SELECT'

<<EOF>>               							return 'EOF'
.												return 'INVALID'
/lex
%left PLUS MINUS

%start main

%%

main
	: sql-stmt-list EOF
		
	;

/* http://www.sqlite.org/lang.html */
sql-stmt-list
	: sql-stmt-list SEMICOLON sql-stmt
	| sql-stmt
	|
	;

sql-stmt
	: ExplainClause SqlStmtClause
	;

ExplainClause
	: EXPLAIN
	| EXPLAIN QUERY PLAN
	|
	;

SqlStmtClause
	: after-table-stmt
	| analyze-stmt
	| attach-stmt
	| begin-stmt
	| commit-stmt
	| create-index-stmt
	| create-table-stmt
	| create-trigger-stmt
	| create-view-stmt
	| create-virtual-table-stmt
	| delete-stmt
	| delete-stmt-limited
	| detach-stmt
	| drop-index-stmt
	| drop-table-stmt
	| drop-trigger-stmt
	| drop-view-stmt
	| insert-stmt
	| pragma-stmt
	| reindex-stmt
	| release-stmt
	| rollback-stmt
	| savepoint-stmt
	| select-stmt
	| update-stmt
	| update-stmt-limited
	| vacuum-stmt
	;

/* http://www.sqlite.org/lang_altertable.html */
alter-table-stmt
	: ALTER TABLE AlterTableClause AlterTableAction
	;

AlterTableClause 
	: database-name DOT table-name
	| table-name
	;

AlterTableAction
	: RENAME TO new-table-name
	| ADD COLUMN column-def
	| ADD column-def
	;


AlterTableAction

