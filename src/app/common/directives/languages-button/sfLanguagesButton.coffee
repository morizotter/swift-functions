sfLanguagesButton = (LANGUAGES, $translate, $filter)->
  scope:{}
  restrict: 'E'
  replace: true
  templateUrl: "app/common/directives/languages-button/sfLanguagesButton.html"
  link: (scope, element, attrs, ctrl, transclude) ->
    scope.languages = LANGUAGES
    scope.currentLanguage = "LANGUAGE"

    scope.changeLanguage = (languageKey) ->
      $translate.use(languageKey)
      scope.updateCurrentLanguage()

    scope.updateCurrentLanguage = ()->
      key = "LANGUAGE.#{$filter('uppercase')($translate.use())}"
      $translate(key).then (language) ->
        scope.currentLanguage = language

    init = () ->
      scope.updateCurrentLanguage()
    init()

angular.module('app')
.directive 'sfLanguagesButton', ['LANGUAGES', '$translate', '$filter', sfLanguagesButton]
