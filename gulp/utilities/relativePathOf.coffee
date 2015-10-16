##################################################
# 获取文件与根目录的相对路径
##################################################

arrayFrom = require('./arrayFrom')
pathOf = require('./pathOf')

module.exports = (file) ->
  base = ''
  pathArray = arrayFrom pathOf file
  n = pathArray.length - 1

  base += '../' while n -= 1
  return base