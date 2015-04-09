##################################################
# 任务描述：监听文件改动
##################################################

module.exports = (gulp, opts, config, $) ->
  gulp.task 'watch', ['serve'], ->
    # 监听stylus文件
    gulp.watch config.stylus.src, ['stylus']

    # 监听jade文件
    gulp.watch config.markup.src, ['markup']

    # 监听公用数据文件
    gulp.watch config.data, ['markupAll', 'generate']

    # 监听coffee文件
    gulp.watch config.paths.assets + "/**/*.coffee", ['test']

    # 监听测试文件
    gulp.watch config.test.unit.concat config.test.e2e, ['test']

    # 监听脚本打包配置文件
    gulp.watch config.browserify.files, ['browserify']