/**
 * Created by asterix on 9/8/2016.
 */
'use strict';
angular.module('myApp', [                       
                            'ngMaterial',
                            'ngMessages',
                            'loginModule'
                                        
]).config(config).run(run);

config.$inject = ['$mdThemingProvider'];
function config($mdThemingProvider) {
    $mdThemingProvider.theme('appTheme')
        .primaryPalette('blue')
        .accentPalette('orange')
        .backgroundPalette('orange', {
            'default': '400'
        })
}

run.$inject = [];
function run() {
    
}