(function() {
  var sfNavigation;

  sfNavigation = function($location, $anchorScroll, $window, $timeout, FUNCTIONS) {
    return {
      scope: {},
      replace: true,
      templateUrl: "app/navigation/directives/sfNavigation.html",
      link: function(scope, element, attrs, ctrl, transclude) {
        var checkIfMobile, init;
        scope.names = FUNCTIONS;
        scope.isMobile = false;
        scope.scrollTo = function(id) {
          $location.hash(id);
          return $anchorScroll();
        };
        checkIfMobile = function() {
          var isMobile;
          isMobile = false;
          if ($window.innerWidth < 768.0) {
            isMobile = true;
          }
          if (scope.isMobile !== isMobile) {
            scope.isMobile = isMobile;
            return $timeout(function() {
              return scope.$apply(function() {
                return scope.isMobile = isMobile;
              });
            });
          }
        };
        angular.element($window).bind('resize', function() {
          return checkIfMobile();
        });
        init = function() {
          return checkIfMobile();
        };
        return init();
      }
    };
  };

  angular.module('app').directive('sfNavigation', ['$location', '$anchorScroll', '$window', '$timeout', 'FUNCTIONS', sfNavigation]);

}).call(this);
