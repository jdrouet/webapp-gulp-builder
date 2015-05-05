gulp          = require 'gulp'
requireDir    = require 'require-dir'

requireDir './tasks'

#
#
# gutil         = require('gulp-util')
# coffee        = require 'gulp-coffee'
# bower         = require('bower')
# path          = require 'path'
# less          = require 'gulp-less'
# jade          = require 'gulp-jade'
# concat        = require('gulp-concat')
# filter        = require 'gulp-filter'
# uglify        = require 'gulp-uglify'
# sass          = require('gulp-sass')
# mainBower     = require 'main-bower-files'
# minifyCss     = require('gulp-minify-css')
# templateCache = require 'gulp-angular-templatecache'
# ngAnnotate    = require 'gulp-ng-annotate'
# rename        = require('gulp-rename')
# sh            = require('shelljs')
# del           = require 'del'
# lbService     = require 'gulp-loopback-sdk-angular'
# vinylPaths    = require('vinyl-paths')
#
# gulp.task 'compile', [
#   'compile:jade'
#   'compile:style'
#   'compile:js'
#   'compile:static'
#   'compile:templates'
# ]
#
# gulp.task 'compile:static', ->
#   gulp.src [
#     paths.input + '/static/*'
#     paths.input + '/static/**/*'
#   ]
#   .pipe gulp.dest paths.output + '/static'
#   for custom in customStatic
#     gulp.src custom.source
#     .pipe gulp.dest paths.output + custom.destination
#
# gulp.task 'compile:jade', ->
#   gulp.src paths.input + '/*.jade'
#   .pipe jade pretty: true
#   .pipe gulp.dest paths.output
#   .on 'error', gutil.log
#
# gulp.task 'compile:style', [
#   'compile:style:fonts'
#   'compile:style:less'
# ]
#
# gulp.task 'compile:style:fonts', ->
#   for input_path in paths.fonts.input
#     gulp.src input_path + '/*'
#     .pipe gulp.dest paths.output + '/style/fonts'
#
# gulp.task 'compile:style:less', ->
#   gulp.src paths.input + '/style/main.less'
#   .pipe less paths: [ path.join(__dirname) ]
#   .pipe gulp.dest paths.output + '/style'
#   .on 'error', gutil.log
#
# gulp.task 'compile:js', [
#   'compile:js:vendors'
#   'compile:js:coffee'
#   'compile:js:lb-services'
# ]
#
# gulp.task 'compile:js:vendors', ->
#   gulp.src mainBower()
#   .pipe filter '**/*.js'
#   .pipe concat 'vendor.js'
#   .pipe gulp.dest paths.output + '/js'
#   .on 'error', gutil.log
#
# gulp.task 'compile:js:lb-services', ->
#   gulp.src paths.backend
#   .pipe lbService apiUrl: uri.back
#   # .pipe uglify()
#   .pipe rename 'lb-services.js'
#   .pipe gulp.dest paths.output + '/js'
#   .on 'error', gutil.log
#
# gulp.task 'compile:js:coffee', ->
#   gulp.src [
#     paths.input + '/*.coffee'
#     paths.input + '/**/*.coffee'
#   ]
#   .pipe coffee bare: true
#   .pipe ngAnnotate()
#   # .pipe uglify()
#   .pipe concat paths.js.main_file
#   .pipe gulp.dest paths.output + '/js'
#   .on 'error', gutil.log
#
# gulp.task 'compile:templates', ->
#   gulp.src paths.input + '/**/*.jade'
#   .pipe jade doctype: 'html'
#   .pipe templateCache
#     filename: templates.filename
#     module: templates.module
#     standalone: true
#   .pipe gulp.dest paths.output + '/js'
#   .on 'error', gutil.log
#
# gulp.task 'default', [ 'compile' ]
#
# gulp.task 'watch', ['compile'], ->
#   gulp.watch [ paths.input + '/static/*', paths.input + '/static/**/*' ], [ 'compile:static' ]
#   gulp.watch [ paths.input + '/*.coffee', paths.input + '/**/*.coffee' ], [ 'compile:js:coffee' ]
#   gulp.watch [ paths.input + '/*.js', paths.input + '/**/*.js' ], [ 'compile:js' ]
#   gulp.watch [ paths.input + '/**/*.less' ], [ 'compile:style:less' ]
#   gulp.watch [ paths.input + '/**/*.jade' ], [ 'compile:templates' ]
#   gulp.watch [ paths.input + '/*.jade' ], [ 'compile:jade' ]
#   gulp.watch [ '../common/**/*' ], [ 'compile:js:lb-services' ]
#
# gulp.task 'install', [ 'git-check' ], ->
#   bower.commands.install().on 'log', (data) ->
#     return gutil.log 'bower', gutil.colors.cyan(data.id), data.message
#
# gulp.task 'git-check', (done) ->
#   if !sh.which('git')
#     console.log '  ' + gutil.colors.red('Git is not installed.'), '\n  Git, the version control system, is required to download Ionic.', '\n  Download git here:', gutil.colors.cyan('http://git-scm.com/downloads') + '.', '\n  Once git is installed, run \'' + gutil.colors.cyan('gulp install') + '\' again.'
#     process.exit 1
#   done()
