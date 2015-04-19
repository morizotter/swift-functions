example = ()->
  scope:
    name: "@"
  replace: true
  require: '^funclist'
  # templateUrl: (elem, attr) ->
  #   debugger
  #   templateUrl
  template: '<pre ng-include="contentUrl"></pre>'
  link: (scope, element, attrs, ctrl) ->
    scope.contentUrl = ctrl.exampleUrl(scope.name)

angular.module('app')
.directive 'example', [example]
