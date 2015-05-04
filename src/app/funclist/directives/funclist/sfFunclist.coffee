sfFunclist = (FUNCTIONS)->
  scope:{}
  restrict: 'E'
  replace: true
  templateUrl: "app/funclist/directives/funclist/sfFunclist.html"
  controller: ($scope) ->
    @names = FUNCTIONS
    @click = ->
      console.log("funclist click")
    @exampleUrl = (name) ->
      "functions/#{name}.html"
  controllerAs: 'funclistCtrl'
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'sfFunclist', ['FUNCTIONS', sfFunclist]
