coffee        = require 'gulp-coffee'
concat        = require 'gulp-concat'
gif           = require 'gulp-if'
gutil         = require 'gulp-util'
livereload    = require 'gulp-livereload'
ngAnnotate    = require 'gulp-ng-annotate'
plumber       = require 'gulp-plumber'
replace       = require 'gulp-replace-task'
sourcemaps    = require 'gulp-sourcemaps'
uglify        = require 'gulp-uglify'

module.exports = (gulp, config) ->
  gulp.task 'compile:coffee', ->
    gulp.src config.input.coffee
    .pipe plumber()
    .on 'error', gutil.log
    .pipe gif config.input.replace.enabled, replace config.input.replace
    .pipe coffee
      bare: true
    .pipe ngAnnotate
      remove: false
      add: true
      single_quotes: true
    .pipe gif config.minify, uglify()
    .pipe concat config.output.application
    .pipe sourcemaps.init()
    .pipe sourcemaps.write()
    .pipe gulp.dest config.output.script
    .pipe livereload()
