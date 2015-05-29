jade          = require 'gulp-jade'
gif           = require 'gulp-if'
gutil         = require 'gulp-util'
replace       = require 'gulp-replace-task'

module.exports = (gulp, config) ->
  gulp.task 'compile:jade', ->
    gulp.src config.input.jade
    .on 'error', gutil.log
    .pipe gif config.input.replace.enabled, replace config.input.replace
    .pipe jade
      pretty: not config.minify
    .pipe gulp.dest config.output.path
