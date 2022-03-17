# JpPrefecture

[**Japanese**](README.md)

[![Gem Version](http://img.shields.io/gem/v/jp_prefecture.svg?style=flat)](https://rubygems.org/gems/jp_prefecture)
[![GitHub Actions](https://github.com/chocoby/jp_prefecture/workflows/Build/badge.svg)](https://github.com/chocoby/jp_prefecture)
[![Coveralls](https://img.shields.io/coveralls/chocoby/jp_prefecture.svg)](https://coveralls.io/r/chocoby/jp_prefecture)

https://rubygems.org/gems/jp_prefecture

## Description

Convert prefecture code to prefecture name in Japan.

Based on JIS X 0402. Remove 0 when prefecture code start with 0.

```
Hokkaido: 01 -> 1
Tokyo: 13 -> 13
```

Reference(Japanese): [Wikipedia: 全国地方公共団体コード](http://ja.wikipedia.org/wiki/%E5%85%A8%E5%9B%BD%E5%9C%B0%E6%96%B9%E5%85%AC%E5%85%B1%E5%9B%A3%E4%BD%93%E3%82%B3%E3%83%BC%E3%83%89#.E9.83.BD.E9.81.93.E5.BA.9C.E7.9C.8C.E3.82.B3.E3.83.BC.E3.83.89)

You can change prefecture code and prefecture name's mapping data. Please check this [Customize mapping data](#customize-mapping-data)

Also available as a Rails plugin

## Usage

### Requirement

```ruby
require 'jp_prefecture'
```

### Search Prefecture by Code

Provide prefecture code to search prefecture's data

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

or

```ruby
JpPrefecture::Prefecture.find(code: 13)
```

### Search by Prefecture Name

Search for a prefecture by forward match.

```ruby
# Kanji
JpPrefecture::Prefecture.find(name: "東京都")
JpPrefecture::Prefecture.find(name: "東京")

# English
JpPrefecture::Prefecture.find(name_e: "Tokyo")
JpPrefecture::Prefecture.find(name_e: "tokyo")

# Romaji
JpPrefecture::Prefecture.find(name_r: "Tōkyō")
JpPrefecture::Prefecture.find(name_r: "tōkyō")

# Hiragana
JpPrefecture::Prefecture.find(name_h: "とうきょうと")

# Katakana
JpPrefecture::Prefecture.find(name_k: "トウキョウト")
```

Search all items in the mapping (not recommended).

```ruby
JpPrefecture::Prefecture.find(all_fields: "東京")
```

### All Prefectures

```ruby
JpPrefecture::Prefecture.all
# => [#<JpPrefecture::Prefecture:0x0000000112555ab0 @area="北海道", @code=1, @name="北海道", @name_e="Hokkaido", @name_h="ほっかいどう", @name_k="ホッカイドウ", @name_r="Hokkaidō", @type="道", @zips=[10000..70895, 400000..996509]>, ...]
```

### Usage on Rails (ActiveRecord)

Include JpPrefecture to Model which `ActiveRecord::Base` inherited.

app/models/place.rb:

```ruby
class Place < ActiveRecord::Base
  # prefecture_code:integer

  include JpPrefecture
  jp_prefecture :prefecture_code
end
```

By JpPrefecture included, `prefecture` method will be generated:

```ruby
place = Place.new
place.prefecture_code = 13
place.prefecture.name_e
# => "Tokyo"
```

Customize `prefecture` method name with `method_name` option:

```ruby
# model
jp_prefecture :prefecture_code, method_name: :pref

place = Place.new
place.prefecture_code = 13
place.pref.name_e
# => "Tokyo"
```

### Template usage

Use `collection_select` to generate selector in view:

```ruby
# Selector prefecture name in English
f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name_e

# Selector prefecture name in Japanese
f.collection_select :prefecture_code, JpPrefecture::Prefecture.all, :code, :name
```

### Migration

Set `prefecture_code` column type to `integer` or `string`.

Example:

```ruby
class AddPrefectureCodeToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :prefecture_code, :integer
  end
end
```

### Customize Mapping Data

Customize mapping data with `mapping_data`.

```ruby
custom_mapping_path = "/path/to/mapping_data.yml"

JpPrefecture.setup do |config|
  config.mapping_data = YAML.load_file(custom_mapping_path)
end
```

Check out [prefecture.yml](https://github.com/chocoby/jp_prefecture/blob/main/data/prefecture.yml) for data format.

### Customize Zip Code Data

Customize zip code data with `zip_mapping_data`.

```ruby
custom_zip_mapping_path = "/path/to/zip_mapping_data.yml"

JpPrefecture.setup do |config|
  config.zip_mapping_data = YAML.load_file(custom_zip_mapping_path)
end
```

Check out [zip.yml](https://github.com/chocoby/jp_prefecture/blob/main/data/zip.yml) for data format.


## Installation

Add this line in Gemfile.

```ruby
gem 'jp_prefecture'
```

Run

```
$ bundle
```

Or install gem with `gem install`

```
$ gem install jp_prefecture
```


## Documentation

[http://rdoc.info/github/chocoby/jp_prefecture/main/frames/index](http://rdoc.info/github/chocoby/jp_prefecture/main/frames/index)

## Supported versions

* Ruby: 2.4 - 3.1
* Rails: 5.0 - 7.0

If you are using an older Ruby/Rails version, please use [`v0.11.0`](https://github.com/chocoby/jp_prefecture/tree/0.x).

## Contributing

See [CONTRIBUTING.md](https://github.com/chocoby/jp_prefecture/blob/main/CONTRIBUTING.md).

## GitHub

https://github.com/chocoby/jp_prefecture
