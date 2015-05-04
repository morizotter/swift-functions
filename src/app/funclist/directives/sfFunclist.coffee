sfFunclist = (FUNCTIONS)->
  scope:{}
  restrict: 'E'
  replace: true
  templateUrl: "app/funclist/directives/sfFunclist.html"
  controller: ($scope) ->
    @names = FUNCTIONS
    
    @exampleUrl = (name) ->
      "functions/#{name}.html"
  controllerAs: 'funclistCtrl'
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'sfFunclist', ['FUNCTIONS', sfFunclist]
