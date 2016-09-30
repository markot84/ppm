angular.module('loginModule',[])
    .controller('loginController', loginController)
    .service('loginService', loginService);

loginController.$inject = ['$scope','loginService'];
function loginController($scope,loginService){
    $scope.yo = function(){
        loginService.get().then(function (response) {
            console.log(response);
        })
    }
};

loginService.$inject = ['$http'];
function loginService($http) {
    this.get = function (params) {
        return $http({
            method: 'POST',
            url: 'ajax/test.asp',
        })
    };
};
