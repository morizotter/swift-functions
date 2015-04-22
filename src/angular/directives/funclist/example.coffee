example = ()->
  scope:
    name: "@"
  replace: true
  require: '^funclist'
  template: '<pre ng-include="contentUrl"></pre>'
  link: (scope, element, attrs, ctrl) ->
    scope.contentUrl = null
    scope.contentUrl = ctrl.exampleUrl(scope.name)

angular.module('app')
.directive 'example', [example]
