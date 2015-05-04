(function() {
  var sfFunc;

  sfFunc = function($translate, $filter, $window) {
    return {
      scope: {
        name: "@"
      },
      restrict: 'E',
      replace: true,
      require: '^sfFunclist',
      templateUrl: "app/funclist/directives/sfFunc.html",
      link: function(scope, element, attrs, ctrl) {
        return scope.explanation = "FUNCTION." + ($filter('uppercase')(scope.name));
      }
    };
  };

  angular.module('app').directive('sfFunc', ['$translate', '$filter', '$window', sfFunc]);

}).call(this);
