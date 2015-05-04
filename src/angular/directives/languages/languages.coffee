languages = (LANGUAGES, $translate)->
  scope:{}
  restrict: 'E'
  replace: true
  controller: ($translate, LANGUAGES) ->
    @languages = LANGUAGES
    @changeLanguage = (languageKey) ->
      $translate.use(languageKey)
  controllerAs: 'languagesCtrl'
  templateUrl: "angular/directives/languages/languages.html"
  link: (scope, element, attrs, ctrl, transclude) ->

angular.module('app')
.directive 'languages', [languages]
