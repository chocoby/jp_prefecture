# coding: utf-8
if ENV['CI']
  require 'simplecov'
  require 'simplecov-lcov'
  SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = "coverage/lcov.info"
  end
  SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
  SimpleCov.start
end

require "jp_prefecture"
require "active_record"

RSpec.configure do |config|
  config.before(:suite) do
    setup_db
  end

  config.after(:suite) do
    teardown_db
  end
end

def setup_db
  ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

  ActiveRecord::Schema.define(version: 1) do
    create_table :places do |t|
      t.integer :prefecture_code
      t.integer :prefecture_id
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end
