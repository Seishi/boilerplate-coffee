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

    # 监听集合页面
    gulp.watch config.collection.src, ['generate']

    # 监听coffee文件
    gulp.watch config.paths.assets + "/**/*.coffee", ['test']

    # 监听单元测试文件
    gulp.watch config.test.unit, ['unitTest']

    # 监听脚本打包配置文件
    gulp.watch config.browserify.files, ['browserify']