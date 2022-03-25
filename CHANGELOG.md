## Unreleased

## 1.1.1 (2022-03-25)

### Bug fix

* マッピングに項目が存在しない場合にエラーが発生する問題を修正 (PR [#59](https://github.com/chocoby/jp_prefecture/pull/59)/[@chocoby](https://github.com/chocoby))

## 1.1.0 (2022-03-17)

### Features

* 都道府県情報にローマ字表記を追加 (PR [#57](https://github.com/chocoby/jp_prefecture/pull/57)/[@sondh5](https://github.com/sondh5))
* Ruby 3.1 をサポートに追加 (PR [#54](https://github.com/chocoby/jp_prefecture/pull/54)/[@chocoby](https://github.com/chocoby))
* Rails 7.0 をサポート (PR [#55](https://github.com/chocoby/jp_prefecture/pull/55)/[@chocoby](https://github.com/chocoby))

## 1.0.0 (2021-02-24)

### Misc

* 毎週月曜日の 09:00 (JST) にテストを実行する (PR [#52](https://github.com/chocoby/jp_prefecture/pull/52)/[@chocoby](https://github.com/chocoby))

## 1.0.0.rc1 (2021-02-10)

### Breaking changes

* Ruby 1.9.3 - 2.3/Rails 3.2 - 4.2 のサポートを終了 (PR [#39](https://github.com/chocoby/jp_prefecture/pull/39)/[@chocoby](https://github.com/chocoby))

  古い Ruby/Rails のサポートを終了しました。今後も大きな不具合が見つかった場合、可能な限りは対応する予定です。

  サポートするバージョンの範囲は Ruby/Rails のメンテナンスポリシーに則るのがシンプルですが、この Gem では厳しくする必要はないと考えています。
  Ruby/Rails のメンテナンスポリシーで決められているバージョンは最低限サポートし、実装やテストのメンテナンスが困難になったバージョンからサポートを終了する方針で検討しています。ご意見があればください。

* 文字列による検索は項目を指定して検索する (Issue [#24](https://github.com/chocoby/jp_prefecture/issues/24), [#27](https://github.com/chocoby/jp_prefecture/issues/27)/PR [#43](https://github.com/chocoby/jp_prefecture/pull/43)/[@chocoby](https://github.com/chocoby))

  `JpPrefecture::Prefecture.find(name: '東')` を実行すると、青森県が取得されていた問題への対応です。これはマッピングのすべての項目を検索していたためです。
  対応として、`name` を指定した場合は漢字表記、`name_e` は英語表記など、指定した項目のみを検索するように変更しました。詳しい使い方は README を参照してください。
  以前のように、すべての項目から検索したい場合は `JpPrefecture::Prefecture.find(all_fields: 'string')` を使用してください。

### Features

* Ruby 3.0 をサポートに追加 (PR [#42](https://github.com/chocoby/jp_prefecture/pull/42)/[@chocoby](https://github.com/chocoby))
* 郵便番号データを更新 (PR [#46](https://github.com/chocoby/jp_prefecture/pull/46)/[@chocoby](https://github.com/chocoby))
* `JpPrefecture::Prefecture` クラスに都道府県コードから都道府県インスタンスを作成する `build_by_code` メソッドを追加 (PR [#44](https://github.com/chocoby/jp_prefecture/pull/44)/[@chocoby](https://github.com/chocoby))

  都道府県コードを指定すると、それに対応した都道府県の `JpPrefecture::Prefecture` インスタンスを取得するメソッドを追加しました。
  `JpPrefecture::Prefecture.build` メソッドは参照している処理がなくなったため、削除しました。

### Documentation

* CONTRIBUTING.md を追加 (PR [#41](https://github.com/chocoby/jp_prefecture/pull/41)/[@chocoby](https://github.com/chocoby))

### Misc

* RuboCop を導入 (PR [#40](https://github.com/chocoby/jp_prefecture/pull/40)/[@chocoby](https://github.com/chocoby))
* Gem に含めるファイルを最低限のものにする (PR [#48](https://github.com/chocoby/jp_prefecture/pull/48)/[@chocoby](https://github.com/chocoby))

## 0.11.0 (2020-12-18)

* Rails 6.1 をサポート (PR [#37](https://github.com/chocoby/jp_prefecture/pull/37)/[@chocoby](https://github.com/chocoby))
* GitHub Actions でビルドを実行するようにした (PR [#34](https://github.com/chocoby/jp_prefecture/pull/34)/[@chocoby](https://github.com/chocoby))

## 0.10.0 (2019-08-19)

* Rails 6.0 をサポート (PR [#33](https://github.com/chocoby/jp_prefecture/pull/33)/[@chocoby](https://github.com/chocoby))

## 0.9.0 (2017-01-15)

* Add English Readme (Issue [#21](https://github.com/chocoby/jp_prefecture/issues/21)/PR [#22](https://github.com/chocoby/jp_prefecture/pull/22)/[@PeterTeng](https://github.com/PeterTeng))
* 都道府県情報に種類を追加 (PR [#23](https://github.com/chocoby/jp_prefecture/pull/23)/[@gazayas](https://github.com/gazayas))

## 0.8.1 (2016-03-30)

* `JpPrefecture::Prefecture.find(name: name)` に `nil` や空文字を渡した時に `nil` を返す (Issue [#18](https://github.com/chocoby/jp_prefecture/issues/18)/PR [#19](https://github.com/chocoby/jp_prefecture/pull/19)/[@k-motoyan](https://github.com/k-motoyan))

## 0.8.0 (2014-09-07)

* 都道府県情報に八地方区分情報を追加 (PR [#14](https://github.com/chocoby/jp_prefecture/pull/14)/[@kkosuge](https://github.com/kkosuge))

## 0.7.0 (2014-06-18)

* 都道府県名にひらがな、カタカナを追加 (PR [#12](https://github.com/chocoby/jp_prefecture/pull/12)/[@yukihr](https://github.com/yukihr))

## 0.6.0 (2014-03-10)

* 都道府県名を前方一致で検索できるようにした (PR [#11](https://github.com/chocoby/jp_prefecture/pull/11)/[@yuuna](https://github.com/yuuna))
* 都道府県名の検索ロジックを高速化

## 0.5.0 (2013-11-30)

* 郵便番号から都道府県を検索する機能の追加 (PR [#9](https://github.com/chocoby/jp_prefecture/pull/9)/[@fruwe](https://github.com/fruwe))

## 0.4.0 (2013-07-08)

* 都道府県のマッピングを変更する機能の追加 (PR [#8](https://github.com/chocoby/jp_prefecture/pull/8)/[@mizoR](https://github.com/mizoR))

## 0.3.2 (2013-06-12)

* 文字列を downcase してから都道府県の検索を行うようにした

## 0.3.1 (2013-06-11)

* name で渡した文字列が変更されるバグを修正

## 0.3.0 (2013-06-11)

* 都道府県名(英語表記含む)から都道府県を検索できるようにした
* 都道府県名からの検索と同様の方法で、都道府県コードを検索できるようにした
* String 型の都道府県コードに対応

## 0.2.0 (2013-06-09)

* 英語表記を追加
* Ruby 1.8.7 のサポートを終了

## 0.1.1 (2013-03-01)

* モデルで使用する時に、生成するメソッド名を指定できるようにした
* Configuration モデル/Model モジュールを廃止
* extend による使用を廃止
* Travis CI によるテストを行うようにした

## 0.1.0 (2013-02-17)

* モデルで使用する時に、対象のカラム名を指定するようにした

## 0.0.1 (2013-02-14)

* 都道府県の変換
* 簡単な Rails サポート
