# JpPrefecture

[![Gem Version](http://img.shields.io/gem/v/jp_prefecture.svg?style=flat)](https://rubygems.org/gems/jp_prefecture)
[![Build Status](http://img.shields.io/travis/chocoby/jp_prefecture/master.svg?style=flat)](https://travis-ci.org/chocoby/jp_prefecture)
[![Coveralls](https://img.shields.io/coveralls/chocoby/jp_prefecture.svg)](https://coveralls.io/r/chocoby/jp_prefecture)
[![Code Climate](https://img.shields.io/codeclimate/github/chocoby/jp_prefecture.svg)](https://codeclimate.com/github/chocoby/jp_prefecture)
[![Dependency Status](http://img.shields.io/gemnasium/chocoby/jp_prefecture.svg?style=flat)](https://gemnasium.com/chocoby/jp_prefecture)

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
pref = JpPrefecture::Prefecture.find 13
# => #<JpPrefecture::Prefecture:0x007fceb11927d8 @code=13, @name="東京都", @name_e="Tokyo", @name_h="とうきょうと", @name_k="トウキョウト", @zips=[1000000..2080035], @area="関東">
pref.code
# => 13
pref.name
# => "東京都"
pref.name_e
# => "Tokyo"
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
JpPrefecture::Prefecture.find code: 13
```

### Search by Prefecture Name

```ruby
JpPrefecture::Prefecture.find name: "東京都"
JpPrefecture::Prefecture.find name: "Tokyo"
JpPrefecture::Prefecture.find name: "tokyo"
JpPrefecture::Prefecture.find name: "トウキョウト"
JpPrefecture::Prefecture.find name: "とうきょうと"
JpPrefecture::Prefecture.find name: "東京"
```

### All Prefectures

```ruby
JpPrefecture::Prefecture.all
# => [#<JpPrefecture::Prefecture:0x007fceb119a2a8 @code=1, @name="北海道", @name_e="Hokkaido", @name_h="ほっかいどう", @name_k="ホッカイドウ", @zips=[10000..70895, 400000..996509], @area="北海道">, ...]
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

Customize mapping data with `custom_mapping_path`.

```ruby
custom_mapping_path = "..." # /path/to/mapping_data

JpPrefecture.setup do |config|
  config.mapping_data = YAML.load_file custom_mapping_path
end
```

Check out [prefecture.yml](https://github.com/chocoby/jp_prefecture/blob/master/data/prefecture.yml) for data format.


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

[http://rdoc.info/github/chocoby/jp_prefecture/master/frames/index](http://rdoc.info/github/chocoby/jp_prefecture/master/frames/index)

## Supports

* Ruby: 1.9.3 / 2.0.0 / 2.1 / 2.2 / 2.3
* Rails: 3.2 / 4.0 / 4.1 / 4.2 / 5.0


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Test

```
git clone https://github.com/chocoby/jp_prefecture.git
cd jp_prefecture
bundle install --path .bundle
bundle exec rspec
```

Run test in multiple `ActiveRecord` versions

```
bundle exec appraisal install
bundle exec appraisal rake spec
```


## GitHub

https://github.com/chocoby/jp_prefecture
