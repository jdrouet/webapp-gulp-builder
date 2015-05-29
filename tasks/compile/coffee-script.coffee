config        = require "#{process.env.PWD}/gulp.config.coffee"

coffee        = require 'gulp-coffee'
concat        = require 'gulp-concat'
gif           = require 'gulp-if'
gulp          = require 'gulp'
gutil         = require 'gulp-util'
ngAnnotate    = require 'gulp-ng-annotate'
replace       = require 'gulp-replace-task'
sourcemaps    = require 'gulp-sourcemaps'
uglify        = require 'gulp-uglify'

module.exports = (gulp, config) ->
  gulp.task 'compile:coffee', ->
    gulp.src config.input.coffee
    .on 'error', gutil.log
    .pipe gif config.input.replace.enabled, replace config.input.replace
    .pipe coffee
      bare: true
    .pipe ngAnnotate()
    .pipe gif config.minify, uglify()
    .pipe concat config.output.application
    .pipe sourcemaps.init()
    .pipe sourcemaps.write()
    .pipe gulp.dest config.output.script
