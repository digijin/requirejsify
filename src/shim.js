amd_require = require;

require = function() {
  if (arguments.length === 1) {
    return browserify_require(arguments[0]);
  } else {
    return amd_require.apply(this, arguments);
  }
};

for (key in amd_require) {
  require[key] = amd_require[key];
}