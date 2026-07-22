# frozen_string_literal: true

require 'yaml'

module JpPrefecture
  # コードと郵便番号のマッピング
  module ZipMapping
    # [from, to] のペア配列を Range へ変換する
    def self.convert_to_ranges(data)
      data.each_with_object({}) do |(code, pairs), ranges|
        ranges[code] = pairs.collect { |zip_from, zip_to| zip_from..zip_to }
      end
    end

    private_class_method :convert_to_ranges

    filepath = File.join(File.dirname(__FILE__), '../../data/zip.yml')
    @data = convert_to_ranges(YAML.load_file(filepath))

    def self.data
      raw = JpPrefecture.config.zip_mapping_data
      raw ? convert_to_ranges(raw) : @data
    end

    def self.code_for_zip(zip)
      data.select do |_code, zip_ranges|
        zip_ranges.find { |range| range.include? zip }
      end.keys.first
    end
  end
end
