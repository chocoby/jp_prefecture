# coding: utf-8
require "jp_prefecture/base"
require "jp_prefecture/config"
require "jp_prefecture/prefecture"
require "jp_prefecture/version"

module JpPrefecture
  @config = Config.new

  def self.included(model_class)
    model_class.extend Base
  end

  def self.setup
    yield @config
  end

  def self.config
    @config
  end
end
