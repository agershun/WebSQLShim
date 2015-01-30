/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 by Andrey Gershun
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Project      : SQLidx: a JavaScript WebSQL shim over IndexedDB
 *                https://github.com/agershun/sqlidx
 * Developed by : Andrey Gerhsun, agershun@gmail.com
 */

%lex
%options case-insensitive
%%

\s+                                             /* skip whitespace */
'SELECT'										return 'SELECT'

"--"(.*?)($|\r\n|\r|\n)							return /* return 'COMMENT' */

'ABORT'		return 'ABORT'
'ACTION'		return 'ACTION'
'ADD'		return 'ADD'
'AFTER'		return 'AFTER'
'ALL'		return 'ALL'
'ALTER'		return 'ALTER'
'ANALYZE'		return 'ANALYZE'
'AND'		return 'AND'
'AS'		return 'AS'
'ASC'		return 'ASC'
'ATTACH'		return 'ATTACH'
'AUTOINCREMENT'		return 'AUTOINCREMENT'
'BEFORE'		return 'BEFORE'
'BEGIN'		return 'BEGIN'
'BETWEEN'		return 'BETWEEN'
'BY'		return 'BY'
'CASCADE'		return 'CASCADE'
'CASE'		return 'CASE'
'CAST'		return 'CAST'
'CHECK'		return 'CHECK'
'COLLATE'		return 'COLLATE'
'COLUMN'		return 'COLUMN'
'COMMIT'		return 'COMMIT'
'CONFLICT'		return 'CONFLICT'
'CONSTRAINT'		return 'CONSTRAINT'
'CREATE'		return 'CREATE'
'CROSS'		return 'CROSS'
'CURRENT_DATE'		return 'CURRENT DATE'
'CURRENT_TIME'		return 'CURRENT TIME'
'CURRENT_TIMESTAMP'		return ''
'DATABASE'		return ''
'DEFAULT'		return ''
'DEFERRABLE'		return ''
'DEFERRED'		return ''
'DELETE'		return ''
'DESC'		return ''
'DETACH'		return ''
'DISTINCT'		return ''
'DROP'		return ''
'EACH'		return ''
'ELSE'		return ''
'END'		return ''
'ESCAPE'		return ''
'EXCEPT'		return ''
'EXCLUSIVE'		return ''
'EXISTS'		return ''
'EXPLAIN'		return ''
'FAIL'		return ''
'FOR'		return ''
'FOREIGN'		return ''
'FROM'		return ''
'FULL'		return ''
'GLOB'		return ''
'GROUP'		return ''
'HAVING'		return ''
'IF'		return ''
'IGNORE'		return ''
'IMMEDIATE'		return ''
'IN'		return ''
'INDEX'		return ''
'INDEXED'		return ''
'INITIALLY'		return ''
'INNER'		return ''
'INSERT'		return ''
'INSTEAD'		return ''
'INTERSECT'		return ''
'INTO'		return ''
'IS'		return ''
'ISNULL'		return ''
'JOIN'		return ''
'KEY'		return ''
'LEFT'		return ''
'LIKE'		return ''
'LIMIT'		return ''
'MATCH'		return ''
'NATURAL'		return ''
'NO'		return ''
'NOT'		return ''
'NOTNULL'		return ''
'NULL'		return ''
'OF'		return ''
'OFFSET'		return ''
'ON'		return ''
'OR'		return ''
'ORDER'		return ''
'OUTER'		return ''
'PLAN'		return ''
'PRAGMA'		return ''
'PRIMARY'		return ''
'QUERY'		return ''
'RAISE'		return ''
'RECURSIVE'		return ''
'REFERENCES'		return ''
'REGEXP'		return ''
'REINDEX'		return ''
'RELEASE'		return ''
'RENAME'		return ''
'REPLACE'		return ''
'RESTRICT'		return ''
'RIGHT'		return ''
'ROLLBACK'		return ''
'ROW'		return ''
'SAVEPOINT'		return ''
'SELECT'		return ''
'SET'		return ''
'TABLE'		return ''
'TEMP'		return ''
'TEMPORARY'		return ''
'THEN'		return ''
'TO'		return ''
'TRANSACTION'		return ''
'TRIGGER'		return ''
'UNION'		return ''
'UNIQUE'		return ''
'UPDATE'		return ''
'USING'		return ''
'VACUUM'		return ''
'VALUES'		return ''
'VIEW'		return ''
'VIRTUAL'		return ''
'WHEN'		return ''
'WHERE'		return ''
'WITH'		return ''
'WITHOUT'		return ''
''		return ''



