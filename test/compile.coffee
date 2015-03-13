browserify = require 'browserify'
source = require 'vinyl-source-stream'
gulp = require 'gulp'

handler = require '../src/index.coffee'

bundler = browserify()
bundler.require './index.js'


bundler.bundle()
	.pipe handler('../bower_components/requirejs/require.js')
	.pipe source 'bundle.js'
	.pipe gulp.dest '../dist'




