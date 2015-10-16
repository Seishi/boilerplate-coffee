##############################
# 任务描述：清理文件
##############################

rimraf = require('rimraf')

module.exports = (gulp, opts, config) ->
  gulp.task 'clean', (cb) ->
    rimraf (if opts.p then config.paths.dist else config.paths.public), cb