##################################################
# 任务描述：从_data.json文件和jade文件
# 中重新读取数据并编译全部文件
##################################################

handleErrors = require('../utilities/handleErrors')
browserSync = require('browser-sync')
getData = require('../utilities/getData')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'markupAll', ->
    gulp.src config.markup.src
      .pipe $.ignore.exclude config.markup.excluded
      .pipe $.plumber errorHandler: handleErrors
      .pipe $.data getData
      .pipe $.jade()
      .pipe gulp.dest config.markup.public
      .pipe $.filter '**/*.html'
      .pipe browserSync.reload stream: true, once: true