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
ghPages     = require 'gulp-gh-pages'

gulp.task 'coffee', () ->
  gulp.src 'src/**/*.coffee'
  .pipe coffee()
  .pipe gulp.dest('.tmp/')

gulp.task 'haml', ->
  gulp.src "src/**/*.haml"
  .pipe haml({ doubleQuote: true })
  .pipe gulp.dest ".tmp"

gulp.task 'sass', () ->
  gulp.src 'src/**/*.scss'
  .pipe sass()
  .pipe gulp.dest '.tmp'

gulp.task 'copy', () ->
  gulp.src [".functions/*.html"]
  .pipe gulp.dest '.tmp/functions'
  gulp.src ["src/l10n/*.json"]
  .pipe gulp.dest '.tmp/l10n'
  gulp.src ["src/images/**/*"]
  .pipe gulp.dest '.tmp/images'
  gulp.src ["src/*.ico"]
  .pipe gulp.dest '.tmp'
  gulp.src [
    "bower_components/angular/angular.min.js"
    "bower_components/angular/angular.min.js.map"
    "bower_components/angular-translate/angular-translate.min.js"
    "bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.min.js"
    "bower_components/angular-translate-storage-local/angular-translate-storage-local.min.js"
    "bower_components/bootstrap/dist/css/bootstrap.min.css"
    "bower_components/bootstrap/dist/css/bootstrap-theme.min.css"
    "bower_components/bootstrap/dist/js/bootstrap.min.js"
    "bower_components/jquery/dist/jquery.min.js"
    "bower_components/jquery/dist/jquery.min.map"
    "bower_components/underscore/underscore-min.js"
    "bower_components/underscore/underscore-min.map"
    "bower_components/angular-ui-router/release/angular-ui-router.min.js"
    ]
  .pipe gulp.dest '.tmp/lib'

gulp.task 'del:tmp', ->
  del.sync [".tmp/**/*"]

gulp.task 'inject', ->
  css         = {
    bootstrap: gulp.src ".tmp/lib/bootstrap.min.css", {read: false}
    bootstrapTheme: gulp.src ".tmp/lib/bootstrap-theme.min.css", {read: false}
    application: gulp.src ".tmp/scss/*.css", {read: false}
    files: gulp.src ".tmp/app/**/*.css", {read: false}
  }
  js          = {
    jquery: gulp.src ".tmp/lib/jquery.min.js", {read: false}
    underscore: gulp.src ".tmp/lib/underscore-min.js", {read: false}
    bootstrap: gulp.src ".tmp/lib/bootstrap.min.js", {read: false}
  }
  angular     = {
    angular: gulp.src ".tmp/lib/angular.min.js", {read: false}
    translate: gulp.src ".tmp/lib/angular-translate.min.js", {read: false}
    translateStaticLoader: gulp.src ".tmp/lib/angular-translate-loader-static-files.min.js", {read: false}
    translateStorageLocal: gulp.src ".tmp/lib/angular-translate-storage-local.min.js", {read: false}
    router: gulp.src ".tmp/lib/angular-ui-router.min.js", {read: false}
    files: gulp.src ".tmp/app/**/*.js", {read: false}
  }

  gulp.src ".tmp/**/*.html"
  .pipe inject(
    series(
      css.bootstrap,
      css.bootstrapTheme,
      css.application,
      css.files,
      js.jquery,
      js.underscore,
      js.bootstrap,
      angular.angular,
      angular.translate,
      angular.translateStaticLoader,
      angular.translateStorageLocal,
      angular.router,
      angular.files
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

##################################################
# DEPLOY
##################################################

gulp.task 'deploy', ->
  gulp.src '.tmp/**/*'
  .pipe ghPages()
