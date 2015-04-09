##################################################
# 任务描述：编译Coffeescript文件并打包
##################################################

browserify = require('browserify')
watchify = require('watchify')
fs = require('fs')
path = require('path')
source = require('vinyl-source-stream')
browserSync = require('browser-sync')
handleErrors = require('../utilities/handleErrors')
logger = require('../utilities/logger')

module.exports = (gulp, opts, config, $) ->
  gulp.task 'browserify', (callback) ->
    bundleFiles = JSON.parse fs.readFileSync path.resolve config.paths.root + config.browserify.files
    bundleQueue = bundleFiles.length

    createBundle = (options) ->
      bundler = browserify
        cache: {}
        packageCache: {}
        fullPaths: false
        entries: options.input
        extensions: config.browserify.extensions
        debug: options.debug

      reportFinished = ->
        logger.end options.output, 'Bundled'
        if bundleQueue
          bundleQueue -= 1
          if bundleQueue is 0
            callback()
        return

      rebundle = ->
        logger.start options.output, 'Bundling'
        bundler.bundle()
          .on 'error', handleErrors
          .pipe source options.output
          .pipe gulp.dest options.destination
          .on 'end', reportFinished
          .pipe browserSync.reload stream: true, once: true

      # 如果是debug模式，使用watchify
      if options.debug
        bundler = watchify bundler
        bundler.on 'update', rebundle

      rebundle()

    createBundles = (bundles) ->
      bundles.forEach (bundle) ->
        createBundle
          input: path.resolve bundle.input
          output: bundle.output
          extensions: bundle.extensions
          destination: if opts.p then bundle.dist else bundle.public
          debug: not opts.p

    createBundles bundleFiles
















