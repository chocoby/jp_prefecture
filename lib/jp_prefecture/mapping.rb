# coding: utf-8
require 'yaml'

module JpPrefecture
  # コードと都道府県のマッピング
  module Mapping
    filepath = File.join File.dirname(__FILE__), '../../data/prefecture.yml'
    PREFECTURE_CODE_NAME = YAML.load_file filepath
  end
end
