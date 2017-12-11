gutil         = require 'gulp-util'
gif           = require 'gulp-if'
htmlmin       = require 'gulp-htmlmin'
jade          = require 'gulp-jade'
livereload    = require 'gulp-livereload'
plumber       = require 'gulp-plumber'
replace       = require 'gulp-replace-task'
sourcemaps    = require 'gulp-sourcemaps'
templateCache = require 'gulp-angular-templatecache'
rev           = require 'gulp-rev'

module.exports = (gulp, config) ->
  gulp.task 'compile:template', ->
    gulp.src config.input.template
    .on 'error', gutil.log
    .pipe plumber()
    .pipe gif config.input.replace.enabled, replace config.input.replace
    .pipe jade
      doctype: 'html'
      pretty: not config.minify
    .pipe gif config.minify, htmlmin
      collapseWhitespace: true
      removeComments: true
    .pipe templateCache
      filename: config.output.template.filename
      module: config.output.template.module
      standalone: true
    .pipe sourcemaps.init()
    .pipe sourcemaps.write()
    .pipe rev()
    .pipe gulp.dest config.output.script
    .pipe rev.manifest({
      base: config.output.path,
      path: config.output.path + '/rev-manifest.json',
      merge: true
    })
    .pipe gulp.dest config.output.path
    .pipe livereload()
