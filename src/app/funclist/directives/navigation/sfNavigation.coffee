sfNavigation = ($location, $anchorScroll, FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "app/funclist/directives/navigation/sfNavigation.html"
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.names = FUNCTIONS
    debugger
    scope.scrollTo = (id) ->
      $location.hash(id)
      $anchorScroll()

angular.module('app')
.directive 'sfNavigation', ['$location', '$anchorScroll', 'FUNCTIONS', sfNavigation]
