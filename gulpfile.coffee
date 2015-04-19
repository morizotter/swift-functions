gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
haml        = require 'gulp-ruby-haml'
sass        = require 'gulp-sass'
inject      = require 'gulp-inject'
watch       = require 'gulp-watch'
runSequence = require 'run-sequence'
series      = require 'stream-series'
webserver   = require 'gulp-webserver'

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
  .pipe gulp.dest('.tmp/css')

gulp.task 'copy', () ->
  gulp.src [".functions/*.html"]
  .pipe gulp.dest '.tmp/functions'

gulp.task 'inject', ->
  css         = gulp.src(".tmp/**/*.css" , {read: false})
  js          = gulp.src(".tmp/**/*.js" , {read: false})

  gulp.src ".tmp/**/*.html"
  .pipe inject(
    series(
      css,
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
