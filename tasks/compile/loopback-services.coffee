config        = require '../../../gulp.config.coffee'

coffee        = require 'gulp-coffee'
concat        = require 'gulp-concat'
gif           = require 'gulp-if'
gulp          = require 'gulp'
gutil         = require 'gulp-util'
lbService     = require 'gulp-loopback-sdk-angular'
ngAnnotate    = require 'gulp-ng-annotate'
rename        = require 'gulp-rename'
sourcemaps    = require 'gulp-sourcemaps'
uglify        = require 'gulp-uglify'

gulp.task 'compile:loopback', ->
  return if not config.input.loopback.enabled
  gulp.src config.input.loopback.server
  .on 'error', gutil.log
  .pipe lbService
    apiUrl: config.input.loopback.url
    ngModuleName: config.output.loopback.module
  .pipe uglify()
  .pipe sourcemaps.init()
  .pipe sourcemaps.write()
  .pipe rename config.output.loopback.filename
  .pipe gulp.dest config.output.loopback.path
