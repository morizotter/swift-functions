func = (FUNCTIONS)->
  scope:
    name: "@"
  replace: true
  require: '^funclist'
  templateUrl: "angular/directives/func/func.html"
  link: (scope, element, attrs, ctrl) ->
    scope.click = ->
      console.log("func click")
      console.log(ctrl)
      ctrl.click()

angular.module('app')
.directive 'func', ['FUNCTIONS', func]
