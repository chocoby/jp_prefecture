# JpPrefecture

[**English**](README_EN.md)

[![Gem Version](http://img.shields.io/gem/v/jp_prefecture.svg?style=flat)](https://rubygems.org/gems/jp_prefecture)
[![GitHub Actions](https://github.com/chocoby/jp_prefecture/workflows/Build/badge.svg)](https://github.com/chocoby/jp_prefecture)
[![Coveralls](https://img.shields.io/coveralls/chocoby/jp_prefecture.svg)](https://coveralls.io/r/chocoby/jp_prefecture)

https://rubygems.org/gems/jp_prefecture

## jp_prefecture とは

都道府県コードと都道府県名を変換するライブラリです。

JIS X 0402 で定義されている都道府県コードをベースに、
ゼロから始まるものはゼロを削除して使用しています。

```
北海道: 01 -> 1
東京都: 13 -> 13
```

参考: [Wikipedia: 全国地方公共団体コード](http://ja.wikipedia.org/wiki/%E5%85%A8%E5%9B%BD%E5%9C%B0%E6%96%B9%E5%85%AC%E5%85%B1%E5%9B%A3%E4%BD%93%E3%82%B3%E3%83%BC%E3%83%89#.E9.83.BD.E9.81.93.E5.BA.9C.E7.9C.8C.E3.82.B3.E3.83.BC.E3.83.89)

都道府県コードと都道府県名のマッピングは変更することもできます。
詳しくは「都道府県のマッピング情報を変更する」の項目を参照してください。

また、Rails のプラグインとして使用することもできます。


## 使い方

### ライブラリの読み込み

```ruby
require 'jp_prefecture'
```

### 都道府県コードから都道府県を検索

都道府県コードを渡すと、都道府県コードから都道府県を検索します:

```ruby
pref = JpPrefecture::Prefecture.find(13)
# => #<JpPrefecture::Prefecture:0x00000001126b6558 @area="関東", @code=13, @name="東京都", @name_e="Tokyo", @name_h="とうきょうと", @name_k="トウキョウト", @name_r="Tōkyō", @type="都", @zips=[1000000..2080035]>
pref.code
# => 13
pref.name
# => "東京都"
pref.name_e
# => "Tokyo"
pref.name_r
# => "Tōkyō"
pref.name_h
# => "とうきょうと"
pref.name_k
# => "トウキョウト"
pref.area
# => "関東"
pref.type
# => "都"
```

以下のように書くことも可能です:

```ruby
JpPrefecture::Prefecture.find(code: 13)
```

### 都道府県を検索

前方一致で都道府県を検索します:

```ruby
# 漢字表記
JpPrefecture::Prefecture.find(name: "東京都")
JpPrefecture::Prefecture.find(name: "東京")

# 英語表記
JpPrefecture::Prefecture.find(name_e: "Tokyo")
JpPrefecture::Prefecture.find(name_e: "tokyo")

# ローマ字表記
JpPrefecture::Prefecture.find(name_r: "Tōkyō")
JpPrefecture::Prefecture.find(name_r: "tōkyō")

# ひらがな表記
JpPrefecture::Prefecture.find(name_h: "とうきょうと")

# カタカナ表記
JpPrefecture::Prefecture.find(name_k: "トウキョウト")
```

マッピングのすべての項目を検索します (推奨しません):

```ruby
JpPrefecture::Prefecture.find(all_fields: "東京")
```

### 都道府県の一覧を取得

```ruby
JpPrefecture::Prefecture.all
# => [#<JpPrefecture::Prefecture:0x0000000112555ab0 @area="北海道", @code=1, @name="北海道", @name_e="Hokkaido", @name_h="ほっかいどう", @name_k="ホッカイドウ", @name_r="Hokkaidō", @type="道", @zips=[10000..70895, 400000..996509]>, ...]
```

### Rails (ActiveRecord) で使用する

`ActiveRecord::Base` を継承した Model で、都道府県コードを扱うことができます。

app/models/place.rb:

```ruby
class Place < ActiveRecord::Base
  # prefecture_code:integer

  include JpPrefecture
  jp_prefecture :prefecture_code
end
```

`prefecture` というメソッドが生成され、都道府県コード、都道府県名が参照できるようになります:

```ruby
place = Place.new
place.prefecture_code = 13
place.prefecture.name
# => "東京都"
```

生成されるメソッド名は `method_name` というオプションで指定することができます:

```ruby
# model
jp_prefecture :prefecture_code, method_name: :pref

place = Place.new
place.prefecture_code = 13
place.pref.name
# => "東京都"
```

### テンプレートで使用する

`collection_select` を使用して、都道府県のセレクトボックスを生成することができます。:

```ruby
f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name

# 英語表記で出力
f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name_e
```

### マイグレーション

カラムのタイプは `integer` か `string` で作成してください。

マイグレーションのサンプル:

```ruby
class AddPrefectureCodeToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :prefecture_code, :integer
  end
end
```

### 都道府県のマッピング情報を変更する

デフォルトのマッピング情報以外のものを使用したい場合、以下のようにカスタマイズされた
マッピングデータを指定することができます:

```ruby
custom_mapping_path = "/path/to/mapping_data.yml"

JpPrefecture.setup do |config|
  config.mapping_data = YAML.load_file(custom_mapping_path)
end
```

マッピングデータのフォーマットについては [prefecture.yml](https://github.com/chocoby/jp_prefecture/blob/main/data/prefecture.yml) を参考にしてください。

### 郵便番号の情報を変更する

```ruby
custom_zip_mapping_path = "/path/to/zip_mapping_data.yml"

JpPrefecture.setup do |config|
  config.zip_mapping_data = YAML.load_file(custom_zip_mapping_path)
end
```

データのフォーマットについては [zip.yml](https://github.com/chocoby/jp_prefecture/blob/main/data/zip.yml) を参考にしてください。


## インストール

以下の行を `Gemfile` に記述してから:

```ruby
gem 'jp_prefecture'
```

`bundle` を実行してください。

または、手動でインストールしてください:

```
$ gem install jp_prefecture
```


## ドキュメント

[http://rdoc.info/github/chocoby/jp_prefecture/main/frames/index](http://rdoc.info/github/chocoby/jp_prefecture/main/frames/index)

## サポートしているバージョン

* Ruby: 2.4 - 3.1
* Rails: 5.0 - 7.0

これより古い Ruby/Rails バージョンを使用する場合は、[`v0.11.0`](https://github.com/chocoby/jp_prefecture/tree/0.x) を利用してください。

## Contributing

[CONTRIBUTING.md](https://github.com/chocoby/jp_prefecture/blob/main/CONTRIBUTING.md) を確認してください。

## GitHub

https://github.com/chocoby/jp_prefecture
