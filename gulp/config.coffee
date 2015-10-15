##################################################
# 任务配置
##################################################

root = "./"
src = "src"
dist = "dist"
pub = "public"
test = "tests"
assets = src + "/assets"

module.exports =
  paths:
    root: root
    src: root + src
    dist: root + dist
    public: root + pub
    test: root + test
    assets: root + assets

  # 静态页面公用数据文件
  data: src + "/_data.json"

  browserSync:
    server:
      baseDir: [root + pub]

  assets:
    src: assets + "/**/*.+(css|js|png|jpg|gif|ico|map|eot|svg|ttf|woff)"
    public: root + pub
    dist: root + dist

  stylus:
    src: [
      assets + "/stylus/**/*.styl"
    ]
    excluded: [
      "**/_*.styl"
    ]
    public: root + pub + "/styles"
    dist: root + dist + "/styles"

  markup:
    src: [
      src + "/app/**/*.jade"
    ]
    excluded: [
      "**/_*.jade"
    ]
    public: root + pub + "/app"
    dist: root + dist + "/app"

  collection:
    src: [
      src + "/index.jade"
    ]
    public: root + pub
    dist: root + dist

  browserify:
    extensions: [
      ".coffee"
    ]
    files: "browserify.json"

  test:
    unit: [
      test + "/unit/**/*.coffee"
    ]
    e2e: [
      test + "/e2e/**/*.coffee"
    ]
