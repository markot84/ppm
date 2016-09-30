module.exports = function(grunt) {
    grunt.file.setBase('/etc/apache2/htdocs/loc-push-dev.com');
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            options: {
                mangle   : false,
                banner: '/*! <%= pkg.name %> */\n'
            },
            my_target: {
                files:  {
                    'js/locPUSH.min.js':   [
                        'node_modules/jquery/dist/jquery.js',
                        'node_modules/jquery.nicescroll/jquery.nicescroll.js',
                        'node_modules/angular-route/angular-route.js',
                        'node_modules/angular-aria/angular-aria.js',
                        'node_modules/angular-animate/angular-animate.js',
                        'node_modules/angular-material/angular-material.js',
                        'node_modules/angular-material-data-table/dist/md-data-table.js',
                        'node_modules/dropzone/dist/dropzone.js',
                        'node_modules/ngdropzone/dist/ngDropzone.js',
                        'node_modules/moment/moment.js',
                        'node_modules/angular-material-datetimepicker/js/angular-material-datetimepicker.js',

                        'js/Modules/i18n.js',
                        'js/Modules/localization.js',
                        'js/Modules/statusCodes.js',
                        'js/Modules/navigator.js',
                        'js/Modules/user.js',
                        'js/Modules/client.js',
                        'js/Modules/campaign.js',
                        'js/Modules/application.js',
                        'js/Modules/device.js',
                        'js/Modules/notifications.js',
                        'js/Modules/locPush.js',

                        'js/Factories/factories.js',
                        'js/Services/services.js',
                        'js/Services/devices.js',

                        'js/Directives/directives.js',
                        'js/Directives/search.js',

                        'js/Controllers/portal.js',
                        'js/Controllers/dashboard.js',
                        'js/Controllers/sidebar.js',
                        'js/Controllers/toolbar.js',
                        'js/Controllers/users.js',
                        'js/Controllers/applications.js',
                        'js/Controllers/devices.js',
                        'js/Controllers/campaigns.js',
                        'js/Controllers/clients.js',
                        'js/Controllers/searchTags.js',
                        'js/Controllers/notifications.js',
                        'js/Controllers/mdDropzone.js',

                        'js/Filters/filters.js'
                    ]
                }
            }
        },
        cssmin: {
            target: {
                files: {
                    'css/locPUSH.min.css':[
                        'css/main.css',
                    ]
                }
            }
        },
    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks("grunt-contrib-cssmin");
    // Default task(s).
    grunt.registerTask('default', ['uglify','cssmin']);
};