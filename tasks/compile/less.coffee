autoprefixer  = require 'gulp-autoprefixer'
gif           = require 'gulp-if'
gutil         = require 'gulp-util'
less          = require 'gulp-less'
livereload    = require 'gulp-livereload'
cssnano       = require 'gulp-cssnano'
path          = require 'path'
plumber       = require 'gulp-plumber'

module.exports = (gulp, config) ->
  gulp.task 'compile:less', ->
    gulp.src config.input.less.main
    .pipe plumber()
    .on 'error', gutil.log
    .pipe less paths: [ path.join(__dirname) ]
    .pipe autoprefixer
      browsers: ['last 2 versions', 'Firefox >= 24', 'ie >= 11']
      cascade: false
    .pipe gif config.minify, cssnano(config.cssnano)
    .pipe gulp.dest config.output.less
    .pipe livereload()
