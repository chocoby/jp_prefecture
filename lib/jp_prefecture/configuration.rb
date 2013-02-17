# coding: utf-8
module JpPrefecture
  class Configuration
    # モデルクラス
    # @return ActiveRecord::Base
    attr_accessor :model_class

    # 変換対象のカラム
    # @return [Symbol]
    attr_accessor :column_name

    def initialize(model_class)
      @model_class = model_class
    end

    private

    # オプションをセットする
    def set(values)
      values && values.each { |name, value| self.send :"#{name}=", value }
    end
  end
end
