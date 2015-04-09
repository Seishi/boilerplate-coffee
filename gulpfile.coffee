# gulp 任务

args = require('yargs').argv
gulp = require('gulp')
$ = require('gulp-load-plugins')()
config = require('./gulp/config')
opts =
  p: args.p

require('./gulp/tasks/stylus')(gulp, opts, config, $)
require('./gulp/tasks/markup')(gulp, opts, config, $)
require('./gulp/tasks/markupAll')(gulp, opts, config, $)
require('./gulp/tasks/browserify')(gulp, opts, config, $)
require('./gulp/tasks/browserSync')(gulp, opts, config, $)
require('./gulp/tasks/assets')(gulp, opts, config, $)
require('./gulp/tasks/compile')(gulp, opts, $)
require('./gulp/tasks/collect')(gulp, opts, config, $)
require('./gulp/tasks/generate')(gulp, opts, config, $)
require('./gulp/tasks/unitTest')(gulp, opts, config, $)
require('./gulp/tasks/test')(gulp)
require('./gulp/tasks/serve')(gulp, opts, config, $)
require('./gulp/tasks/watch')(gulp, opts, config, $)
require('./gulp/tasks/clean')(gulp, opts, config)
require('./gulp/tasks/default')(gulp)