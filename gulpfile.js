/**
  gulpfile.js
  Gulp for WebSQLShim
  Date: 31.01.2014
  (c) 2015, Andrey Gershun, Nolan Lawson
*/

// Requires
var gulp = require('gulp');
module.exports = gulp;
var concat = require('gulp-concat-sourcemap');
var shell = require('gulp-shell');

// Merge source files
gulp.task('js-merge', function () {
  return gulp.src([
  	'./src/01start.js', 
  	'./src/sqliteparser.js', 
  	'./src/05utility.js', 
    './src/10parser.js',
    './src/15database.js',
    './src/17transaction.js',
    './src/19resultset.js',
    './src/20statement.js',
    './src/21params.js',
    './src/50altertable.js',
    './src/51analyze.js',
    './src/52attach.js',
    './src/53begin.js',
    './src/54commit.js',
    './src/55createindex.js',
    './src/56createtable.js',
    './src/57createtrigger.js',
    './src/58createview.js',
    './src/59createvirtual.js',
    './src/60delete.js',
    './src/61detach.js',
    './src/62dropindex.js',
    './src/63droptable.js',
    './src/64droptrigger.js',
    './src/65dropview.js',
    './src/66end.js',
    './src/67explain.js',
    './src/68insert.js',
    './src/69pragma.js',
    './src/70reindex.js',
    './src/71release.js',
    './src/72replace.js',
    './src/73rollback.js',
    './src/74savepoint.js',
    './src/75select.js',
    './src/76update.js',
    './src/77vacuum.js',
   	'./src/99finish.js',
    ])
    .pipe(concat('websqlshim.js'))
    .pipe(gulp.dest('./'))
});

// Compile Jison file
gulp.task('jison-compile', function () {
  return gulp.src('./src/*.jison', {read: false})
    .pipe(shell([
      'jison ./src/sqliteparser.jison -o ./src/sqliteparser.js',
    ]));
});

// Copy files to dist directory
gulp.task('copy-dist', function(){
  gulp.src(['./websqlshim.js','./websqlshim.js.map'])
    .pipe(gulp.dest('dist'));
});

// Run tasks 
gulp.task('default', ['js-merge'], function(){
  gulp.watch('./src/*.js',function(){ gulp.run('js-merge'); });
  gulp.watch('./src/*.jison',function(){ gulp.run('jison-compile'); });
  gulp.watch('./websqlshim.js',function(){ gulp.run('copy-dist'); });
});
