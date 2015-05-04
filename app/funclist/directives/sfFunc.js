(function() {
  var sfFunc;

  sfFunc = function($translate, $filter) {
    return {
      scope: {
        name: "@"
      },
      restrict: 'E',
      replace: true,
      require: '^sfFunclist',
      templateUrl: "app/funclist/directives/sfFunc.html",
      link: function(scope, element, attrs, ctrl) {
        scope.copy = function() {
          return console.log($filter('uppercase')(scope.name));
        };
        return scope.explanation = "FUNCTION.ABS";
      }
    };
  };

  angular.module('app').directive('sfFunc', ['$translate', '$filter', sfFunc]);

}).call(this);
