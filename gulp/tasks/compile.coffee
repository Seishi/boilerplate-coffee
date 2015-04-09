##################################################
# 任务描述：生成静态网页
##################################################

module.exports = (gulp, opts, $) ->
  gulp.task 'compile', [
    'browserify'
    'stylus',
    'markup',
    'assets',
    'generate'
  ]