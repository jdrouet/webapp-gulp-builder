del           = require 'del'
vinylPaths    = require 'vinyl-paths'

module.exports = (gulp, config) ->
  gulp.task 'clean', ->
    gulp.src config.output.path
    .pipe vinylPaths del
