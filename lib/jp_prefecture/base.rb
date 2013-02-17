# coding: utf-8
require "jp_prefecture/model"

module JpPrefecture
  module Base
    # モデル内の設定を行う
    #
    # 第 1 引数には変換対象のカラムを指定する:
    #
    #   class Place < ActiveRecord::Base
    #     include JpPrefecture
    #     jp_prefecture :prefecture_code
    #   end
    #
    # @param [Symbol] column_name 変換対象のカラム
    def jp_prefecture(column_name, options = {})
      column_name = column_name.to_sym if column_name.is_a?(String)
      options.merge!(:column_name => column_name)
      jp_prefecture_config.send(:set, options)

      include JpPrefecture::Model
    end

    # モデルクラスの設定を返す
    #
    # @return [JpPrefecture::Configuration]
    def jp_prefecture_config
      @jp_prefecture_config
    end
  end
end
