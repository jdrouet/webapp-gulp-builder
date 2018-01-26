manifest      = require 'gulp-manifest'

module.exports = (gulp, config) ->
  gulp.task 'default', (done) ->
    sequence      = require('run-sequence').use gulp
    sequence ['lint', 'compile', 'static'], 'manifest', 'replace', ->
      if config.input.loopback.enabled
        # To close database with loopback
        process.exit 0
      done()
