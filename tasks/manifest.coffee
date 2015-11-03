manifest      = require 'gulp-manifest'
replace       = require 'gulp-replace'

module.exports = (gulp, config) ->
  gulp.task 'manifest', ->
    return if not config?.input?.manifest?.enabled
    gulp.src config.input.manifest.source
    .pipe manifest config.input.manifest.settings
    .pipe replace new RegExp('\/%20', 'g'), '/ '# Fix spaces escaping in fallback
    .pipe gulp.dest config.output.manifest
