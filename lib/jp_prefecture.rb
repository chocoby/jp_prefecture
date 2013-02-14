# coding: utf-8
require "jp_prefecture/version"
require "jp_prefecture/mapping"
require "jp_prefecture/prefecture"
require "jp_prefecture/base"
require "jp_prefecture/model"

module JpPrefecture
  def self.included(model_class)
    model_class.instance_eval do
      extend Base
    end
  end
end
