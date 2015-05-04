sfFunc = ($translate, $filter, $window)->
  scope:
    name: "@"
  restrict: 'E'
  replace: true
  require: '^sfFunclist'
  templateUrl: "app/funclist/directives/sfFunc.html"
  link: (scope, element, attrs, ctrl) ->
    scope.explanation = "FUNCTION.#{$filter('uppercase')(scope.name)}"

angular.module('app')
.directive 'sfFunc', ['$translate', '$filter', '$window', sfFunc]