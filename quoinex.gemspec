lib = File.expand_path(File.join('..', 'lib'), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quoinex/version'

Gem::Specification.new do |spec|
  spec.name          = 'quoinex'
  spec.version       = Quoinex::VERSION
  spec.authors       = ['Pablo Fernandez']
  spec.email         = ['pfer@me.com']
  spec.description   = ''
  spec.summary       = ''
  spec.homepage      = 'https://github.com/heelhook/quoinex'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(features|spec|test)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.1'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'bump', '~> 0.5'

  spec.add_development_dependency 'guard', '~> 2.11'
  spec.add_development_dependency 'guard-yard', '~> 2.1'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'

  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'codecov', '~> 0.1'
  spec.add_development_dependency 'fuubar', '~> 2.0'

  spec.add_development_dependency 'yard', '~> 0.9.5'
  spec.add_development_dependency 'redcarpet', '~> 3.2'
  spec.add_development_dependency 'github-markup', '~> 1.3'

  spec.add_development_dependency 'byebug', '~> 9.1'

  spec.add_dependency 'rest-client', '~> 2'
  spec.add_dependency 'jwt', '~> 2.1'
end
