(function() {
  var app;

  app = angular.module('app');

  app.config([
    '$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
      $urlRouterProvider.otherwise("/");
      return $stateProvider.state('root', {
        url: "/",
        templateUrl: "app/root/root.html",
        controller: "RootCtrl"
      });
    }
  ]);

}).call(this);
