func = (FUNCTIONS)->
  scope:
    name: "@"
  replace: true
  templateUrl: "angular/directives/func/func.html"
  link: (scope, element, attrs) ->
    console.log("name: #{scope.name}")
    # console.log(scope.name)
    # console.log(FUNCTIONS)

angular.module('app')
.directive 'func', ['FUNCTIONS', func]
