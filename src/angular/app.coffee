app = angular.module('app', ['pascalprecht.translate'])

app.config ['$translateProvider', ($translateProvider) ->
  $translateProvider
  .useStaticFilesLoader {
    prefix: 'i18n/locale-'
    suffix: '.json'
  }
  .preferredLanguage 'en'
  .fallbackLanguage 'en'
  .registerAvailableLanguageKeys ['en', 'ja'],
    'en-US': 'en',
    'ja-JP': 'ja'
  .determinePreferredLanguage()
  .useSanitizeValueStrategy 'escaped'
  ]
