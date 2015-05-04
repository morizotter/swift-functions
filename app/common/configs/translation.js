(function() {
  var app;

  app = angular.module('app');

  app.config([
    '$translateProvider', function($translateProvider) {
      return $translateProvider.useStaticFilesLoader({
        prefix: 'l10n/locale-',
        suffix: '.json'
      }).fallbackLanguage('en').registerAvailableLanguageKeys(['en', 'ja'], {
        'en-US': 'en',
        'en_US': 'en',
        'en-UK': 'en',
        'en_UK': 'en',
        'ja-JP': 'ja',
        'ja_JP': 'ja'
      }).determinePreferredLanguage().useSanitizeValueStrategy('escaped');
    }
  ]);

}).call(this);
