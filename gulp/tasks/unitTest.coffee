##################################################
# 任务描述：单元测试
##################################################

handleErrors = require('../utilities/handleErrors')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'unitTest', ->
    gulp.src config.test.unit
      .pipe $.plumber errorHandler: handleErrors
      .pipe $.mocha reporter: 'spec'