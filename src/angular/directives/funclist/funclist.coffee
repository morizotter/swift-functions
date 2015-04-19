funclist = (FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "angular/directives/funclist/funclist.html"
  controller: ($scope) ->
    @names = FUNCTIONS
  controllerAs: 'funclistCtrl'
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'funclist', ['FUNCTIONS', funclist]
