# Changelog

## [Unreleased]

## [1.2.0] - 2026-08-11

### Added

- Rails 8.1 をサポートに追加 ([#78](https://github.com/chocoby/jp_prefecture/pull/78), [@chocoby](https://github.com/chocoby))
- Ruby 4.0 をサポートに追加 ([#80](https://github.com/chocoby/jp_prefecture/pull/80), [@chocoby](https://github.com/chocoby))
- 前方一致するすべての都道府県を返す `JpPrefecture::Prefecture.where` を追加 ([#90](https://github.com/chocoby/jp_prefecture/pull/90), [@chocoby](https://github.com/chocoby))

### Changed

- RuboCop の `TargetRubyVersion` を RuboCop がサポートする Ruby 2.7 に変更 ([#75](https://github.com/chocoby/jp_prefecture/pull/75), [@chocoby](https://github.com/chocoby))
- Dependabot で GitHub Actions を更新する ([#76](https://github.com/chocoby/jp_prefecture/pull/76), [@chocoby](https://github.com/chocoby))
- テストする Ruby/Rails の組み合わせを代表的なものに絞る ([#82](https://github.com/chocoby/jp_prefecture/pull/82), [@chocoby](https://github.com/chocoby))
- 郵便番号データを毎月更新するワークフローを追加 ([#85](https://github.com/chocoby/jp_prefecture/pull/85), [#93](https://github.com/chocoby/jp_prefecture/pull/93), [@chocoby](https://github.com/chocoby))
- リリース時に RubyGems へ gem を自動公開する ([#88](https://github.com/chocoby/jp_prefecture/pull/88), [@chocoby](https://github.com/chocoby))
- CHANGELOG を Keep a Changelog 形式に変更 ([#91](https://github.com/chocoby/jp_prefecture/pull/91), [@chocoby](https://github.com/chocoby))
- Pull Request テンプレートを追加 ([#92](https://github.com/chocoby/jp_prefecture/pull/92), [@chocoby](https://github.com/chocoby))
- 開発用の対話コンソール `bin/console` を追加し、CONTRIBUTING.md の開発手順を整備 ([#96](https://github.com/chocoby/jp_prefecture/pull/96), [@chocoby](https://github.com/chocoby))
- RuboCop の `.rubocop_todo.yml` を削除し、`rubocop-performance` と `rubocop-rake` を有効化 ([#97](https://github.com/chocoby/jp_prefecture/pull/97), [@chocoby](https://github.com/chocoby))

### Deprecated

- `JpPrefecture::Prefecture.find` に対応していない引数を渡した場合に非推奨の警告を表示 ([#94](https://github.com/chocoby/jp_prefecture/pull/94), [@chocoby](https://github.com/chocoby))

  未知のフィールド名、複数キー、空の Hash、`nil` キーを渡した場合が対象です。v2.0.0 以降は `ArgumentError` を発生させる予定です。

### Fixed

- カスタムの `zip_mapping_data` で範囲検索が動作しない問題を修正 ([#83](https://github.com/chocoby/jp_prefecture/pull/83), [@chocoby](https://github.com/chocoby))
- `ken_all.zip` のダウンロード URL を修正/郵便番号データ更新 ([#84](https://github.com/chocoby/jp_prefecture/pull/84), [#86](https://github.com/chocoby/jp_prefecture/pull/86), [@chocoby](https://github.com/chocoby))
- 都道府県名の検索で String 以外の値を渡すとエラーになる問題を修正 ([#89](https://github.com/chocoby/jp_prefecture/pull/89), [@chocoby](https://github.com/chocoby))

## [1.1.2] - 2025-02-24

### Added

- Ruby 3.2 をサポートに追加 ([#61](https://github.com/chocoby/jp_prefecture/pull/61), [@chocoby](https://github.com/chocoby))
- Rails 7.1 をサポートに追加 ([#63](https://github.com/chocoby/jp_prefecture/pull/63), [@chocoby](https://github.com/chocoby))
- Ruby 3.3 をサポートに追加 ([#64](https://github.com/chocoby/jp_prefecture/pull/64), [@chocoby](https://github.com/chocoby))
- Rails 7.2 をサポートに追加 ([#65](https://github.com/chocoby/jp_prefecture/pull/65), [@y-yagi](https://github.com/y-yagi))
- Ruby 3.4 をサポートに追加 ([#67](https://github.com/chocoby/jp_prefecture/pull/67), [@chocoby](https://github.com/chocoby))
- Rails 8.0 をサポートに追加 ([#68](https://github.com/chocoby/jp_prefecture/pull/68), [@chocoby](https://github.com/chocoby))

### Changed

- 郵便番号データの更新 ([#74](https://github.com/chocoby/jp_prefecture/pull/74), [@chocoby](https://github.com/chocoby))
- 都道府県コードの参照先を `JIS X 0401` に修正 ([#71](https://github.com/chocoby/jp_prefecture/pull/71), [@ydah](https://github.com/ydah))
- RuboCop の警告を修正 ([#69](https://github.com/chocoby/jp_prefecture/pull/69), [@ydah](https://github.com/ydah))
- appraisal gem の依存を削除 ([#73](https://github.com/chocoby/jp_prefecture/pull/73), [@chocoby](https://github.com/chocoby))

### Fixed

- `bundle exec rake create_zip_code_data` 実行時のランタイムエラーを修正/郵便番号データ更新 ([#70](https://github.com/chocoby/jp_prefecture/pull/70), [@ydah](https://github.com/ydah))
- concurrent-ruby gem v1.3.5 で `logger` の依存が削除されたことへの対応 ([#72](https://github.com/chocoby/jp_prefecture/pull/72), [@chocoby](https://github.com/chocoby))

## [1.1.1] - 2022-03-25

### Fixed

- マッピングに項目が存在しない場合にエラーが発生する問題を修正 ([#59](https://github.com/chocoby/jp_prefecture/pull/59), [@chocoby](https://github.com/chocoby))

## [1.1.0] - 2022-03-17

### Added

- 都道府県情報にローマ字表記を追加 ([#57](https://github.com/chocoby/jp_prefecture/pull/57), [@sondh5](https://github.com/sondh5))
- Ruby 3.1 をサポートに追加 ([#54](https://github.com/chocoby/jp_prefecture/pull/54), [@chocoby](https://github.com/chocoby))
- Rails 7.0 をサポート ([#55](https://github.com/chocoby/jp_prefecture/pull/55), [@chocoby](https://github.com/chocoby))

## [1.0.0] - 2021-02-24

### Changed

- 毎週月曜日の 09:00 (JST) にテストを実行する ([#52](https://github.com/chocoby/jp_prefecture/pull/52), [@chocoby](https://github.com/chocoby))

## [1.0.0.rc1] - 2021-02-10

### Added

- Ruby 3.0 をサポートに追加 ([#42](https://github.com/chocoby/jp_prefecture/pull/42), [@chocoby](https://github.com/chocoby))
- `JpPrefecture::Prefecture` クラスに都道府県コードから都道府県インスタンスを作成する `build_by_code` メソッドを追加 ([#44](https://github.com/chocoby/jp_prefecture/pull/44), [@chocoby](https://github.com/chocoby))

  都道府県コードを指定すると、それに対応した都道府県の `JpPrefecture::Prefecture` インスタンスを取得するメソッドを追加しました。
  `JpPrefecture::Prefecture.build` メソッドは参照している処理がなくなったため、削除しました。

### Changed

- 文字列による検索は項目を指定して検索する ([#43](https://github.com/chocoby/jp_prefecture/pull/43), [#24](https://github.com/chocoby/jp_prefecture/issues/24), [#27](https://github.com/chocoby/jp_prefecture/issues/27), [@chocoby](https://github.com/chocoby))

  `JpPrefecture::Prefecture.find(name: '東')` を実行すると、青森県が取得されていた問題への対応です。これはマッピングのすべての項目を検索していたためです。
  対応として、`name` を指定した場合は漢字表記、`name_e` は英語表記など、指定した項目のみを検索するように変更しました。詳しい使い方は README を参照してください。
  以前のように、すべての項目から検索したい場合は `JpPrefecture::Prefecture.find(all_fields: 'string')` を使用してください。

- 郵便番号データを更新 ([#46](https://github.com/chocoby/jp_prefecture/pull/46), [@chocoby](https://github.com/chocoby))
- CONTRIBUTING.md を追加 ([#41](https://github.com/chocoby/jp_prefecture/pull/41), [@chocoby](https://github.com/chocoby))
- RuboCop を導入 ([#40](https://github.com/chocoby/jp_prefecture/pull/40), [@chocoby](https://github.com/chocoby))
- Gem に含めるファイルを最低限のものにする ([#48](https://github.com/chocoby/jp_prefecture/pull/48), [@chocoby](https://github.com/chocoby))

### Removed

- Ruby 1.9.3 - 2.3/Rails 3.2 - 4.2 のサポートを終了 ([#39](https://github.com/chocoby/jp_prefecture/pull/39), [@chocoby](https://github.com/chocoby))

  古い Ruby/Rails のサポートを終了しました。今後も大きな不具合が見つかった場合、可能な限りは対応する予定です。

  サポートするバージョンの範囲は Ruby/Rails のメンテナンスポリシーに則るのがシンプルですが、この Gem では厳しくする必要はないと考えています。
  Ruby/Rails のメンテナンスポリシーで決められているバージョンは最低限サポートし、実装やテストのメンテナンスが困難になったバージョンからサポートを終了する方針で検討しています。ご意見があればください。

## [0.11.0] - 2020-12-18

- Rails 6.1 をサポート ([#37](https://github.com/chocoby/jp_prefecture/pull/37), [@chocoby](https://github.com/chocoby))
- GitHub Actions でビルドを実行するようにした ([#34](https://github.com/chocoby/jp_prefecture/pull/34), [@chocoby](https://github.com/chocoby))

## [0.10.0] - 2019-08-19

- Rails 6.0 をサポート ([#33](https://github.com/chocoby/jp_prefecture/pull/33), [@chocoby](https://github.com/chocoby))

## [0.9.0] - 2017-01-15

- Add English Readme ([#22](https://github.com/chocoby/jp_prefecture/pull/22), [#21](https://github.com/chocoby/jp_prefecture/issues/21), [@PeterTeng](https://github.com/PeterTeng))
- 都道府県情報に種類を追加 ([#23](https://github.com/chocoby/jp_prefecture/pull/23), [@gazayas](https://github.com/gazayas))

## [0.8.1] - 2016-03-30

- `JpPrefecture::Prefecture.find(name: name)` に `nil` や空文字を渡した時に `nil` を返す ([#19](https://github.com/chocoby/jp_prefecture/pull/19), [#18](https://github.com/chocoby/jp_prefecture/issues/18), [@k-motoyan](https://github.com/k-motoyan))

## [0.8.0] - 2014-09-07

- 都道府県情報に八地方区分情報を追加 ([#14](https://github.com/chocoby/jp_prefecture/pull/14), [@kkosuge](https://github.com/kkosuge))

## [0.7.0] - 2014-06-18

- 都道府県名にひらがな、カタカナを追加 ([#12](https://github.com/chocoby/jp_prefecture/pull/12), [@yukihr](https://github.com/yukihr))

## [0.6.0] - 2014-03-10

- 都道府県名を前方一致で検索できるようにした ([#11](https://github.com/chocoby/jp_prefecture/pull/11), [@yuuna](https://github.com/yuuna))
- 都道府県名の検索ロジックを高速化

## [0.5.0] - 2013-11-30

- 郵便番号から都道府県を検索する機能の追加 ([#9](https://github.com/chocoby/jp_prefecture/pull/9), [@fruwe](https://github.com/fruwe))

## [0.4.0] - 2013-07-08

- 都道府県のマッピングを変更する機能の追加 ([#8](https://github.com/chocoby/jp_prefecture/pull/8), [@mizoR](https://github.com/mizoR))

## [0.3.2] - 2013-06-12

- 文字列を downcase してから都道府県の検索を行うようにした

## [0.3.1] - 2013-06-11

- name で渡した文字列が変更されるバグを修正

## [0.3.0] - 2013-06-11

- 都道府県名(英語表記含む)から都道府県を検索できるようにした
- 都道府県名からの検索と同様の方法で、都道府県コードを検索できるようにした
- String 型の都道府県コードに対応

## [0.2.0] - 2013-06-09

- 英語表記を追加
- Ruby 1.8.7 のサポートを終了

## [0.1.1] - 2013-03-01

- モデルで使用する時に、生成するメソッド名を指定できるようにした
- Configuration モデル/Model モジュールを廃止
- extend による使用を廃止
- Travis CI によるテストを行うようにした

## [0.1.0] - 2013-02-17

- モデルで使用する時に、対象のカラム名を指定するようにした

## [0.0.1] - 2013-02-14

- 都道府県の変換
- 簡単な Rails サポート

[Unreleased]: https://github.com/chocoby/jp_prefecture/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/chocoby/jp_prefecture/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/chocoby/jp_prefecture/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/chocoby/jp_prefecture/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/chocoby/jp_prefecture/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/chocoby/jp_prefecture/compare/v1.0.0.rc1...v1.0.0
[1.0.0.rc1]: https://github.com/chocoby/jp_prefecture/compare/v0.11.0...v1.0.0.rc1
[0.11.0]: https://github.com/chocoby/jp_prefecture/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/chocoby/jp_prefecture/compare/v0.9.0...v0.10.0
[0.9.0]: https://github.com/chocoby/jp_prefecture/compare/v0.8.1...v0.9.0
[0.8.1]: https://github.com/chocoby/jp_prefecture/compare/v0.8.0...v0.8.1
[0.8.0]: https://github.com/chocoby/jp_prefecture/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/chocoby/jp_prefecture/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/chocoby/jp_prefecture/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/chocoby/jp_prefecture/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/chocoby/jp_prefecture/compare/v0.3.2...v0.4.0
[0.3.2]: https://github.com/chocoby/jp_prefecture/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/chocoby/jp_prefecture/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/chocoby/jp_prefecture/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/chocoby/jp_prefecture/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/chocoby/jp_prefecture/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/chocoby/jp_prefecture/compare/v0.0.1...v0.1.0
[0.0.1]: https://github.com/chocoby/jp_prefecture/releases/tag/v0.0.1
