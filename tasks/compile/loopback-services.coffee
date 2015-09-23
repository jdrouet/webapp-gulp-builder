coffee        = require 'gulp-coffee'
concat        = require 'gulp-concat'
gif           = require 'gulp-if'
gutil         = require 'gulp-util'
lbService     = require 'gulp-loopback-sdk-angular'
livereload    = require 'gulp-livereload'
ngAnnotate    = require 'gulp-ng-annotate'
plumber       = require 'gulp-plumber'
rename        = require 'gulp-rename'
replace       = require 'gulp-replace'
sourcemaps    = require 'gulp-sourcemaps'
uglify        = require 'gulp-uglify'

module.exports = (gulp, config) ->

  gulp.task 'compile:loopback', ->
    return if not config.input.loopback.enabled
    gulp.src config.input.loopback.server
    .pipe plumber()
    .on 'error', gutil.log
    .pipe lbService
      apiUrl: config.input.loopback.url
      ngModuleName: config.output.loopback.module
    .pipe gif config.minify, uglify()
    .pipe sourcemaps.init()
    .pipe sourcemaps.write()
    .pipe rename config.output.loopback.filename
    .pipe gif config.loopback.prefix, replace('$LoopBack$', config.loopback.prefix)
    .pipe gulp.dest config.output.loopback.path
    .pipe livereload()
