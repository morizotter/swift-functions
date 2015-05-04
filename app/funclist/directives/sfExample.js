(function() {
  var sfExample;

  sfExample = function() {
    return {
      scope: {
        name: "@"
      },
      restrict: 'E',
      replace: true,
      require: '^sfFunclist',
      template: '<pre ng-include="contentUrl"></pre>',
      link: function(scope, element, attrs, ctrl) {
        scope.contentUrl = null;
        return scope.contentUrl = "functions/" + scope.name + ".html";
      }
    };
  };

  angular.module('app').directive('sfExample', [sfExample]);

}).call(this);
