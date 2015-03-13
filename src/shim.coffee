#browserify_require and require should be defined

amd_require = require

require = ->
	if arguments.length is 1
		browserify_require arguments[0]
	else
		amd_require.apply @, arguments

for key of amd_require 
	require[key] = amd_require[k]