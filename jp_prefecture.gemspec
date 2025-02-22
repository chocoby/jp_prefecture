# frozen_string_literal: true

require File.expand_path('lib/jp_prefecture/version', __dir__)

Gem::Specification.new do |gem|
  gem.name          = 'jp_prefecture'
  gem.version       = JpPrefecture::VERSION
  gem.authors       = ['chocoby']
  gem.email         = ['chocoby@himajin.dev']

  gem.summary       = 'Convert japan prefecture code into prefecture name'
  gem.description   = 'Convert japan prefecture code (JIS X 0402 based) into prefecture name.'
  gem.homepage      = 'https://github.com/chocoby/jp_prefecture'
  gem.license       = 'MIT'

  gem.required_ruby_version = '>= 2.4'

  gem.metadata['rubygems_mfa_required'] = 'true'

  gem.files         = Dir['{data,lib}/**/*', 'CHANGELOG.md', 'LICENSE', 'README.md', 'README_EN.md']
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.require_paths = ['lib']
end
