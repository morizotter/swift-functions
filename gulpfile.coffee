gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
haml        = require 'gulp-ruby-haml'
sass        = require 'gulp-sass'
inject      = require 'gulp-inject'
watch       = require 'gulp-watch'
runSequence = require 'run-sequence'
series      = require 'stream-series'
webserver   = require 'gulp-webserver'
del         = require 'del'

gulp.task 'coffee', () ->
  gulp.src 'src/**/*.coffee'
  .pipe coffee()
  .pipe gulp.dest('.tmp/')

gulp.task 'haml', ->
  gulp.src "src/**/*.haml"
  .pipe haml({ doubleQuote: true })
  .pipe gulp.dest ".tmp"

gulp.task 'sass', () ->
  gulp.src 'src/scss/**/*.scss'
  .pipe sass()
  .pipe gulp.dest '.tmp/css'

gulp.task 'copy', () ->
  gulp.src [".functions/*.html"]
  .pipe gulp.dest '.tmp/functions'
  gulp.src ["src/i18n/*.json"]
  .pipe gulp.dest '.tmp/i18n'
  gulp.src [
    "bower_components/angular-translate/angular-translate.min.js"
    "bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.min.js"
    ]
  .pipe gulp.dest '.tmp/libs'

gulp.task 'del:tmp', ->
  del.sync [".tmp/**/*"]

gulp.task 'inject', ->
  css         = gulp.src ".tmp/angular/**/*.css" , {read: false}
  js          = gulp.src ".tmp/angular/**/*.js" , {read: false}
  angular     = {
    translate: gulp.src ".tmp/libs/angular-translate.min.js", {read: false}
    translateStaticLoader: gulp.src ".tmp/libs/angular-translate-loader-static-files.min.js", {read: false}
  }

  gulp.src ".tmp/**/*.html"
  .pipe inject(
    series(
      css,
      angular.translate,
      angular.translateStaticLoader,
      js
    ), {relative: true}
  )
  .pipe gulp.dest ".tmp"

gulp.task('webserver', ->
  gulp.src('.tmp')
  .pipe(webserver({
    livereload: true
    port: 9000
    fallback: '.tmp/index.html'
    open: true
    }))
  )

gulp.task 'build', -> runSequence(
  ['del:tmp']
  ['coffee', 'haml', 'sass'],
  ['copy'],
  ['inject']
)

gulp.task 'watch', ->
  gulp.watch ['src/**/*'], ['build']

##################################################
# SERVE
##################################################

gulp.task 'serve', ['build'], ->
  runSequence(
    ['webserver'],
    ['watch']
    )
