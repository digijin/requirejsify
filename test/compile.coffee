gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'

through2 = require 'through2'

handler = require '../src/index.coffee'

bundler = browserify()
bundler.require './index.js'


bundler.bundle()
	.pipe handler()
	.pipe source 'bundle.js'
	.pipe gulp.dest '../dist'




