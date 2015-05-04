(function() {
  var sfFunclist;

  sfFunclist = function(FUNCTIONS) {
    return {
      scope: {},
      restrict: 'E',
      replace: true,
      templateUrl: "app/funclist/directives/sfFunclist.html",
      controller: function($scope) {},
      controllerAs: 'funclistCtrl',
      link: function(scope, element, attrs, ctrl, transclude) {
        return scope.names = FUNCTIONS;
      }
    };
  };

  angular.module('app').directive('sfFunclist', ['FUNCTIONS', sfFunclist]);

}).call(this);
