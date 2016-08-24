'use strict';

module.exports = function (grunt) {
    require('jit-grunt')(grunt);

    // grunt.loadNpmTasks('grunt-contrib-less');

    var config = {};

    config.less = {
        bootstrap: {
            options:{
                compress: true,
                yuicompress: true,
                optmization: 2
            },
            files: {
                'grails-app/assets/stylesheets/bootstrap.css': 'grails-app/assets/less/bootstrap/bootstrap.less'
            }
        }
    };

    config.watch = {
        bootstrap: {
            files: 'grails-app/assets/less/bootstrap/{,*/}*.less',
            tasks: 'less:bootstrap',
            options: {
                spawn: true,
            }
        }
    }

    grunt.initConfig(config);

    var tasks = [
        'less',
        'watch'
    ];

    grunt.registerTask('default', tasks);
}
