# frozen_string_literal: true

if RUBY_VERSION < '3.0.0'
  appraise 'rails50' do
    gem 'activerecord', '~> 5.0'
    gem 'sqlite3', '< 1.4'
  end

  appraise 'rails51' do
    gem 'activerecord', '~> 5.1'
    gem 'sqlite3', '< 1.4'
  end

  appraise 'rails52' do
    gem 'activerecord', '~> 5.2'
    gem 'sqlite3', '< 1.4'
  end
end

if RUBY_VERSION >= '2.6.0'
  appraise 'rails60' do
    gem 'activerecord', '~> 6.0'
  end

  appraise 'rails61' do
    gem 'activerecord', '~> 6.1'
  end
end

if RUBY_VERSION >= '2.7.0'
  appraise 'rails70' do
    gem 'activerecord', '~> 7.0'
  end

  appraise 'rails71' do
    gem 'activerecord', '~> 7.1'
  end
end
