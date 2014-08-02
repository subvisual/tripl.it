module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    app: 'app'
    dist: 'www'

    phonegap:
      config:
        plugins: ['org.apache.cordova.contacts']
        platforms: ['ios']
        config:
          template: '_config.xml'
          data:
            id: 'tripli.it.app'
            version: '<%= pkg.version %>'
            name: '<%= pkg.name %>'
            description: '<%= pkg.description %>'
            author:
              email: 'gabrielpoca@gmail.com'
              href: 'http://groupbuddies.com'
              text: 'Group Buddies'
        versionCode: 1
        permissions: []
        icons:
          android:
            ldpi: 'res/icon/android/icon-36-ldpi.png'
            mdpi: 'res/icon/android/icon-48-mdpi.png'
            hdpi: 'res/icon/android/icon-72-hdpi.png'
            xhdpi: 'res/icon/android/icon-96-xhdpi.png'
          ios:
            icon57: 'res/icon/ios/icon-57.png'
            icon57x2: 'res/icon/ios/icon-57-2x.png'
            icon72: 'res/icon/ios/icon-72.png'
            icon72x2: 'res/icon/ios/icon-72-2x.png'
            icon60x2: 'res/icon/ios/icon-60-2x.png'
        screens:
          android:
            hdpiLand: 'res/screens/android/screen-hdpi-landscape.png'
            hdpi: 'res/screens/android/screen-hdpi-portrait.png'
            xhdpi: 'res/screens/android/screen-xhdpi-portrait.png'
            xhdpiLand: 'res/screens/android/screen-xhdpi-landscape.png'
          ios:
            ipadLand: 'res/screens/ios/screen-ipad-landscape.png'
            ipadLandx2: 'res/screens/ios/screen-ipad-landscape-2x.png'
            ipadPortrait: 'res/screens/ios/screen-ipad-portrait.png'
            ipadPortraitx2: 'res/screens/ios/screen-ipad-portrait-2x.png'
            iphonePortrait: 'res/screens/ios/screen-iphone-portrait.png'
            iphonePortraitx2: 'res/screens/ios/screen-iphone-portrait-2x.png'
            iphone568hx2: 'res/screens/ios/screen-iphone-568h-2x.png'

    loopback_sdk_angular:
      services:
        options:
          input: '../server/server.js'
          output: '<%= dist %>/js/lb-services.js'

    connect:
      options:
        hostname: 'localhost'
        livereload: 35729
        port: 3001
      server:
        options:
          base: 'www'

    coffee:
      compile:
        files:
          '<%= dist %>/js/app.js': [
            '<%= app %>/js/*.coffee'
            '<%= app %>/js/*/*.coffee'
          ]

    sass:
      dist:
        options:
          includePaths: require('node-bourbon').includePaths
          outputStyle: 'extended'
        files:
          '<%= dist %>/css/index.css': '<%= app %>/components/styles.sass'

    htmlmin:
      dist:
        options:
          collapseWhitespace: true
        files: [
          expand: true
          cwd: '<%= dist %>/'
          dest: '<%= dist %>/'
          src: [ '*.html', 'partials/*/*.html', 'components/*/*.html' ]
        ]

    useminPrepare:
      html: '<%= app %>/index.html'
      options:
        dest: '<%= dist %>'

    copy:
      dist:
        files: [{
          expand: true
          cwd: '<%= app %>/'
          src: ['index.html', 'partials/**', 'components/**']
          dest: '<%= dist %>/'
        },{
          expand: true
          cwd: '<%= app %>/'
          src: ['img/*']
          dest: '<%= dist %>/'
        }]

    usemin:
      html: '<%= dist %>/index.html'

    watch:
      options:
        livereload: '<%= connect.options.livereload %>'
      copy:
        files: ['<%= app %>/*.html', '<%= app %>/partials/{,*/}*.html', '<%= app %>/components/{,*/}*.html']
        tasks: ['copy', 'useminPrepare','concat', 'uglify', 'usemin', 'htmlmin']
      coffee:
        files: ['<%= app %>/js/{,*/}*.coffee']
        tasks: 'coffee'
      sass:
        files: ['<%= app %>/components/{,*/}*.sass']
        tasks: 'sass'

  grunt.loadNpmTasks 'grunt-loopback-sdk-angular'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-phonegap'
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-usemin'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'

  grunt.registerTask 'server', [
    'loopback_sdk_angular'
    'sass'
    'coffee'
    'copy'
    'useminPrepare'
    'concat'
    'uglify'
    'usemin'
    'connect:server'
    'htmlmin'
    'watch'
  ]

  grunt.registerTask 'build', [
    'loopback_sdk_angular'
    'sass'
    'coffee'
    'copy'
    'useminPrepare'
    'concat'
    'uglify'
    'usemin'
    'htmlmin'
  ]
