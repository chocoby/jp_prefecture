# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Mapping do
  describe '.data' do
    it '都道府県の数が47であること' do
      described_class.data.count.should eq 47
    end
  end
end
