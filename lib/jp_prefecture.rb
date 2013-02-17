# coding: utf-8
require "jp_prefecture/base"
require "jp_prefecture/configuration"
require "jp_prefecture/prefecture"
require "jp_prefecture/version"

module JpPrefecture
  def self.included(model_class)
    model_class.extend self
  end

  def self.extended(model_class)
    model_class.instance_eval do
      extend Base
      @jp_prefecture_config = Class.new(Configuration).new(self)
    end
  end
end
