##################################################
# 数据获取
##################################################

fm = require('front-matter')
fs = require('fs')
deepmerge = require('deepmerge')
path = require('path')
config = require('../config')
arrayFrom = require('../utilities/arrayFrom')
pathOf = require('../utilities/pathOf')
relativePathOf = require('../utilities/relativePathOf')

module.exports = (file) ->
  # 公用数据
  data = JSON.parse fs.readFileSync path.resolve config.paths.root + config.data
  # 当前文件元数据
  metaData =
    current: {}
  # 文件内容中的数据
  content = fm String file.contents

  metaData.current.source = path.basename file.path, '.jade'
  metaData.current.path = arrayFrom pathOf file
  metaData.current.base = relativePathOf file

  file.contents = new Buffer content.body

  # 合并数据返回
  deepmerge deepmerge(data, metaData), content.attributes