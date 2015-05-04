(function() {
  var app;

  app = angular.module('app');

  app.config([
    '$translateProvider', function($translateProvider) {
      return $translateProvider.useStaticFilesLoader({
        prefix: 'l10n/locale-',
        suffix: '.json'
      }).fallbackLanguage('en').determinePreferredLanguage().useSanitizeValueStrategy('escaped');
    }
  ]);

}).call(this);
