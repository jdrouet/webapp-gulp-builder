livereload      = require 'gulp-livereload'

module.exports = (gulp, config) ->

  gulp.task 'watch', ['lint', 'compile', 'static'], ->
    if config.livereload
      livereload.listen
        basePath: config.output.path
        reloadPage: "#{config.output.path}/index.html"
        start: true
    gulp.watch config.input.coffee, ['compile:coffee', 'lint:coffee']
    if config.input?.less?.enabled
      gulp.watch config.input.less.watch, ['compile:less']
    if config.input?.sass?.enabled
      gulp.watch config.input.sass.watch, ['compile:sass']
    gulp.watch config.input.jade, ['compile:jade']
    gulp.watch config.input.template, ['compile:template']
    gulp.watch config.input.vendor.watch, ['compile:vendor']
    if config.input?.loopback?.enabled
      gulp.watch config.input.loopback.watch, ['compile:loopback']
    statics = []
    for key, value of config.input.static
      statics = statics.concat value
    gulp.watch statics, ['static']
