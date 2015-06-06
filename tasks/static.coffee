livereload    = require 'gulp-livereload'
plumber       = require 'gulp-plumber'

module.exports = (gulp, config) ->
  gulp.task 'static', ->
    for type of config.input.static
      if type of config.output.static
        gulp.src config.input.static[type]
        .pipe plumber()
        .pipe gulp.dest config.output.static[type]
        .pipe livereload()
