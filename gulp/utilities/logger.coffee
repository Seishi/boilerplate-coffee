##################################################
# 输出gulp形式的日志
##################################################

gutil = require('gulp-util')
prettyHrtime = require('pretty-hrtime')
startTime = undefined

module.exports =
  start: (filePath, processPoint) ->
    startTime = process.hrtime()
    gutil.log processPoint, gutil.colors.green filePath, '...'

  end: (filePath, processPoint) ->
    taskTime = process.hrtime startTime
    prettyTime = prettyHrtime taskTime
    gutil.log processPoint, gutil.colors.green filePath, 'in', gutil.colors.magenta prettyTime