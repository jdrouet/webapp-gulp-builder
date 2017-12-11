module.exports = (gulp, config) ->
  require('./compile') gulp, config
  require('./lint') gulp, config
  require('./clean.coffee') gulp, config
  require('./replace.coffee') gulp, config
  require('./manifest.coffee') gulp, config
  require('./default.coffee') gulp, config
  require('./static.coffee') gulp, config
  require('./watch.coffee') gulp, config
