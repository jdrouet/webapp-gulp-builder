autoprefixer  = require 'gulp-autoprefixer'
gif           = require 'gulp-if'
gutil         = require 'gulp-util'
sass          = require 'gulp-sass'
livereload    = require 'gulp-livereload'
minifyCss     = require 'gulp-minify-css'
path          = require 'path'
plumber       = require 'gulp-plumber'

module.exports = (gulp, config) ->
  gulp.task 'compile:sass', ->
    gulp.src config.input.sass.main
    .pipe plumber()
    .on 'error', gutil.log
    .pipe sass()
    .pipe autoprefixer
      browsers: ['last 2 versions', 'Firefox >= 24', 'ie >= 11']
      cascade: false
    .pipe gif config.minify, minifyCss()
    .pipe gulp.dest config.output.sass
    .pipe livereload()
