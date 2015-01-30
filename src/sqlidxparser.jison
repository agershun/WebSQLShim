/*
 * SQLite Jison parser grammar rules
 * for SQLidx WebSQL shim over IndexedDB
 * 
 * 
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 by Andrey Gershun, Nolan Lowson
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
 				  Nolan Lowson, nolan@nolanlawson.com
 */

%lex
%options case-insensitive
%%

(['](\\.|[^']|\\\')*?['])+                       return 'QLITERAL'
(["](\\.|[^"]|\\\")*?["])+                       return 'STRING'


"--"(.*?)($|\r\n|\r|\n)							return /* return 'COMMENT' */

\s+                                             /* skip whitespace */

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
'CURRENT_TIMESTAMP'		return 'CURRENT TIMESTAMP'
'DATABASE'		return 'DATABASE'
'DEFAULT'		return 'DEFAULT'
'DEFERRABLE'		return 'DEFERRABLE'
'DEFERRED'		return 'DEFERRED'
'DELETE'		return 'DELETE'
'DESC'		return 'DESC'
'DETACH'		return 'DETACH'
'DISTINCT'		return 'DISTINCT'
'DROP'		return 'DROP'
'EACH'		return 'EACH'
'ELSE'		return 'ELSE'
'END'		return 'END'
'ESCAPE'		return 'ESCAPE'
'EXCEPT'		return 'EXCEPT'
'EXCLUSIVE'		return 'EXCLUSIVE'
'EXISTS'		return 'EXISTS'
'EXPLAIN'		return 'EXPLAIN'
'FAIL'		return 'FAIL'
'FOR'		return 'FOR'
'FOREIGN'		return 'FOREIGN'
'FROM'		return 'FROM'
'FULL'		return 'FULL'
'GLOB'		return 'GLOB'
'GROUP'		return 'GROUP'
'HAVING'		return 'HAVING'
'IF'		return 'IF'
'IGNORE'		return 'IGNORE'
'IMMEDIATE'		return 'IMMEDIATE'
'IN'		return 'IN'
'INDEX'		return 'INDEX'
'INDEXED'		return 'INDEXED'
'INITIALLY'		return 'INITIALLY'
'INNER'		return 'INNER'
'INSERT'		return 'INSERT'
'INSTEAD'		return 'INSTEAD'
'INTERSECT'		return 'INTERSECT'
'INTO'		return 'INTO'
'IS'		return 'IS'
'ISNULL'		return 'ISNULL'
'JOIN'		return 'JOIN'
'KEY'		return 'KEY'
'LEFT'		return 'LEFT'
'LIKE'		return 'LIKE'
'LIMIT'		return 'LMIT'
'MATCH'		return 'MATCH'
'NATURAL'		return 'NATURAL'
'NO'		return 'NO'
'NOT'		return 'NOT'
'NOTNULL'		return 'NOTNULL'
'NULL'		return 'NULL'
'OF'		return 'OF'
'OFFSET'		return 'OFFSET'
'ON'		return 'ON'
'OR'		return 'OR'
'ORDER'		return 'ORDER'
'OUTER'		return 'OUTER'
'PLAN'		return 'PLAN'
'PRAGMA'		return 'PRAGMA'
'PRIMARY'		return 'PRIMARY'
'QUERY'		return 'QUERY'
'RAISE'		return 'RAISE'
'RECURSIVE'		return 'RECURSIVE'
'REFERENCES'		return 'REFERENCES'
'REGEXP'		return 'REGEXP'
'REINDEX'		return 'REINDEX'
'RELEASE'		return 'RELEASE'
'RENAME'		return 'RENAME'
'REPLACE'		return 'REPLACE'
'RESTRICT'		return 'RESTRICT'
'RIGHT'		return 'RIGHT'
'ROLLBACK'		return 'ROLLBACK'
'ROW'		return 'ROW'
'SAVEPOINT'		return 'SAVEPOINT'
'SELECT'		return 'SELECT'
'SET'		return 'SET'
'TABLE'		return 'TABLE'
'TEMP'		return 'TEMP'
'TEMPORARY'		return 'TEMPORARY'
'THEN'		return 'THEN'
'TO'		return 'TO'
'TRANSACTION'		return 'TRANSACTION'
'TRIGGER'		return 'TRIGGER'
'UNION'		return 'UNION'
'UNIQUE'		return 'UNIQUE'
'UPDATE'		return 'UPDATE'
'USING'		return 'USING'
'VACUUM'		return 'VACUUM'
'VALUES'		return 'VALUES'
'VIEW'		return 'VIEW'
'VIRTUAL'		return 'VIRTUAL'
'WHEN'		return 'WHEN'
'WHERE'		return 'WHERE'
'WITH'		return 'WITH'
'WITHOUT'		return 'WITHOUT'

(\d*[.])?\d+[eE]\d+								return 'NUMBER'
(\d*[.])?\d+									return 'NUMBER'

'+'												return 'PLUS'
'-' 											return 'MINUS'
'*'												return 'STAR'
'/'												return 'SLASH'
'%'												return 'MODULO'
'<>'											return 'NE'
'!='											return 'NE'
'>='											return 'GE'
'>'												return 'GT'
'<='											return 'LE'
'<'												return 'LT'
'='												return 'EQ'
'('												return 'LPAR'
')'												return 'RPAR'

