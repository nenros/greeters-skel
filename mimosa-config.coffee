exports.config =
  modules: [
    "server"
    "browserify"
    "csslint"
    "jshint"
    "live-reload"
    "bower"
    "minify-js"
    "minify-css"
    "coffeescript"
    "ember-handlebars"
    "copy"
    "sass"
    "combine"]
  template:
    wrapType: 'common'
    commonLibPath: 'ember'
  browserify:
    bundles:
      [
        entries: ['javascripts/main.js']
        outputFile: 'bundle.js'
      ]
    shims:
      jquery:
        path: 'javascripts/vendor/jquery/jquery'
        exports: '$'
      handlebars:
        path: 'javascripts/vendor/handlebars/handlebars'
        exports: 'Handlebars'
      ember:
        path: 'javascripts/vendor/ember/ember'
        exports: 'Ember'
        depends:
          handlebars: 'Handlebars'
          jquery: '$'
      bootstrap: 
        path: 'javascripts/vendor/bootstrap/bootstrap'
        exports: 'bootstrap'
        depends:
          jquery: '$'
    noParse:
      [
        'javascripts/vendor/jquery/jquery'
        'javascripts/vendor/ember/handlebars'
        'javascripts/vendor/ember/ember'
        'javascripts/vendor/bootstrap/bootstrap'
      ]
  bower:
    copy:
      mainOverrides:
        'bootstrap': [
           "dist/css/bootstrap.css"
           {'fonts': '../../fonts'}
        ]
  combine:
    folders: [
      {
        folder:'stylesheets'
        output:'stylesheets/style.css'
        order: [
          'vendor/bootstrap/bootstrap.css'
          'app.css'
        ]
      }
    ]