#!/usr/bin/env rake
# frozen_string_literal: true

require 'bundler/gem_tasks'

desc '郵便番号のデータを作成/更新する'
task :create_zip_code_data do
  require 'jp_prefecture/zip_mapping/generator'

  file_name = 'ken_all_utf8.csv'

  # download files
  `curl -O https://www.post.japanpost.jp/service/search/zipcode/download/kogaki/zip/ken_all.zip`
  `unzip ken_all.zip`
  `iconv -f sjis -t utf-8 KEN_ALL.CSV > #{file_name}`
  `rm ken_all.zip`
  `rm KEN_ALL.CSV`

  JpPrefecture::ZipMapping::Generator.new(file_name).write('data/zip.yml')

  # delete temporary file
  `rm #{file_name}`
end
