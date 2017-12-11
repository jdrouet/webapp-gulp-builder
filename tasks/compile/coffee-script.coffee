coffee        = require 'gulp-coffee'
concat        = require 'gulp-concat'
gif           = require 'gulp-if'
gutil         = require 'gulp-util'
livereload    = require 'gulp-livereload'
ngAnnotate    = require 'gulp-ng-annotate'
order         = require 'gulp-order'
plumber       = require 'gulp-plumber'
replace       = require 'gulp-replace-task'
sourcemaps    = require 'gulp-sourcemaps'
uglify        = require 'gulp-uglify'
rev           = require 'gulp-rev'

module.exports = (gulp, config) ->
  gulp.task 'compile:coffee', ->
    gulp.src config.input.coffee
    .pipe plumber()
    .on 'error', gutil.log
    .pipe gif config.input.replace.enabled, replace config.input.replace
    .pipe coffee(config.coffee)
    .pipe ngAnnotate(config.ngAnnotate)
    .pipe gif config.minify, uglify(config.uglify)
    .pipe order config.input.order or ['*']
    .pipe concat config.output.application
    .pipe sourcemaps.init()
    .pipe sourcemaps.write()
    .pipe rev()
    .pipe gulp.dest config.output.script
    .pipe rev.manifest({
      base: config.output.path,
      path: config.output.path + '/rev-manifest.json',
      merge: true
    })
    .pipe gulp.dest config.output.path
    .pipe livereload()
