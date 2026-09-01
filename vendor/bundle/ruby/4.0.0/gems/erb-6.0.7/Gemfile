source 'https://rubygems.org'

gemspec

group :development do
  gem 'rake'
  gem 'rake-compiler'
  if RUBY_ENGINE == 'jruby'
    # RDoc 8 pulls in RBS 4, which attempts to build a native extension on JRuby.
    gem 'rdoc', '< 8'
  else
    gem 'rdoc'
  end
  gem 'test-unit'
  gem "test-unit-ruby-core"
end
