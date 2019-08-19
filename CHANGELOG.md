## Unreleased

## 0.10.0 (Aug 19, 2019)

* Rails 6.0 をサポート (PR [#33](https://github.com/chocoby/jp_prefecture/pull/33)/[@chocoby](https://github.com/chocoby))

## 0.9.0 (Jan 15, 2017)

* Add English Readme (Issue [#21](https://github.com/chocoby/jp_prefecture/issues/21)/PR [#22](https://github.com/chocoby/jp_prefecture/pull/22)/[@PeterTeng](https://github.com/PeterTeng))
* 都道府県情報に種類を追加 (PR [#23](https://github.com/chocoby/jp_prefecture/pull/23)/[@gazayas](https://github.com/gazayas))

## 0.8.1 (Mar 30, 2016)

* `JpPrefecture::Prefecture.find(name: name)` に `nil` や空文字を渡した時に `nil` を返す (Issue [#18](https://github.com/chocoby/jp_prefecture/issues/18)/PR [#19](https://github.com/chocoby/jp_prefecture/pull/19)/[@k-motoyan](https://github.com/k-motoyan))

## 0.8.0 (Sep 07, 2014)

* 都道府県情報に八地方区分情報を追加 (PR [#14](https://github.com/chocoby/jp_prefecture/pull/14)/[@kkosuge](https://github.com/kkosuge))

## 0.7.0 (Jun 18, 2014)

* 都道府県名にひらがな、カタカナを追加 (PR [#12](https://github.com/chocoby/jp_prefecture/pull/12)/[@yukihr](https://github.com/yukihr))

## 0.6.0 (Mar 10, 2014)

* 都道府県名を前方一致で検索できるようにした (PR [#11](https://github.com/chocoby/jp_prefecture/pull/11)/[@yuuna](https://github.com/yuuna))
* 都道府県名の検索ロジックを高速化

## 0.5.0 (Nov 30, 2013)

* 郵便番号から都道府県を検索する機能の追加 (PR [#9](https://github.com/chocoby/jp_prefecture/pull/9)/[@fruwe](https://github.com/fruwe))

## 0.4.0 (Jul 08, 2013)

* 都道府県のマッピングを変更する機能の追加 (PR [#8](https://github.com/chocoby/jp_prefecture/pull/8)/[@mizoR](https://github.com/mizoR))

## 0.3.2 (Jun 12, 2013)

* 文字列を downcase してから都道府県の検索を行うようにした

## 0.3.1 (Jun 11, 2013)

* name で渡した文字列が変更されるバグを修正

## 0.3.0 (Jun 11, 2013)

* 都道府県名(英語表記含む)から都道府県を検索できるようにした
* 都道府県名からの検索と同様の方法で、都道府県コードを検索できるようにした
* String 型の都道府県コードに対応

## 0.2.0 (Jun 09, 2013)

* 英語表記を追加
* Ruby 1.8.7 のサポートを終了

## 0.1.1 (Mar 01, 2013)

* モデルで使用する時に、生成するメソッド名を指定できるようにした
* Configuration モデル/Model モジュールを廃止
* extend による使用を廃止
* Travis CI によるテストを行うようにした

## 0.1.0 (Feb 17, 2013)

* モデルで使用する時に、対象のカラム名を指定するようにした

## 0.0.1 (Feb 14, 2013)

* 都道府県の変換
* 簡単な Rails サポート
