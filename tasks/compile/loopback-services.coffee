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
rev           = require 'gulp-rev'

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
    .pipe gif config.input.loopback.prefix?.replace, replace('$LoopBack$', config.input.loopback.prefix.with)
    .pipe rev()
    .pipe gulp.dest config.output.loopback.path
    .pipe rev.manifest({
      base: config.output.path,
      path: config.output.path + '/rev-manifest.json',
      merge: true
    })
    .pipe gulp.dest config.output.path
    .pipe livereload()
