funclist = (FUNCTIONS)->
  scope:
    names: "@"
  replace: true
  transclude: true
  templateUrl: "angular/directives/funclist/funclist.html"
  controller: ($scope) ->
    $scope.names = FUNCTIONS
  link: (scope, element, attrs, ctrl, transclude) ->
    # console.log(FUNCTIONS)
    # scope.names = FUNCTIONS
    # console.log scope.names

angular.module('app')
.directive 'funclist', ['FUNCTIONS', funclist]
