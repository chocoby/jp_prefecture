# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Config do
  describe '#mapping_data' do
    context 'カスタマイズされたprefecture.ymlを使うとき' do
      before do
        filepath = File.join(File.dirname(__FILE__), 'fixtures/prefecture.yml')
        @config = described_class.new
        @config.mapping_data = YAML.load_file filepath
      end

      it '都道府県＋海外の数が48であること' do
        expect(@config.mapping_data.count).to eq 48
      end
    end
  end
end
