table = ($location, $anchorScroll, FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "angular/directives/table/table.html"
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.names = FUNCTIONS
    scope.scrollTo = (id) ->
      $location.hash(id);
      $anchorScroll();

angular.module('app')
.directive 'table', ['$location', '$anchorScroll', 'FUNCTIONS', table]
