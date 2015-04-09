##################################################
# 任务描述：收集全部页面信息
##################################################

fm = require('front-matter')
pathOf = require('../utilities/pathOf')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'collect', ->
    global.collection = []

    gulp.src config.markup.src
      .pipe $.ignore.exclude config.markup.excluded
      .pipe $.data (file) ->
        content = fm String file.contents
        page = {}

        file.contents = new Buffer content.body

        page.title = content.attributes.page_title
        page.url = pathOf file
        global.collection.push page