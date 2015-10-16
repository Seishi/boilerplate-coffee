##################################################
# 任务描述：建立简单的服务器并监听文件改动
##################################################

module.exports = (gulp, opts, config, $) ->
  gulp.task 'serve', $.sequence 'compile', 'browserSync'