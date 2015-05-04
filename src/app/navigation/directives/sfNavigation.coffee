sfNavigation = ($location, $anchorScroll,$window, $timeout, FUNCTIONS)->
  scope:{}
  replace: true
  templateUrl: "app/navigation/directives/sfNavigation.html"
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.names = FUNCTIONS
    scope.isMobile = false

    scope.scrollTo = (id) ->
      $location.hash(id)
      $anchorScroll()

    checkIfMobile = ()->
      isMobile = false
      if $window.innerWidth < 768.0
        isMobile = true
      if scope.isMobile isnt isMobile
        scope.isMobile = isMobile
        $timeout ()->
          scope.$apply ()->
            scope.isMobile = isMobile

    angular.element($window).bind 'resize', () ->
      checkIfMobile()

    init = ->
      checkIfMobile()
    init()

angular.module('app')
.directive 'sfNavigation', ['$location', '$anchorScroll','$window', '$timeout',  'FUNCTIONS', sfNavigation]
