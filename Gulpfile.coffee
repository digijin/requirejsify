gulp = require 'gulp'
cof = require 'gulp-coffee'

gulp.task 'default', ['coffee']

gulp.task 'coffee', ->
	gulp.src './src/*.coffee'
		.pipe cof()
		.pipe gulp.dest './dist'