func = ()->
  scope:
    name: "@"
  restrict: 'E'
  replace: true
  require: '^funclist'
  templateUrl: "app/directives/funclist/func.html"
  link: (scope, element, attrs, ctrl) ->
    scope.click = ->
      console.log("func click")
      console.log(ctrl)
      ctrl.click()

angular.module('app')
.directive 'func', [func]
