(function() {
  var app;

  app = angular.module('app');

  app.config([
    '$translateProvider', function($translateProvider) {
      return $translateProvider.useStaticFilesLoader({
        prefix: 'l10n/locale-',
        suffix: '.json'
      }).fallbackLanguage('en').preferredLanguage('en').determinePreferredLanguage().useSanitizeValueStrategy('escaped');
    }
  ]);

}).call(this);
