##################################################
# 任务描述：从_data.json文件和jade文件中取得数据并编译
##################################################

deepmerge = require('deepmerge')
handleErrors = require('../utilities/handleErrors')
browserSync = require('browser-sync')
getData = require('../utilities/getData')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'markup', ->
    gulp.src config.markup.src
      .pipe if opts.p then $.util.noop() else $.cached 'jade', optimizeMemory: true
      .pipe if opts.p then $.util.noop() else $.progeny()
      .pipe $.ignore.exclude config.markup.excluded
      .pipe $.plumber errorHandler: handleErrors
      .pipe $.data (file) ->
        deepmerge getData(file), environment: if opts.p then 'production' else 'development'
      .pipe if opts.p then $.jade pretty: '  ' else $.jade()
      .pipe gulp.dest if opts.p then config.markup.dist else config.markup.public
      .pipe if opts.p then $.util.noop() else $.filter '**/*.html'
      .pipe if opts.p then $.util.noop() else browserSync.reload stream: true, once: true