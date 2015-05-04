(function() {
  var sfFunclist;

  sfFunclist = function(FUNCTIONS, VERSION) {
    return {
      scope: {},
      restrict: 'E',
      replace: true,
      templateUrl: "app/funclist/directives/sfFunclist.html",
      controller: function($scope) {},
      controllerAs: 'funclistCtrl',
      link: function(scope, element, attrs, ctrl, transclude) {
        scope.names = FUNCTIONS;
        return scope.version = VERSION.SHORT;
      }
    };
  };

  angular.module('app').directive('sfFunclist', ['FUNCTIONS', 'VERSION', sfFunclist]);

}).call(this);
