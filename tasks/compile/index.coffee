module.exports = (gulp, config) ->
  require('./coffee-script.coffee') gulp, config
  require('./jade.coffee') gulp, config
  require('./less.coffee') gulp, config
  require('./sass.coffee') gulp, config
  require('./loopback-services.coffee') gulp, config
  require('./template.coffee') gulp, config
  require('./vendor.coffee') gulp, config

  tasks = [
    'compile:coffee'
    'compile:jade'
    'compile:template'
    'compile:vendor'
  ]
  tasks.push 'compile:less' if config.input?.less?.enabled
  tasks.push 'compile:sass' if config.input?.sass?.enabled
  tasks.push 'compile:loopback' if config.input?.loopback?.enabled

  gulp.task 'compile', tasks
