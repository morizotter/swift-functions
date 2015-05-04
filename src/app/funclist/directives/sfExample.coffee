sfExample = ()->
  scope:
    name: "@"
  restrict: 'E'
  replace: true
  require: '^sfFunclist'
  template: '<pre ng-include="contentUrl"></pre>'
  link: (scope, element, attrs, ctrl) ->
    scope.contentUrl = null
    scope.contentUrl = ctrl.exampleUrl(scope.name)

angular.module('app')
.directive 'sfExample', [sfExample]
