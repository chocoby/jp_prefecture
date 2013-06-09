# coding: utf-8
module JpPrefecture
  module Base
    # モデル内で使用するための設定を行う
    #
    # 変換対象のカラムを指定する:
    #
    #   class Place < ActiveRecord::Base
    #     include JpPrefecture
    #     jp_prefecture :prefecture_code
    #   end
    #
    #   p = Place.new
    #   p.prefecture_code = 1
    #   p.prefecture
    #   # => #<JpPrefecture::Prefecture:0x007fd0a3d10f30 @code=1, @name="北海道", @name_e="Hokkaido">
    #
    # 生成するメソッド名は method_name で指定する:
    #
    #   class Place < ActiveRecord::Base
    #     include JpPrefecture
    #     jp_prefecture :prefecture_code, method_name: :pref
    #   end
    #
    #   p = Place.new
    #   p.prefecture_code = 1
    #   p.pref
    #   # => #<JpPrefecture::Prefecture:0x007fcb8444dcc8 @code=1, @name="北海道", @name_e="Hokkaido">
    #
    # @param [Symbol] column_name 変換対象のカラム
    # @option options [Symbol] :method_name 生成するメソッド名。デフォルト: +:prefecture+
    def jp_prefecture(column_name, options = {})
      column_name = column_name.to_sym if column_name.is_a?(String)
      method_name = options[:method_name] || :prefecture

      define_method method_name do
        JpPrefecture::Prefecture.find(self.send(column_name))
      end
    end
  end
end
