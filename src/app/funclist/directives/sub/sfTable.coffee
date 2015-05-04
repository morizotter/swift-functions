sfTable = ($location, $anchorScroll, FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "app/funclist/directives/sub/sfTable.html"
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.names = FUNCTIONS
    scope.scrollTo = (id) ->
      $location.hash(id);
      $anchorScroll();

angular.module('app')
.directive 'sfTable', ['$location', '$anchorScroll', 'FUNCTIONS', sfTable]
