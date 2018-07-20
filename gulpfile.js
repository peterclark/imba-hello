var gulp    = require('gulp');
var stylus  = require('gulp-stylus');
var pug     = require('gulp-pug');
var imba    = require('gulp-imba');
var browser = require('browser-sync').create();

// Compile Stylus to CSS
gulp.task('css', function() {
  return gulp.src('./app/*.styl')
    .pipe(stylus({
      compress: true
    }))
    .pipe(gulp.dest('./dist'))
});

// Compile Pug to HTML
gulp.task('html', function() {
  return gulp.src('./app/*.pug')
    .pipe(pug({
      // options
    }))
    .pipe(gulp.dest('./dist'))
});

// Live reload
gulp.task('browser', function() {
  browser.init({
    server: {
      baseDir: 'dist'
    },
  })
})

gulp.task('watch', ['browser'], function(){
  gulp.watch('./app/*.styl', ['css']);
  gulp.watch('./app/*.pug', ['html']);
  gulp.watch('./dist/*.html', browser.reload);
  gulp.watch('./dist/*.js', browser.reload);
})