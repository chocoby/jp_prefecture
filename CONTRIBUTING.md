# Contributing

## 開発手順

以下の手順で環境を構築します。

```
git clone https://github.com/chocoby/jp_prefecture.git
cd jp_prefecture
```

## テストの実行

ローカル環境ですべてのバージョンをテストするのは難しいため、最新のバージョンのテストがパスすることを最低限確認してください。

特定バージョンの Active Record でテストを実行するには、以下のようにします。

```
# Rails 5.0
BUNDLE_GEMFILE=gemfiles/rails-5-0.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-5-0.gemfile bundle exec rspec

# Rails 5.1
BUNDLE_GEMFILE=gemfiles/rails-5-1.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-5-1.gemfile bundle exec rspec

# Rails 5.2
BUNDLE_GEMFILE=gemfiles/rails-5-2.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-5-2.gemfile bundle exec rspec

# Rails 6.0
BUNDLE_GEMFILE=gemfiles/rails-6-0.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-6-0.gemfile bundle exec rspec

# Rails 6.1
BUNDLE_GEMFILE=gemfiles/rails-6-1.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-6-1.gemfile bundle exec rspec

# Rails 7.0
BUNDLE_GEMFILE=gemfiles/rails-7-0.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-7-0.gemfile bundle exec rspec

# Rails 7.1
BUNDLE_GEMFILE=gemfiles/rails-7-1.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-7-1.gemfile bundle exec rspec

# Rails 7.2
BUNDLE_GEMFILE=gemfiles/rails-7-2.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-7-2.gemfile bundle exec rspec

# Rails 8.0
BUNDLE_GEMFILE=gemfiles/rails-8-0.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-8-0.gemfile bundle exec rspec

# Rails 8.1
BUNDLE_GEMFILE=gemfiles/rails-8-1.gemfile bundle install
BUNDLE_GEMFILE=gemfiles/rails-8-1.gemfile bundle exec rspec
```

## Lint の実行

RuboCop でコーディングスタイルをチェックします。警告が出る場合は修正します。

```
bundle exec rubocop -A
```

## リリース手順

1. `lib/jp_prefecture/version.rb` のバージョンを変更
   - バージョニングは [セマンティックバージョニング](https://semver.org/lang/ja/) に則る
1. `CHANGELOG.md` を編集
1. main ブランチに対して Pull Request を作成
   - CI がパスしたらマージ
1. Gem をリリース
   ```
   gem build
   gem push jp_prefecture-X.Y.Z.gem
   ```
1. [Releases](https://github.com/chocoby/jp_prefecture/releases) でリリースを作成
   - 内容は `CHANGELOG.md` と同様


## 都道府県の郵便番号データの更新

以下のタスクを実行します。変更がある場合は `data/zip.yml` に差分が発生します。

```
$ bundle exec rake create_zip_code_data
```
