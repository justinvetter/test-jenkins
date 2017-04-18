var gulp = require('gulp')
var plugin = require('gulp-load-plugins')();


gulp.task('sass', function () {
  return gulp.src('./src/styles/main.scss')
    .pipe(plugin.sass({
      outputStyle: 'nester',
      includePaths: ['.']
    }))
    .pipe(gulp.dest('./dist/styles'))
});


gulp.task('default', ['sass'], function () {
  return gulp.src('./src/index.html')
    .pipe(gulp.dest('./dist'))
})
