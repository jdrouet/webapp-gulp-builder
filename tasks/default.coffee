module.exports = (gulp, config) ->
  gulp.task 'default', ['lint', 'compile', 'static'], ->
    if config.input.loopback.enabled
      # To close database with loopback
      process.exit 0
