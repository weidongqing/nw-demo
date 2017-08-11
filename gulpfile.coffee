gulp = require 'gulp'
coffee =require 'gulp-coffee'
jade = require 'gulp-jade'


source =
  main: 'coffee/app.coffee'
  coffee: [
    './coffee/controller/*.coffee'
  ]
  jade:[
    './jade/*.jade'
  ]

dist_source=
  html: './view/*.html'
  css: './css/*.css'
  js: './dist/*.js'

gulp.task 'coffee' ->
  
