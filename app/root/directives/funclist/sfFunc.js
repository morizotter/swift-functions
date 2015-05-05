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
      templateUrl: "app/root/directives/funclist/sfFunc.html",
      link: function(scope, element, attrs, ctrl) {
        scope.explanation = "FUNCTION." + ($filter('uppercase')(scope.name));
        return scope.contentUrl = "functions/" + scope.name + ".html";
      }
    };
  };

  angular.module('app').directive('sfFunc', ['$translate', '$filter', '$window', sfFunc]);

}).call(this);
