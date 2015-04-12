namespace :functions do

  FUNCTIONS_DIR_PATH = "functions"
  FUNCTIONS = [
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

  desc 'create swift function files'
  task :create do
    sh "mkdir #{FUNCTIONS_DIR_PATH}" unless File.exist?("#{FUNCTIONS_DIR_PATH}")

    FUNCTIONS.each do |f|
      filepath = "#{FUNCTIONS_DIR_PATH}/#{f}.swift"
      sh "touch #{filepath}" unless File.exist?("#{filepath}")
    end
  end

  desc 'shows empty files'
  task :todo do
    todo_count = 0
    FUNCTIONS.each do |f|
      filepath = "#{FUNCTIONS_DIR_PATH}/#{f}.swift"
      if File.read("#{filepath}").count("\n") <= 1
        puts "WRITE: #{f}"
        todo_count += 1
      end
    end
    puts "REMAINING: #{todo_count} / #{FUNCTIONS.count} FUNCTIONS"
  end

  desc 'test if swift code works'
  task :test do
    FUNCTIONS.each do |f|
      sh "swift #{FUNCTIONS_DIR_PATH}/#{f}.swift"
    end
  end
end
