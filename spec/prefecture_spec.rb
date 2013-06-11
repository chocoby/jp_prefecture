# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build' do
    let(:pref) { JpPrefecture::Prefecture.build(1, '北海道', 'Hokkaido') }
    it { pref.code.should eq 1 }
    it { pref.name.should eq '北海道' }
    it { pref.name_e.should eq 'Hokkaido' }
  end

  describe '.find' do
    describe '検索結果について' do
      shared_examples "都道府県が見つかる" do |arg|
        let(:pref) { JpPrefecture::Prefecture.find(arg) }
        it { pref.code.should eq 1 }
        it { pref.name.should eq '北海道' }
        it { pref.name_e.should eq 'Hokkaido' }
      end

      shared_examples '都道府県が見つからない' do |arg|
        let(:pref) { JpPrefecture::Prefecture.find(arg) }
        it { pref.should be_nil }
      end

      describe '都道府県コード' do
        it_behaves_like "都道府県が見つかる", 1
        it_behaves_like "都道府県が見つからない", 99
        it_behaves_like "都道府県が見つかる", "1"
        it_behaves_like "都道府県が見つかる", "01"
        it_behaves_like "都道府県が見つからない", "99"
      end

      describe '都道府県コード(キーワード引数)' do
        it_behaves_like "都道府県が見つかる", code: 1
        it_behaves_like "都道府県が見つからない", code: 99
        it_behaves_like "都道府県が見つかる", code: "1"
        it_behaves_like "都道府県が見つかる", code: "01"
        it_behaves_like "都道府県が見つからない", code: "99"
      end

      describe '都道府県名' do
        it_behaves_like "都道府県が見つかる", name: "北海道"
        it_behaves_like "都道府県が見つからない", name: "うどん県"
      end

      describe '都道府県名(英語表記)' do
        it_behaves_like "都道府県が見つかる", name: "Hokkaido"
        it_behaves_like "都道府県が見つからない", name: "Udon"
      end

      describe '都道府県名(英語表記-小文字)' do
        it_behaves_like "都道府県が見つかる", name: "hokkaido"
        it_behaves_like "都道府県が見つからない", name: "udon"
      end
    end
  end

  describe '.all' do
    let(:prefs) { JpPrefecture::Prefecture.all }
    it { prefs.first.should be_an_instance_of(JpPrefecture::Prefecture) }
    it '都道府県の数が 47 であること' do
      prefs.count.should eq 47
    end
  end
end
