(function() {
  var sfLanguagesButton;

  sfLanguagesButton = function(LANGUAGES, $translate, $filter) {
    return {
      scope: {},
      restrict: 'E',
      replace: true,
      templateUrl: "app/common/directives/languages-button/sfLanguagesButton.html",
      link: function(scope, element, attrs, ctrl, transclude) {
        var init;
        scope.languages = LANGUAGES;
        scope.currentLanguage = "LANGUAGE";
        scope.changeLanguage = function(languageKey) {
          $translate.use(languageKey);
          return scope.updateCurrentLanguage();
        };
        scope.updateCurrentLanguage = function() {
          var key;
          key = "LANGUAGE." + ($filter('uppercase')($translate.use()));
          return $translate(key).then(function(language) {
            return scope.currentLanguage = language;
          });
        };
        init = function() {
          return scope.updateCurrentLanguage();
        };
        return init();
      }
    };
  };

  angular.module('app').directive('sfLanguagesButton', ['LANGUAGES', '$translate', '$filter', sfLanguagesButton]);

}).call(this);
