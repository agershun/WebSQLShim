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
  	'./src/10start.js', 
  	'./src/sqliteparser.js', 
  	'./src/15utility.js', 
    './src/20parser.js',
    './src/25database.js',
    './src/27transaction.js',
    './src/29resultset.js',
   	'./src/90finish.js',
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
