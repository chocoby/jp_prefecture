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

gem の公開は GitHub Actions の `release` ワークフローが行います。ローカルで `gem push` を実行する必要はありません。

1. `lib/jp_prefecture/version.rb` のバージョンを変更
   - バージョニングは [セマンティックバージョニング](https://semver.org/lang/ja/) に則る
1. `CHANGELOG.md` の `## Unreleased` を `## X.Y.Z (YYYY-MM-DD)` に変更
   - リリースノートはこの節の内容がそのまま使われる
1. main ブランチに対して Pull Request を作成
   - CI がパスしたらマージ
1. [Releases](https://github.com/chocoby/jp_prefecture/releases) で新しいリリースを作成
   - タグに `vX.Y.Z` を指定する。タグはこの操作で作成されるため、ローカルでタグを打つ必要はない
   - **本文は空のまま Publish する**
1. [Actions](https://github.com/chocoby/jp_prefecture/actions) で `release` environment の承認を行う
   - 承認前にタグとバージョンの一致検証、RuboCop、RSpec が実行される
   - 承認すると gem が RubyGems.org に公開され、その後リリースノートが `CHANGELOG.md` の内容で自動的に埋まる


## 都道府県の郵便番号データの更新

以下のタスクを実行します。変更がある場合は `data/zip.yml` に差分が発生します。

```
$ bundle exec rake create_zip_code_data
```
