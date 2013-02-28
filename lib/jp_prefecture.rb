# coding: utf-8
require "jp_prefecture/base"
require "jp_prefecture/prefecture"
require "jp_prefecture/version"

module JpPrefecture
  def self.included(model_class)
    model_class.extend Base
  end
end
