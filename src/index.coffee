t2 = require 'through2'

module.exports = ()->
	started = false;
	# allData = ''
	t2.obj((data, enc, cb) ->
			unless started
				started = @push 'browserify_'
			@push data
			cb()
		,
			(cb) ->
				@push ';require = function(){return browserify_require()}'
				cb()
		)