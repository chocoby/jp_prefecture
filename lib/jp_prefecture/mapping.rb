# coding: utf-8
require 'yaml'

module JpPrefecture
  # コードと都道府県のマッピング
  module Mapping

    filepath = File.join(File.dirname(__FILE__), '../../data/prefecture.yml')
    @data = YAML.load_file(filepath)

    def self.data
      JpPrefecture.config.mapping_data || @data
    end
  end
end