<<EOF>>               							return 'EOF'
.												return 'INVALID'
/lex
%left PLUS MINUS

%start main

%%

main
	: sql_stmt_list EOF
	;

/* http://www.sqlite.org/lang.html */
sql_stmt_list
	: sql_stmt_list SEMICOLON sql_stmt
		{ $$ = $1; $$.push($3); }
	| sql_stmt
		{ $$ = [$1]; }
	|
	;

sql_stmt
	: sql_stmt_explain sql_stmt_stmt
		{ $$ = $2; y.extend($$, $1); }
	;

sql_stmt_explain
	: 
	| EXPLAIN
		{ $$ = {explain:true}; }
	| EXPLAIN QUERY PLAN
		{ $$ = {explain:true}; }
	;

sql_stmt_stmt
	: alter_table_stmt
	| analyze_stmt
	| attach_stmt
	| begin_stmt
	| commit_stmt
	| create_index_stmt
	| create_table_stmt
	| create_trigger_stmt
	| create_view_stmt
	| create_virtual_table_stmt
	| delete_stmt
	| delete_stmt_limited
	| detach_stmt
	| drop_index_stmt
	| drop_table_stmt
	| drop_trigger_stmt
	| drop_view_stmt
	| insert_stmt
	| pragma_stmt
	| reindex_stmt
	| release_stmt
	| rollback_stmt
	| savepoint_stmt
	| select_stmt
	| update_stmt
	| update_stmt_limited
	| vacuum_stmt
	;

/* http://www.sqlite.org/lang_altertable.html */

alter_table_stmt
	: ALTER TABLE alter_table_name alter_table_action
		{ $$ = {statement: 'ALTER TABLE'}; y.extend($$, $3); y.extend($$, $4);  }
	;

alter_table_name 
	: name DOT name
		{ $$ = {database:$1, table:$3}; }
	| name
		{ $$ = {table:$1}; }
	;

alter_table_action
	: RENAME TO name
		{ $$ = {action: 'RENAME TO', new_table:$3}; }
	| ADD COLUMN column_def
		{ $$ = {action: 'ADD COLUMN', columndef:$3}; }
	| ADD column_def
		{ $$ = {action: 'ADD COLUMN', columndef:$3}; }
	;

analyze_stmt
	: ANALYZE name
		{ $$ = {statement: 'ANALYZE', name: $2}; }
	| ANALYZE name DOT name
		{ $$ = {statement: 'ANALYZE', database:$2 , name: $4}; }
	;

attach_stmt
	: ATTACH expr AS name
		{ $$ = {statement: 'ATTACH', expr: $2, database:$4}; }	
	| ATTACH DATABASE expr AS name
		{ $$ = {statement: 'ATTACH', expr: $3, database:$5}; }	
	;

begin_stmt
	: BEGIN begin_stmt_type TRANSACTION
		{ $$ = {statement: 'BEGIN TRANSACTION', type: $2}; }			
	;

begin_statement_type
	:
		{ $$ = undefined; }
	| DEFERRED
		{ $$ = 'DEFERRED'; }
	| IMMEDIATE
		{ $$ = 'IMMEDIATE'; }
	| EXCLUSIVE
		{ $$ = 'EXCLUSIVE'; }
	;

commit_stmt
	: COMMIT TRANSACTION
		{ $$ = {statement: 'COMMIT TRANSACTION'}; }			
	| COMMIT
		{ $$ = {statement: 'COMMIT TRANSACTION'}; }			
	| END TRANSACTION
		{ $$ = {statement: 'COMMIT TRANSACTION'}; }			
	| END
		{ $$ = {statement: 'COMMIT TRANSACTION'}; }			
	;

compound_select_stmt
	;