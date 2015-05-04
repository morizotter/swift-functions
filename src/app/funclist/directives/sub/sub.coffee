sub = ($location, $anchorScroll, FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "app/funclist/directives/sub/sub.html"
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'sub', [sub]
