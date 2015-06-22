module.exports = (gulp, config) ->
  require('./coffee-script.coffee') gulp, config

  gulp.task 'lint', [
    'lint:coffee'
  ]
