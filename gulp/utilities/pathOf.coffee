##################################################
# 获取根目录cd到文件的路径
##################################################

config = require('../config')
path = require('path')
src = path.resolve config.paths.src

module.exports = (file) ->
  fileDir = path.relative src, path.dirname file.path
  fileDir = fileDir.replace('\\', '/')
  fileName = path.basename file.path, path.extname file.path
  filePath = if fileDir then fileDir + '/' + fileName else fileName
