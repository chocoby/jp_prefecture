# frozen_string_literal: true

require 'jp_prefecture/prefecture/finder'
require 'jp_prefecture/mapping'
require 'jp_prefecture/zip_mapping'

module JpPrefecture
  # 都道府県のコードと名前を扱うクラス
  class Prefecture
    attr_accessor :code, :name, :name_e, :name_h, :name_k, :zips, :area, :type

    # 配列から都道府県クラスを生成
    #
    # @example
    #   # コード/名前から都道府県クラスを生成
    #   JpPrefecture::Prefecture.build(1, '北海道', 'Hokkaido')
    #
    # @param pref [Integer] 都道府県コード
    # @param name [String] 都道府県名
    # @param name_e [String] 都道府県名(英語表記)
    # @param optional name_h [String] 都道府県名(ひらがな表記)
    # @param optional name_k [String] 都道府県名(カタカナ表記)
    # @param optional area [String] 地方名
    # @param zips [Array] 郵便番号の配列 (array of ranges, can be used in ARel, e.g. User.where(zip: prefecture.zips))
    def self.build(code, name, name_e, name_h = nil, name_k = nil, area = nil)
      pref = new

      pref.code    = code
      pref.name    = name
      pref.name_e  = name_e.capitalize
      pref.name_h  = name_h
      pref.name_k  = name_k
      pref.zips    = ZipMapping.data[code]
      pref.area    = area
      pref.type    =
        case pref.name[-1]
        when '都', '道', '府', '県'
          pref.name[-1]
        end

      pref
    end

    # すべての都道府県クラスを返す
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
    # @return [Array] 都道府県クラスの配列
    def self.all
      Mapping.data.map do |pref|
        names = pref[1]
        build(pref[0],
              names[:name], names[:name_e],
              names[:name_h], names[:name_k], names[:area])
      end
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
    # @param args [Hash<Symbol, String>] :name 漢字表記/:name_e 英語表記/:name_h ひらがな表記/:name_k カタカナ表記
    # @param args [Hash<Symbol, Integer>] :zip 郵便番号
    # @param args [Hash<Symbol, (String, Integer)>] :all_fields マッピングに定義しているすべてのフィールドから検索
    # @return [JpPrefecture::Prefecture] 都道府県が見つかった場合は都道府県クラス
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
  end
end
