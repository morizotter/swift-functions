funclist = (FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "angular/directives/funclist/funclist.html"
  controller: ($scope) ->
    @names = FUNCTIONS
    @click = ->
      console.log("funclist click")
    @swiftUrl = (name) ->
      "functions/#{name}.html"
  controllerAs: 'funclistCtrl'
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'funclist', ['FUNCTIONS', funclist]
