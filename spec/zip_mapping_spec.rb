# frozen_string_literal: true

require 'spec_helper'

describe JpPrefecture::ZipMapping do
  describe '.data' do
    it '都道府県の数が47であること' do
      expect(described_class.data.count).to eq 47
    end
  end

  describe '.code_for_zip' do
    context 'カスタムの zip_mapping_data を設定したとき' do
      before do
        JpPrefecture.setup do |config|
          config.zip_mapping_data = { 1 => [[10_000, 70_895]] }
        end
      end

      after do
        JpPrefecture.setup do |config|
          config.zip_mapping_data = nil
        end
      end

      it '範囲の端点を検索できること' do
        expect(described_class.code_for_zip(10_000)).to eq 1
      end

      it '範囲内の郵便番号を検索できること' do
        expect(described_class.code_for_zip(50_000)).to eq 1
      end

      it '範囲外の郵便番号は見つからないこと' do
        expect(described_class.code_for_zip(80_000)).to be_nil
      end
    end
  end
end
