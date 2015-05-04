sfFunclist = (FUNCTIONS)->
  scope:{}
  restrict: 'E'
  replace: true
  templateUrl: "app/funclist/directives/sfFunclist.html"
  controller: ($scope) ->
  controllerAs: 'funclistCtrl'
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.names = FUNCTIONS

angular.module('app')
.directive 'sfFunclist', ['FUNCTIONS', sfFunclist]