'.'												return 'DOT'
','												return 'COMMA'
':'												return 'COLON'
';'												return 'SEMICOLON'
'$'												return 'DOLLAR'
'?'												return 'QUESTION'
'^'												return 'CARET'

[a-zA-Z_][a-zA-Z_0-9]*                       	return 'LITERAL'

<<EOF>>               							return 'EOF'
.												return 'INVALID'
/lex
%left PLUS MINUS

%start main

%%

name
	: LITERAL
		{ $$ = $1; }
	;

main
	: sql_stmt_list EOF
		{ $$ = $1; }
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
	: ALTER TABLE database_table_name alter_table_action
		{ $$ = {statement: 'ALTER TABLE'}; y.extend($$, $3); y.extend($$, $4);  }
	;

database_table_name 
	: literal DOT literal
		{ $$ = {database:$1, table:$3}; }
	| literal
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
	: ANALYZE database_table_name
		{ $$ = {statement: 'ANALYZE'}; yy.extend($$, $2); }
	;

attach_stmt
	: ATTACH database expr AS literal
		{ $$ = {statement: 'ATTACH', expr: $3, database:$5}; }	
	;

database 
	:
	| DATABASE
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
	: commit transaction
		{ $$ = {statement: 'COMMIT TRANSACTION'}; }			
	;

commit
	: COMMIT
	| END
	;

transaction
	:
	| TRANSACTION
	;

create_index_stmt
	: CREATE unique INDEX if_not_exists database_table_name ON literal 
	    LPAR columns RPAR where
	    { $$ = {statement: 'CREATE INDEX', index:$7, columns:$9 }; yy.extend($$,$2); 
	    	yy.extend($$, $4); yy.extend($$, $5); yy.extend($$,$11);
	    }
	;

unique
	:
		{ $$ = undefined; }
	| UNIQUE
		{ $$ = {type:'UNIQUE'}; }
	;

if_not_exists
	:
		{ $$ = undefined; }
	| IF NOT EXISTS
		{ $$ = {ifnotexists:true}; }
	;

columns
	: columns COMMA literal
		{ $$ = $1; $$.push($3); }
	| literal
		{ $$ = [$1]; }

where
	: WHERE expr
		{ $$ = {where: $2}; }
	|
	;

create_table_stmt
	: CREATE temporary TABLE if_not_exists database_table_name AS select_stmt
		{ $$ = {statement: 'CREATE TABLE', as:$7};
			yy.extend($$,$2);
			yy.extend($$,$4);
			yy.extend($$,$5);
		}
	| CREATE temporary TABLE if_not_exists database_table_name LPAR column_defs 
		table_constraints RPAR without_rowid
		{ $$ = {statement: 'CREATE TABLE', column_defs: $7, constraints:$8 };
			yy.extend($$,$2);
			yy.extend($$,$4);
			yy.extend($$,$5);
			yy.extend($$,$10);
		}
	;

without_rowid
	: 
	| WITHOUT ROWID
	;

temporary
	:
		{ $$ = undefined; }
	|
		{ $$ = {temporary:true}; }
	;

column_defs
	: column_defs COMMA column_def
		{ $$ = $1; $$.push($3); }
	| column_def
		{ $$ = [$1]; }
	;

column_def
	: literal type_name column_constraints
		{ $$ = {column:$1, constraints: $3}; yy.extend($$,$2); }
	| literal type_name
		{ $$ = {column:$1}; yy.extend($$,$2); }
	;

type_name
	: names
		{ $$ = {type: $1}; }
	| names LPAR signed_number RPAR
		{ $$ = {type: $1, len: $3}; }
	| names LPAR signed_number COMMA signed_number RPAR
		{ $$ = {type: $1, len: $3, precision:$5}; }
	;

names 
	: names literal
		{ $$ = $1+' '+$2; }
	| literal
		{ $$ =$1; }
	;


column_constraints
	:	
		{ $$ = undefined; } 
	| column_constraints column_constraint
		{ $$ = $1; $$.push($2); }
	| column_constraint
		{ $$ = [$1]; }
	;

column_constraint
	: CONSTRAINT literal col_constraint
		{ $$ = {constraint: $2}; yy.extend($$,$3); }
	| col_constraint
		{ $$ = $1; }
	;

col_constraint
	: PRIMARY KEY asc_desc conflict_clause autoincrement
	| NOT NULL conflict_clause
	| UNIQUE conflict_clause
	| CHECK LPAR expr RPAR
	| DEFAULT signed_number
	| DEFAULT literal_value
	| DEFAULT LPAR expr RPAR
	| COLLATE literal
	| foreign_key_clause
	;

asc_desc
	:
	| ASC
	| DESC
	;

autoincrement
	: 
	| AUTOINCREMENT
	;


table_constraints
	: table_constraints table_constraint
		{ $$ = $1; $$.push($2); }
	| COMMA table_constraint
		{ $$ = $2; } 
	|
		{ $$ = []; }
	;

