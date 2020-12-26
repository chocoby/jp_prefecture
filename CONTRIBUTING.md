# Contributing

## 開発手順

以下の手順で環境を構築します。

```
git clone https://github.com/chocoby/jp_prefecture.git
cd jp_prefecture
bundle install
bundle exec appraisal install
```

実装と実装に対応するテストを追加し、Pull Request を作成する前に、ユニットテストとコーディングスタイルがパスするか確認します。

```
bundle exec appraisal rspec
bundle exec rubocop -A
```

特定バージョンの Active Record でテストを実行するには、以下のようにします。

```
# バージョン 6.1 で実行する例
bundle exec appraisal rails61 rspec
```

## リリース手順

1. `lib/jp_prefecture/version.rb` のバージョンを変更
   - バージョニングは [セマンティックバージョニング](https://semver.org/lang/ja/) に則る
1. `CHANGELOG.md` を編集
1. master ブランチに対して Pull Request を作成
   - CI がパスしたらマージ
1. Gem をリリース
   ```
   gem build
   gem push jp_prefecture-X.Y.Z.gem
   ```
1. [Releases](https://github.com/chocoby/jp_prefecture/releases) でリリースを作成
   - 内容は `CHANGELOG.md` と同様
