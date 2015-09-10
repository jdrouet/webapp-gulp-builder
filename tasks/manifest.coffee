manifest      = require 'gulp-manifest'
plumber       = require 'gulp-plumber'
gif           = require 'gulp-if'
replace       = require 'gulp-replace'

module.exports = (gulp, config) ->
  gulp.task 'manifest', ->
    gulp.src config.input.manifest.source
    .pipe gif config.input.manifest.enabled, manifest config.input.manifest.settings
    .pipe replace new RegExp('\/%20', 'g'), '/ ' # Fix spaces escaping in fallback
    .pipe gulp.dest config.output.manifest
