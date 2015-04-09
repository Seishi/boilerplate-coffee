##################################################
# 任务描述：自动刷新浏览器
##################################################

browserSync = require('browser-sync')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'browserSync', ->
    browserSync config.browserSync