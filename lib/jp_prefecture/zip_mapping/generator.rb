# frozen_string_literal: true

require 'csv'
require 'yaml'
require 'jp_prefecture'

module JpPrefecture
  module ZipMapping
    # KEN_ALL.CSV から都道府県コードと郵便番号レンジのマッピングを生成する
    class Generator
      # KEN_ALL.CSV の列番号
      ZIP_INDEX = 2
      PREFECTURE_NAME_INDEX = 6

      def initialize(csv_path)
        @csv_path = csv_path
      end

      # { prefecture_code: [[from_zip_1, to_zip_1], [from_zip_2, to_zip_2], ...], ... }
      def prefecture_zip_ranges
        ranges = {}

        ranged_zips.each do |zip_from, zip_to, code|
          ranges[code] ||= []
          ranges[code] << [zip_from, zip_to]
        end

        ranges.sort.to_h
      end

      def write(output_path)
        File.open(output_path, 'w') do |file|
          file.write "# { prefecture_code: [[from_zip_1, to_zip_1], [from_zip_2, to_zip_2], ...], ... }\n"
          file.write "# Last updated: #{Time.now.utc}\n"
          file.write prefecture_zip_ranges.to_yaml
        end
      end

      private

      # 郵便番号順に並べ、同一都道府県が連続する区間を [from, to, code] に畳む
      def ranged_zips
        sorted_zips
          .chunk_while { |(_, code_a), (_, code_b)| code_a == code_b }
          .collect { |chunk| [chunk.first[0], chunk.last[0], chunk.first[1]] }
      end

      # [zip, prefecture_code] のペアを [zip, code] の昇順で返す。
      # 複数の都道府県が同じ郵便番号を共有する場合があるため、
      # コードもソートキーに含めて出力を決定的にする
      def sorted_zips
        zips = CSV.foreach(@csv_path, headers: false).collect do |line|
          [line[ZIP_INDEX].to_i, Prefecture.find(name: line[PREFECTURE_NAME_INDEX]).code]
        end

        zips.sort
      end
    end
  end
end
