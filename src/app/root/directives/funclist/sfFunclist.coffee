sfFunclist = (FUNCTIONS, VERSION)->
  scope:{}
  restrict: 'E'
  replace: true
  templateUrl: "app/root/directives/funclist/sfFunclist.html"
  controller: ($scope) ->
  controllerAs: 'funclistCtrl'
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.names = FUNCTIONS
    scope.version = VERSION.SHORT

angular.module('app')
.directive 'sfFunclist', ['FUNCTIONS', 'VERSION', sfFunclist]
