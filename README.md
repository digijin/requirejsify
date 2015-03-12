# RequireJSify

So you've started using Browserify... great! You're using bundler.require to expose some modules for dynamic requiring and it all makes sense, until you realise there's requireJS modules on the page that you can't edit... browserify's require is clashing with requireJS's require and you want to use them interchangeably.

Example:
```javascript
CommonJSModule = require('myBrowserifyModule'); //browserify
require(['myRequireJSModule'], function(AMDModule){
	//requireJS
})
```

RequireJSify takes the output from browserify and a requireJS library and uses the different require function signatures to determine whether a require call is intended to be Browserify or RequireJS

Example node build script:
```javascript
browserify = require('browserify');
requirejsify = require('requirejsify')
bundler = browserify({entries: ['./myFile.js']})
bundler.bundle()
    .pipe(requirejsify('./bower_components/requirejs/requirejs.js'))
```

