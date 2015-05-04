sfFunc = ()->
  scope:
    name: "@"
  restrict: 'E'
  replace: true
  require: '^sfFunclist'
  templateUrl: "app/funclist/directives/funclist/sfFunc.html"
  link: (scope, element, attrs, ctrl) ->
    scope.click = ->
      console.log("func click")
      console.log(ctrl)
      ctrl.click()

angular.module('app')
.directive 'sfFunc', [sfFunc]
