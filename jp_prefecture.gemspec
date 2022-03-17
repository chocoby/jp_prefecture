# frozen_string_literal: true

require File.expand_path('lib/jp_prefecture/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = ['chocoby']
  gem.email         = ['chocoby@himajin.dev']
  gem.summary       = 'Convert japan prefecture code into prefecture name'
  gem.description   = 'Convert japan prefecture code (JIS X 0402 based) into prefecture name.'
  gem.homepage      = 'https://github.com/chocoby/jp_prefecture'
  gem.license       = 'MIT'

  gem.files         = Dir['{data,lib}/**/*', 'CHANGELOG.md', 'LICENSE', 'README.md', 'README_EN.md']
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'jp_prefecture'
  gem.require_paths = ['lib']
  gem.version       = JpPrefecture::VERSION
  gem.required_ruby_version = '>= 2.4.0'

  gem.add_development_dependency 'activerecord', '>= 5.0.0'
  gem.add_development_dependency 'appraisal'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'rubocop-performance'
  gem.add_development_dependency 'rubocop-rake'
  gem.add_development_dependency 'rubocop-rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-lcov'
  gem.add_development_dependency 'sqlite3'
end
