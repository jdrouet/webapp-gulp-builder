del           = require 'del'
plumber       = require 'gulp-plumber'
vinylPaths    = require 'vinyl-paths'

module.exports = (gulp, config) ->
  gulp.task 'clean', ->
    gulp.src config.output.path
    .pipe plumber()
    .pipe vinylPaths del
