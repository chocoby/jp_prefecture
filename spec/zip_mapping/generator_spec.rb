# frozen_string_literal: true

require 'spec_helper'
require 'jp_prefecture/zip_mapping/generator'
require 'tempfile'

describe JpPrefecture::ZipMapping::Generator do
  def build_csv(rows)
    file = Tempfile.new(['ken_all', '.csv'])
    rows.each do |zip, prefecture|
      file.puts %(01101,"#{zip[0, 3]}  ","#{zip}","ｶﾅ","ｶﾅ","ｶﾅ","#{prefecture}","市区町村","町域",0,0,0,0,0,0)
    end
    file.close
    file
  end

  describe '#prefecture_zip_ranges' do
    it '同一都道府県の郵便番号が 1 つのレンジに畳まれること' do
      csv = build_csv([%w[0600000 北海道], %w[0600001 北海道], %w[0600002 北海道]])
      ranges = described_class.new(csv.path).prefecture_zip_ranges

      expect(ranges).to eq(1 => [[600_000, 600_002]])
    end

    it '都道府県が切り替わるとレンジが分かれること' do
      csv = build_csv([%w[0600000 北海道], %w[0300000 青森県]])
      ranges = described_class.new(csv.path).prefecture_zip_ranges

      expect(ranges).to eq(1 => [[600_000, 600_000]], 2 => [[300_000, 300_000]])
    end

    it '複数の都道府県が同じ郵便番号を共有する場合、CSV の行順によらず同じ結果になること' do
      rows = [%w[4970058 愛知県], %w[4980000 愛知県], %w[4980000 三重県], %w[4980001 愛知県]]
      ranges = described_class.new(build_csv(rows).path).prefecture_zip_ranges
      reversed_ranges = described_class.new(build_csv(rows.reverse).path).prefecture_zip_ranges

      expect(reversed_ranges).to eq ranges
    end

    it '共有される郵便番号は都道府県コードの昇順でレンジに畳まれること' do
      csv = build_csv([%w[4970058 愛知県], %w[4980000 三重県], %w[4980000 愛知県], %w[4980001 愛知県]])
      ranges = described_class.new(csv.path).prefecture_zip_ranges

      expect(ranges).to eq(23 => [[4_970_058, 4_980_000], [4_980_001, 4_980_001]], 24 => [[4_980_000, 4_980_000]])
    end
  end

  describe '#write' do
    it 'ヘッダコメント付きの YAML を出力すること' do
      csv = build_csv([%w[0600000 北海道]])
      output = Tempfile.new(['zip', '.yml'])
      described_class.new(csv.path).write(output.path)

      lines = File.readlines(output.path)
      expect(lines[0]).to eq "# { prefecture_code: [[from_zip_1, to_zip_1], [from_zip_2, to_zip_2], ...], ... }\n"
      expect(lines[1]).to match(/\A# Last updated: .+ UTC\n\z/)
      expect(YAML.safe_load(File.read(output.path))).to eq(1 => [[600_000, 600_000]])
    end
  end
end
