# coding: utf-8

module JpPrefecture
  # 都道府県のコードと名前を扱うクラス
  class Prefecture
    include JpPrefecture::Mapping

    attr_accessor :code, :name

    # 配列から都道府県クラスを生成
    #
    # @example
    #   # コード/名前から都道府県クラスを生成
    #   JpPrefecture::Prefecture.build [1, '北海道']
    #
    # @param pref [Array] コード/名前の配列
    def self.build(pref)
      p = self.new
      p.code = pref[0]
      p.name = pref[1]

      p
    end

    # 都道府県コードから都道府県を検索
    #
    # @example
    #   JpPrefecture::Prefecture.find 1
    #
    # @param code [Integer] 都道府県コード
    # @return [JpPrefecture::Prefecture] 都道府県が見つかった場合は都道府県クラス
    # @return [nil] 都道府県が見つからない場合は nil
    def self.find(code)
      name = PREFECTURE_CODE_NAME[code]
      return nil unless name

      self.build([code, name])
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
    # @return [Array] 都道府県クラスの配列
    def self.all
      PREFECTURE_CODE_NAME.map do |pref|
        self.build(pref)
      end
    end
  end
end
