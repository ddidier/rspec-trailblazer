lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rspec/trailblazer/version'

Gem::Specification.new do |spec|

  spec.name = 'rspec-trailblazer'
  spec.version = RSpec::Trailblazer::VERSION
  spec.authors = ['Timo SCHILLING', 'David DIDIER']
  spec.email = ['timo@schilling.io', 'c_inconnu2@yahoo.fr']

  spec.summary = 'RSpec Matchers for Trailblazer'
  spec.description = 'RSpec Matchers for Trailblazer'
  spec.homepage = "https://github.com/trailblazer/rspec-trailblazer"
  spec.license = 'MIT'

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.2.0'

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.extra_rdoc_files = %w[README.md]
  spec.files = Dir['bin/*', '{lib}/**/*.rb', 'CHANGELOG.md', 'LICENSE', 'README.md']
  spec.require_path = 'lib'

  # tested with Appraisals
  spec.add_runtime_dependency 'trailblazer', '>= 2.0', '< 3.0'
  spec.add_runtime_dependency 'rspec', '>= 3.0', '< 4.0'

  spec.add_development_dependency 'appraisal', '~> 2.2.0'
  spec.add_development_dependency 'bundler', '~> 1.15.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'guard', '~> 2.14.0'
  spec.add_development_dependency 'guard-bundler', '~> 2.1.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7.0'
  spec.add_development_dependency 'rake', '~> 12.0.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.0'
  spec.add_development_dependency 'simplecov', '~> 0.14.0'
  spec.add_development_dependency 'wwtd', '~> 1.3.0'
  spec.add_development_dependency 'yard', '~> 0.9.0'

end
