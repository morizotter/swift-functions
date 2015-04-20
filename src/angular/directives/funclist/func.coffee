func = ()->
  scope:
    name: "@"
  replace: true
  require: '^funclist'
  templateUrl: "angular/directives/funclist/func.html"
  link: (scope, element, attrs, ctrl) ->
    scope.click = ->
      console.log("func click")
      console.log(ctrl)
      ctrl.click()

angular.module('app')
.directive 'func', [func]
