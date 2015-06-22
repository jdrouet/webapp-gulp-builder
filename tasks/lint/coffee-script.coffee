coffee        = require 'gulp-coffee'
coffeelint    = require 'gulp-coffeelint'
gif           = require 'gulp-if'
plumber       = require 'gulp-plumber'

module.exports = (gulp, config) ->
  gulp.task 'lint:coffee', ->
    gulp.src config.input.coffee
    .pipe gif config.lint, coffeelint()
    .pipe gif config.lint, coffeelint.reporter()
