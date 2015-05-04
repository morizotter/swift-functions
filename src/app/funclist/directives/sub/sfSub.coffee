sfSub = ($location, $anchorScroll, FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "app/funclist/directives/sub/sfSub.html"
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'sfSub', [sfSub]
