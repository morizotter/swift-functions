func = (FUNCTIONS)->
  scope:
    name: "@"
  replace: true
  require: '^funclist'
  templateUrl: "angular/directives/func/func.html"
  link: (scope, element, attrs, ctrl) ->
    scope.click = ->
      console.log("click")
      console.log(ctrl.aaa)

angular.module('app')
.directive 'func', ['FUNCTIONS', func]
