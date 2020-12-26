# frozen_string_literal: true

appraise 'rails50' do
  gem 'activerecord', '~> 5.0.0'
  gem 'sqlite3', '< 1.4'
end

appraise 'rails51' do
  gem 'activerecord', '~> 5.1.0'
  gem 'sqlite3', '< 1.4'
end

appraise 'rails52' do
  gem 'activerecord', '~> 5.2.0'
  gem 'sqlite3', '< 1.4'
end

if RUBY_VERSION >= '2.6.0'
  appraise 'rails60' do
    gem 'activerecord', '~> 6.0.0'
  end

  appraise 'rails61' do
    gem 'activerecord', '~> 6.1.0'
  end
end
