t2 = require 'through2'
fs = require 'fs'
coffee = require 'coffee-script'


module.exports = (requirejs)->
	started = false;
	# allData = ''

	req = fs.readFileSync requirejs
	shim = fs.readFileSync '../src/shim.js'

	t2.obj((data, enc, cb) ->
			unless started
				started = @push 'browserify_'
			@push data
			cb()
		,
			(cb) ->
				@push req
				@push shim
				cb()
		)