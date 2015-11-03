module.exports = (gulp, config) ->
  require('./coffee-script.coffee') gulp, config
  require('./jade.coffee') gulp, config
  require('./template.coffee') gulp, config
  require('./vendor.coffee') gulp, config

  tasks = [
    'compile:coffee'
    'compile:jade'
    'compile:template'
    'compile:vendor'
  ]

  if config.input?.less?.enabled
    require('./less.coffee') gulp, config
    tasks.push 'compile:less'

  if config.input?.sass?.enabled
    require('./sass.coffee') gulp, config
    tasks.push 'compile:sass'

  if config.input?.loopback?.enabled
    require('./loopback-services.coffee') gulp, config
    tasks.push 'compile:loopback'

  gulp.task 'compile', tasks
