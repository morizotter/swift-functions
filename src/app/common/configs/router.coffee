app = angular.module('app')
app.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"
  $stateProvider
  .state 'root',
    url: "/",
    templateUrl: "app/root/root.html"
  ]
