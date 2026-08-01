# frozen_string_literal: true

require 'jp_prefecture/prefecture/finder'
require 'jp_prefecture/mapping'
require 'jp_prefecture/zip_mapping'

module JpPrefecture
  # 都道府県のコードと名前を扱うクラス
  class Prefecture
    attr_accessor :code, :name, :name_e, :name_r, :name_h, :name_k, :zips, :area, :type

    # 都道府県コードから都道府県インスタンスを作成
    #
    # @example
    #   # 都道府県コードから都道府県インスタンスを生成
    #   JpPrefecture::Prefecture.build_by_code(1)
    #
    # @param code [Integer] 都道府県コード
    # @return [JpPrefecture::Prefecture] 都道府県インスタンス
    # @return [nil] 都道府県が見つからない場合は nil
    def self.build_by_code(code) # rubocop:disable Metrics/AbcSize
      result = Mapping.data[code]
      return unless result

      pref = new

      pref.code = code
      pref.name = result[:name]
      pref.name_e = result[:name_e]&.capitalize
      pref.name_r = result[:name_r]&.capitalize
      pref.name_h = result[:name_h]
      pref.name_k = result[:name_k]
      pref.zips = ZipMapping.data[code]
      pref.area = result[:area]
      pref.type =
        case pref.name&.slice(-1)
        when '都', '道', '府', '県'
          pref.name[-1]
        end

      pref
    end

    # すべての都道府県を取得
    #
    # @example
    #   # 都道府県の一覧を取得
    #   JpPrefecture::Prefecture.all
    #
    #   # collection_select で選択肢を生成
    #   f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name
    #
    #   # collection_select で選択肢を生成(英語表記)
    #   f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name_e
    #
    # @return [Array<JpPrefecture::Prefecture>] 都道府県インスタンスの配列
    def self.all
      Mapping.data.map { |code, _| build_by_code(code) }
    end

    # 都道府県を検索
    #
    # 文字列は前方一致で検索する
    #
    # @example
    #   # 都道府県コードを検索
    #   JpPrefecture::Prefecture.find(1)
    #   JpPrefecture::Prefecture.find(code: 1)
    #
    #   # 都道府県名を検索
    #   JpPrefecture::Prefecture.find(name: '北海道')
    #   JpPrefecture::Prefecture.find(name: '東京')
    #
    #   # 英語表記の都道府県名を検索
    #   JpPrefecture::Prefecture.find(name_e: 'Hokkaido')
    #   JpPrefecture::Prefecture.find(name_e: 'hokkaido')
    #
    #   # ローマ字表記の都道府県名を検索
    #   JpPrefecture::Prefecture.find(name_r: 'Hokkaidō')
    #   JpPrefecture::Prefecture.find(name_r: 'hokkaidō')
    #
    #   # ひらがな表記の都道府県名を検索
    #   JpPrefecture::Prefecture.find(name_h: 'ほっかいどう')
    #
    #   # カタカナ表記の都道府県名を検索
    #   JpPrefecture::Prefecture.find(name_k: 'ホッカイドウ')
    #
    #   # すべての項目を検索
    #   JpPrefecture::Prefecture.find(all_fields: '東')
    #
    # @param args [Integer] 都道府県コード
    # @param args [Hash<Symbol, Integer>] :code 都道府県コード
    # @param args [Hash<Symbol, String>] :name 漢字表記/:name_e 英語表記/:name_r ローマ字表記/:name_h ひらがな表記/:name_k カタカナ表記
    # @param args [Hash<Symbol, Integer>] :zip 郵便番号
    # @param args [Hash<Symbol, String>] :all_fields マッピングに定義しているすべてのフィールドから検索
    # @return [JpPrefecture::Prefecture] 都道府県が見つかった場合は都道府県インスタンス
    # @return [nil] 都道府県が見つからない場合は nil
    def self.find(args)
      return if args.nil?

      case args
      when Integer, String
        JpPrefecture::Prefecture::Finder.new.find(field: nil, value: args)
      when Hash
        search_field = args.keys.first
        search_value = args.values.first

        JpPrefecture::Prefecture::Finder.new.find(field: search_field, value: search_value)
      end
    end

    # 都道府県を検索し、一致したすべての都道府県を返す
    #
    # 文字列は前方一致で検索する
    #
    # @example
    #   # 複数の都道府県に一致する検索
    #   JpPrefecture::Prefecture.where(name: '山')
    #   # => [山形県, 山梨県, 山口県]
    #
    #   # 英語表記で検索
    #   JpPrefecture::Prefecture.where(name_e: 'o')
    #   # => [大阪府, 岡山県, 大分県, 沖縄県]
    #
    # @param args [Hash<Symbol, String>] :name 漢字表記/:name_e 英語表記/:name_r ローマ字表記/:name_h ひらがな表記/:name_k カタカナ表記
    # @return [Array<JpPrefecture::Prefecture>] 一致した都道府県インスタンスの配列 (コード順)。一致しない場合は空配列
    # @raise [ArgumentError] 対応していない項目、または項目が 1 つでない場合
    def self.where(args)
      unless args.is_a?(Hash) && args.size == 1
        raise ArgumentError, "expected a Hash with exactly one key, got: #{args.inspect}"
      end

      field, value = args.first

      unless Finder::NAME_FIELDS.include?(field)
        raise ArgumentError, "unsupported field: #{field.inspect} (supported: #{Finder::NAME_FIELDS.join(', ')})"
      end

      JpPrefecture::Prefecture::Finder.new.where(field: field, value: value)
    end
  end
end
