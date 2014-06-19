#!/usr/bin/env rake
# coding: utf-8
require "bundler/gem_tasks"

task default: [:spec]
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = %w(--format documentation --color)
  end
rescue LoadError => e
end

desc 'zip.yml を作成します'
task :create_zips do
  require 'csv'
  require 'jp_prefecture'

  file_name = 'ken_all_utf8.csv'

  # download files
  `wget http://www.post.japanpost.jp/zipcode/dl/kogaki/lzh/ken_all.lzh`
  `lha x ken_all.lzh`
  `iconv -f sjis -t utf-8 ken_all.csv > #{file_name}`
  `rm ken_all.lzh`
  `rm ken_all.csv`

  zips = []

  # read CSV
  CSV.foreach(file_name, headers: false) { |line| zips << [line[2], line[6]] }

  # create sorted list of zips -> prefecture_code
  zips = zips
    .collect { |zip, prefecture| [zip.to_i, JpPrefecture::Prefecture.find(name: prefecture).code] }
    .sort{ |x, y| x[0] <=> y[0] }

  # prepare calculation
  ranged_zips = []
  current = [ zips.first[0], zips.first[0], zips.first[1] ]

  # calculate the zip ranges of each prefecture
  zips.each do |zip, code|
    if current[2] == code
      current[1] = zip
    else
      ranged_zips << current
      current = [zip, zip, code]
    end
  end

  # add last prefecture
  ranged_zips << current

  # create prefecture hash
  prefectures_to_zip = {}

  ranged_zips.each do |r0, r1, code|
    prefectures_to_zip[code] ||= []
    prefectures_to_zip[code] << [r0, r1]
  end

  prefectures_to_zip = Hash[*prefectures_to_zip.sort.flatten(1)]

  # save result
  File.open('data/zip.yml', 'w') do |file|
    file.write "# { prefecture_code: [[from_zip_1, to_zip_1], [from_zip_2, to_zip_2], ...], ... }\n"
    file.write prefectures_to_zip.to_yaml
  end

  # delete temporary file
  `rm #{file_name}`
end
