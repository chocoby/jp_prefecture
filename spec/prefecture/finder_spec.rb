# frozen_string_literal: true

require 'spec_helper'

describe JpPrefecture::Prefecture::Finder do
  describe '#find' do
    shared_examples '都道府県が見つかる' do |field, value, expected_result|
      let(:result) { JpPrefecture::Prefecture::Finder.new.find(field: field, value: value) }
      it { expect(result.name).to eq(expected_result) }
    end

    shared_examples '都道府県が見つからない' do |field, value|
      let(:result) { JpPrefecture::Prefecture::Finder.new.find(field: field, value: value) }
      it { expect(result).to be_nil }
    end

    describe 'field に all_fields (すべての項目) を指定する' do
      # area の「東北」が最初にマッチする
      it_behaves_like '都道府県が見つかる', :all_fields, '東', '青森県'
      it_behaves_like '都道府県が見つからない', :all_fields, '饂飩'
    end

    describe 'field に name (漢字表記) を指定する' do
      it_behaves_like '都道府県が見つかる', :name, '北海道', '北海道'
      it_behaves_like '都道府県が見つかる', :name, '東京', '東京都'
      it_behaves_like '都道府県が見つかる', :name, '京都', '京都府'
      it_behaves_like '都道府県が見つからない', :name, '饂飩'
    end

    describe 'field に name_e (英語表記) を指定する' do
      it_behaves_like '都道府県が見つかる', :name_e, 'HOKKAIDO', '北海道'
      it_behaves_like '都道府県が見つかる', :name_e, 'Hokkaido', '北海道'
      it_behaves_like '都道府県が見つかる', :name_e, 'hokkaido', '北海道'
      it_behaves_like '都道府県が見つからない', :name_e, 'Udon'
    end

    describe 'field に name_r (ローマ字表記) を指定する' do
      it_behaves_like '都道府県が見つかる', :name_r, 'HOKKAIDŌ', '北海道'
      it_behaves_like '都道府県が見つかる', :name_r, 'Hokkaidō', '北海道'
      it_behaves_like '都道府県が見つかる', :name_r, 'hokkaidō', '北海道'
      it_behaves_like '都道府県が見つからない', :name_r, 'Udōn'
    end

    describe 'field に name_h (ひらがな表記) を指定する' do
      it_behaves_like '都道府県が見つかる', :name_h, 'ほっかいどう', '北海道'
      it_behaves_like '都道府県が見つかる', :name_h, 'ほっかい', '北海道'
      it_behaves_like '都道府県が見つからない', :name_h, 'うどん'
    end

    describe 'field に name_k (カタカナ表記) を指定する' do
      it_behaves_like '都道府県が見つかる', :name_k, 'ホッカイドウ', '北海道'
      it_behaves_like '都道府県が見つかる', :name_k, 'ホッカイ', '北海道'
      it_behaves_like '都道府県が見つからない', :name_k, 'ウドン'
    end

    describe 'field に code (都道府県コード) を指定する' do
      it_behaves_like '都道府県が見つかる', :code, 1, '北海道'
      it_behaves_like '都道府県が見つかる', :code, '1', '北海道'
      it_behaves_like '都道府県が見つかる', :code, '01', '北海道'
      it_behaves_like '都道府県が見つからない', :code, 999
      it_behaves_like '都道府県が見つからない', :code, '999'
    end

    describe 'field に zip (郵便番号) を指定する' do
      it_behaves_like '都道府県が見つかる', :zip, 10_000, '北海道'
      it_behaves_like '都道府県が見つかる', :zip, '010000', '北海道'
      it_behaves_like '都道府県が見つからない', :zip, 999_999
      it_behaves_like '都道府県が見つからない', :zip, '999999'
    end

    describe 'field を指定しない' do
      it_behaves_like '都道府県が見つかる', nil, 1, '北海道'
      it_behaves_like '都道府県が見つかる', nil, '1', '北海道'
      it_behaves_like '都道府県が見つかる', nil, '01', '北海道'
      it_behaves_like '都道府県が見つからない', nil, 999
      it_behaves_like '都道府県が見つからない', nil, '999'
    end
  end
end
