# coding: utf-8
module JpPrefecture
  # このモジュールが include されると、prefecture メソッドを呼び出せるようになります。
  # prefecture メソッドを呼び出すと都道府県コードと名前が参照できます。
  #
  #   p = Place.new
  #   p.prefecture_code = 1
  #   p.prefecture
  #   # => #<JpPrefecture::Prefecture:0x007fd0a3d10f30 @code=1, @name="北海道"> >
  module Model
    def prefecture
      JpPrefecture::Prefecture.find(self.prefecture_code)
    end
  end
end
