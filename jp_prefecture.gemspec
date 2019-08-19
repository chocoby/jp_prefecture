# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jp_prefecture/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['chocoby']
  gem.email         = ['chocoby@gmail.com']
  gem.summary       = %q{Convert japan prefecture code into prefecture name}
  gem.description   = %q{Convert japan prefecture code(JIS X 0402 based) into prefecture name.}
  gem.homepage      = 'https://github.com/chocoby/jp_prefecture'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'jp_prefecture'
  gem.require_paths = ['lib']
  gem.version       = JpPrefecture::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.1'
  gem.add_development_dependency 'activerecord', '>= 3.2.0'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'appraisal'
end
