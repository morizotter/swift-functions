app = angular.module('app')
app.config ['$translateProvider', ($translateProvider) ->
  $translateProvider
  .useStaticFilesLoader {
    prefix: 'l10n/locale-'
    suffix: '.json'
  }
  .fallbackLanguage 'en'
  .determinePreferredLanguage()
  .useSanitizeValueStrategy 'escaped'
  ]
