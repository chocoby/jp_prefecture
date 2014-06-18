# coding: utf-8
require 'spec_helper'

describe JpPrefecture::ZipMapping do
  describe '.data' do
    it '都道府県の数が47であること' do
      expect(described_class.data.count).to eq 47
    end
  end
end
