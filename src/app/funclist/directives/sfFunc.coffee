sfFunc = ($translate, $filter)->
  scope:
    name: "@"
  restrict: 'E'
  replace: true
  require: '^sfFunclist'
  templateUrl: "app/funclist/directives/sfFunc.html"
  link: (scope, element, attrs, ctrl) ->
    scope.copy = ->
      console.log($filter('uppercase')(scope.name))
    # scope.explanation = "FUNCTION.#{$filter('uppercase')(scope.name)}"
    scope.explanation = "FUNCTION.ABS"

angular.module('app')
.directive 'sfFunc', ['$translate', '$filter', sfFunc]
