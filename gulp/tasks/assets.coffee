##################################################
# 任务描述：复制资源文件到目标目录
##################################################

browserSync = require('browser-sync')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'assets', ->
    gulp.src config.assets.src
      .pipe gulp.dest if opts.p then config.assets.dist else config.assets.public
      .pipe browserSync.reload stream: true, once: true
