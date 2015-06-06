concat          = require 'gulp-concat'
filter          = require 'gulp-filter'
gif             = require 'gulp-if'
gulp            = require 'gulp'
gutil           = require 'gulp-util'
livereload      = require 'gulp-livereload'
mainBowerFiles  = require 'main-bower-files'
plumber         = require 'gulp-plumber'
sourcemaps      = require 'gulp-sourcemaps'
uglify          = require 'gulp-uglify'

module.exports = (gulp, config) ->
  gulp.task 'compile:vendor', ->
    gulp.src mainBowerFiles()
    .pipe plumber()
    .on 'error', gutil.log
    .pipe filter '**/*.js'
    .pipe concat config.output.vendor
    .pipe gif config.minify, uglify()
    .pipe sourcemaps.init()
    .pipe sourcemaps.write()
    .pipe gulp.dest config.output.script
    .pipe livereload()
