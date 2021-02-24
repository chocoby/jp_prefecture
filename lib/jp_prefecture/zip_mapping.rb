# frozen_string_literal: true

require 'yaml'

module JpPrefecture
  # コードと郵便番号のマッピング
  module ZipMapping
    filepath = File.join(File.dirname(__FILE__), '../../data/zip.yml')
    @data = YAML.load_file(filepath)
    # rubocop:disable Style/HashConversion
    # https://github.com/rubocop-hq/rubocop/issues/9526
    @data = Hash[*@data.collect { |code, arr| [code, arr.collect { |zip_from, zip_to| zip_from..zip_to }] }.flatten(1)]
    # rubocop:enable Style/HashConversion

    def self.data
      JpPrefecture.config.zip_mapping_data || @data
    end

    def self.code_for_zip(zip)
      data.select do |_code, zip_ranges|
        zip_ranges.find { |range| range.include? zip }
      end.keys.first
    end
  end
end
