##################################################
# 任务描述：生成集合页面
##################################################

browserSync = require('browser-sync')

module.exports = (gulp, opts, config , $) ->
  gulp.task 'generate', ['collect'], ->
    gulp.src config.collection.src
      .pipe $.jade
        data: global.collection
      .pipe gulp.dest if opts.p then config.collection.dist else config.collection.public
      .pipe if opts.p then $.util.noop() else $.filter '**/*.html'
      .pipe if opts.p then $.util.noop() else browserSync.reload stream: true, once: true
