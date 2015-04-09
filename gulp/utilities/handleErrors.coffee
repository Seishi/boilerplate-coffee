##################################################
# 错误处理
##################################################

gutil = require('gulp-util')

module.exports = (err) ->
  gutil.beep()
  gutil.log err.toString()

  this.emit("end")
  return