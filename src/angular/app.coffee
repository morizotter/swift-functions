app = angular.module('app', ['pascalprecht.translate'])

app.constant 'FUNCTIONS', [
  'abs',
  'advance',
  'alignof',
  'alignofValue',
  'assert',
  'assertionFailure',
  'contains',
  'count',
  'debugPrint',
  'debugPrintln',
  'distance',
  'dropFirst',
  'dropLast',
  'dump',
  'enumerate',
  'equal',
  'extend',
  'fatalError',
  'filter',
  'find',
  'first',
  'flatMap',
  'getVaList',
  'indices',
  'insert',
  'isEmpty',
  'isUniquelyReferenced',
  'isUniquelyReferencedNonObjC',
  'join',
  'last',
  'lazy',
  'lexicographicalCompare',
  'map',
  'max',
  'maxElement',
  'min',
  'minElement',
  'numericCast',
  'overlaps',
  'partition',
  'precondition',
  'preconditionFailure',
  'prefix',
  'print',
  'println',
  'reduce',
  'reflect',
  'removeAll',
  'removeAtIndex',
  'removeLast',
  'removeRange',
  'reverse',
  'sizeof',
  'sizeofValue',
  'sort',
  'sorted',
  'splice',
  'split',
  'startsWith',
  'stride',
  'strideof',
  'strideofValue',
  'suffix',
  'swap',
  'toDebugString',
  'toString',
  'transcode',
  'underestimateCount',
  'unsafeAddressOf',
  'unsafeBitCast',
  'unsafeDowncast',
  'unsafeUnwrap',
  'withExtendedLifetime',
  'withUnsafeMutablePointer',
  'withUnsafeMutablePointers',
  'withUnsafePointer',
  'withUnsafePointers',
  'withVaList',
  'zip'
  ]

translations =
  HEADLINE: 'What an awesome module!'
  PARAGRAPH: 'Srsly!'
  NAMESPACE:
    PARAGRAPH: 'And it comes with awesome features!'
translationsjp =
  HEADLINE: 'スゲートランスレーション'
  PARAGRAPH: 'パラグラフ'
  NAMESPACE:
    PARAGRAPH: 'And it comes with awesome features!'

app.config ['$translateProvider', ($translateProvider) ->
  $translateProvider
  # .translations 'en', translations
  # .translations 'ja', translations
  .useStaticFilesLoader
    prefix: 'angular/translations/',
    suffix: '.json'
  .preferredLanguage 'en'
  .registerAvailableLanguageKeys ['en', 'ja'],
    'en-US': 'en',
    'ja-JP': 'ja'
  .determinePreferredLanguage();
  ]