table_constraint
	: CONSTRAINT literal tab_constraint
	| tab_constraint
	;

tab_constraint
	: PRIMARY KEY LPAR columns RPAR conflict_clause
	| UNIQUE LPAR columns RPAR conflict_clause
	| CHECK LPAR expr RPAR
	| FOREIGN KEY LPAR columns RPAR foreign_key_clause
	;

conflict_clause
	: 
	| ON CONFLICT ROLLBACK
	| ON CONFLICT ABORT
	| ON CONFLICT FAIL
	| ON CONFLICT IGNORE
	| ON CONFLICT REPLACE
	;

create_trigger_stmt
	: CREATE temporary TRIGGER if_not_exists database_table_name before_after
		delete_insert_update ON literal for_each_row when begin_trigger_end
	;
	
before_after 
	:
	| BEFORE
	| AFTER
	| INSTEAD OF
	;

delete_insert_update
	: DELETE
	| INSERT
	| UPDATE 
	| UPDATE OF columns
	;	

for_each_row
	:
	| FOR EACH ROW
	;

begin_trigger_end
	: BEGIN uids_stmts END
	;

uids_stmts
	: uids_stmts uids_stmt
	| uids_stmt
	;

uids_stmt
	: update_stmt COMMA
	| insert_stmt COMMA
	| delete_stmt COMMA
	| select_stmt COMMA
	;

create_view_stmt
	: CREATE temporary VIEW if_not_exists database_table_name AS select_stmt
	;
	
create_virtual_table_stmt
	: CREATE VIRTUAL TABLE if_not_exists database_table_name USING literal module_arguments_par
	;
	
module_arguments_par
	: LPAR module_arguments RPAR 
	;

module_arguments
	: module_arguments COMMA module_argument
	| module_argument
	;

delete_stmt
	: with_clause DELETE FROM qualified_table_name where
	;
	
qualified_table_name 
	: database_table_name 
	| database_table_name INDEXED BY literal
	| database_table_name NOT INDEXED
	;	

with_clause
	: WITH recursive cte_tables
	;

recursive
	: RECURSIVE
	|
	;

cte_tables
	: literal
	| literal LPAR columns RPAR
	;

delete_stmt_limited
	:
	;
	
detach_stmt
	: DETACH database literal
		{ $$ = {statement:'DETACH', database:$3}; }
	;
	
drop_index_stmt
	: DROP TABLE if_exists database_table_name
	;
	
if_exists
	: IF EXISTS
		{ $$ = {if_exists:true}; }
	|
		{ $$ = undefined; }
	;

drop_table_stmt
	: DROP TABLE if_exists database_table_name
	;
	
drop_trigger_stmt
	: DROP TRIGGER if_exists database_table_name
	;
	
drop_view_stmt
	: DROP VIEW if_exists database_table_name
	;
	
insert_stmt
	: with insert INTO database_table_name columns_par VALUES values_list
	| with insert INTO database_table_name columns_par select_stmt
	| DEFAULT VALUES
	;
	
pragma_stmt
	: PRAGMA database_table_name 
	| PRAGMA database_table_name EQ pragma_value
	| PRAGMA database_table_name EQ LPAR pragma_value RPAR
	;
	
pragma_value
	: signed_number
	| literal
	| string_literal
	;

reindex_stmt
	: REINDEX
	| REINDEX literal
	| REINDEX database_table_name
	;
	
release_stmt
	: RELEASE savepoint literal
	;
	
rollback_stmt
	: ROLLBACK transaction TO savepoint literal
	: ROLLBACK transaction
	;
	
savepoint
	: SAVEPOINT
	|
	;

savepoint_stmt
	: SAVEPOINT literal
	;
	
select_stmt
	:
	;
	
update_stmt
	: with UPDATE or_rollback qualified_table_name SET column_expr_list where
	;

or_rollback
	: OR ROLLBACK
	| OR ABORT
	| OR REPLACE
	| OR FAIL
	| OR IGNORE
	;

column_expr_list
	: column_expr_list COMMA column_expr
	| column_expr
	;

column_expr
	: literal EQ expr
	;

update_stmt_limited
	:
	;
	
vacuum_stmt
	: VACUUM
		{ $$ = {statement: 'VACUUM'}; }
	;
	
expr
	: literal_value
	| bind_parameter
	| literal
	| database_table_name DOT literal
	| unary_operator expr
	| expr binary_operator expr
	| literal LPAR function_args RPAR
	| LPAR expr RPAR
	| CAST LPAR expr AS type_name RPAR
	| expr COLLATE literal
	| expr not like_match expr escape_expr
	| expr ISNULL
	| expr NOTNULL
	| expr NOT NULL
	| expr IS not expr
	| expr not BETWEEN expr AND expr
	| expt not IN database_table_name
	| expt not IN LPAR RPAR 
	| expt not IN LPAR select_stmt RPAR 
	| expt not IN LPAR expr_list RPAR 
	| not EXISTS LPAR select_stmt RPAR
	| LPAR select_stmt RPAR
	| CASE expr when_then_list else END
	| CASE when_then_list else END
	;

