# frozen_string_literal: true

require 'jp_prefecture/mapping'
require 'jp_prefecture/zip_mapping'

module JpPrefecture
  class Prefecture
    # 都道府県の検索を行うクラス
    class Finder
      def initialize
        @mapping = Mapping.data
      end

      # 指定した項目を検索
      #
      # @param field [Symbol] 検索する項目。nil の場合は都道府県コードとして扱う
      # @param value [String, Integer] 検索する内容
      # @return [JpPrefecture::Prefecture] 都道府県が見つかった場合は都道府県インスタンス
      # @return [nil] 都道府県が見つからない場合は nil
      def find(field:, value:)
        code = find_code(field, value)
        JpPrefecture::Prefecture.build_by_code(code)
      end

      private

      # @param field [Symbol] 検索する項目
      # @param value [String, Integer] 検索する内容
      # @return [Integer] 見つかった場合は都道府県コード
      # @return [nil] 見つからない場合は nil
      def find_code(field, value)
        return value.to_i if field.nil?

        case field
        when :all_fields
          find_code_by_name_from_all_fields(value)
        when :name, :name_h, :name_k, :name_e, :name_r
          find_code_by_name(field, value)
        when :code
          value.to_i
        when :zip
          ZipMapping.code_for_zip(value.to_i)
        end
      end

      # すべての項目を前方一致で検索
      def find_code_by_name_from_all_fields(value)
        return if value.nil? || value.empty?

        value = value.downcase

        @mapping.each do |m|
          m[1].each_value do |v|
            return m[0] if v.start_with?(value)
          end
        end
      end

      # 指定した項目を前方一致で検索
      def find_code_by_name(field, value)
        return if value.nil? || value.empty?

        value = value.downcase

        @mapping.each do |m|
          return m[0] if m[1][field].start_with?(value)
        end
      end
    end
  end
end
