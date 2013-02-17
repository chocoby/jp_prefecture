# JpPrefecture

https://rubygems.org/gems/jp_prefecture

## jp_prefecture とは

都道府県コードと都道府県名を変換するライブラリです。

JIS X 0402 で定義されている都道府県コードをベースに、
ゼロから始まるものはゼロを削除して使用しています。

    北海道: 01 -> 1
    東京都: 13 -> 13

参考: [Wikipedia: 全国地方公共団体コード](http://ja.wikipedia.org/wiki/%E5%85%A8%E5%9B%BD%E5%9C%B0%E6%96%B9%E5%85%AC%E5%85%B1%E5%9B%A3%E4%BD%93%E3%82%B3%E3%83%BC%E3%83%89#.E9.83.BD.E9.81.93.E5.BA.9C.E7.9C.8C.E3.82.B3.E3.83.BC.E3.83.89)

また、Rails のプラグインとして使用することもできます。

## インストール方法

Gemfile に記述してインストールするか:

    gem 'jp_prefecture'

    $ bundle

手動でインストールしてください:

    $ gem install jp_prefecture

## 使い方

### 都道府県コードから都道府県名を取得

    pref = JpPrefecture::Prefecture.find 13
    # => #<JpPrefecture::Prefecture:0x007fd0a3d43fe8 @code=13, @name="東京都">
    pref.code
    # => 13
    pref.name
    # => "東京都"

### 都道府県の一覧を取得

    JpPrefecture::Prefecture.all
    # => [#<JpPrefecture::Prefecture:0x007fd0a3d78d38 @code=1, @name="北海道">, ...]

### ActiveRecord で使用する

`ActiveRecord::Base` を継承した Model に include し、`jp_prefecture` を呼び出すことで、
都道府県コードを扱うことができます。

app/models/place.rb:

    class Place < ActiveRecord::Base
      # prefecture_code:integer

      include JpPrefecture
      jp_prefecture :prefecture_code
    end

`prefecture` というメソッドが生成され、都道府県コード、都道府県名が参照できるようになります。:

    place = Place.new
    place.prefecture_code = 13
    place.prefecture.name
    # => "東京都"

### テンプレートで使用する

`collection_select` を使用して、都道府県のセレクトボックスを生成することができます。:

    f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name

## ドキュメント

[http://rdoc.info/github/chocoby/jp_prefecture/master/frames/index](http://rdoc.info/github/chocoby/jp_prefecture/master/frames/index)

## TODO

* 生成するメソッド名を指定できるようにする
  * 現在は `prefecture` 固定
* バリデーター
* i18n?(tokyo などの文字列に対応)
* ドキュメントを書く
* JIS X 0402 で定義されている正規のコードをサポート？

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
