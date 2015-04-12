func = ->
  templateUrl: "angular/directives/func/func.html"
  scope:
    name: "@"
  link: (scope) ->
    console.log(scope.name)

angular.module('app')
.directive 'func', [func]
