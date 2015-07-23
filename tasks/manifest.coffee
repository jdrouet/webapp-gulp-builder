manifest      = require 'gulp-manifest'
plumber       = require 'gulp-plumber'
gif           = require 'gulp-if'

module.exports = (gulp, config) ->
  gulp.task 'manifest', ->
    gulp.src config.input.manifest.source
    .pipe gif config.input.manifest.enabled, manifest config.input.manifest.settings
    .pipe gulp.dest config.output.manifest
