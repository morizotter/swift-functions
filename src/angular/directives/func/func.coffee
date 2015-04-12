func = (FUNCTIONS)->
  templateUrl: "angular/directives/func/func.html"
  scope:
    name: "@"
  link: (scope) ->
    console.log(scope.name)
    console.log(FUNCTIONS)

angular.module('app')
.directive 'func', ['FUNCTIONS', func]
