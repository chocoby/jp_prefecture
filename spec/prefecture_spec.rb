# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build' do
    let(:pref) { JpPrefecture::Prefecture.build(1, '北海道', 'Hokkaido') }
    it { pref.code.should eq 1 }
    it { pref.name.should eq '北海道' }
    it { pref.name_e.should eq 'Hokkaido' }
    it { pref.zips.should eq [10000..70895, 400000..996509] }
  end

  describe '.find' do
    describe '検索結果について' do
      shared_examples "都道府県が見つかる" do |arg|
        let(:pref) { JpPrefecture::Prefecture.find(arg) }
        it { pref.code.should eq 1 }
        it { pref.name.should eq '北海道' }
        it { pref.name_e.should eq 'Hokkaido' }
        it { pref.zips.should eq [10000..70895, 400000..996509] }
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

      describe '都道府県名(前方一致)' do
        let(:pref) { JpPrefecture::Prefecture.find(name: '東京') }
        it { expect(pref.name).to eq '東京都' }

        let(:pref2) { JpPrefecture::Prefecture.find(name: '京都') }
        it { expect(pref2.name).to eq '京都府' }

        context 'マッチする都道府県が複数あった場合' do
          let(:pref) { JpPrefecture::Prefecture.find(name: '宮') }
          it { expect(pref.name).to eq '宮城県' }
        end

        context 'マッチする都道府県が複数あった場合(英語表記)' do
          let(:pref) { JpPrefecture::Prefecture.find(name: 'miya') }
          it { expect(pref.name_e).to eq 'Miyagi' }

          let(:pref2) { JpPrefecture::Prefecture.find(name: 'Miya') }
          it { expect(pref2.name_e).to eq 'Miyagi' }
        end
      end
    end

    describe '渡した変数について' do
      context 'string の場合' do
        it '値が変更されないこと' do
          code = '1'
          JpPrefecture::Prefecture.find(code)
          code.should eq '1'
        end
      end

      context 'code が string の場合' do
        it '値が変更されないこと' do
          code = '1'
          JpPrefecture::Prefecture.find(code: code)
          code.should eq '1'
        end
      end

      context 'name の場合' do
        it '値が変更されないこと' do
          name = 'hokkaido'
          JpPrefecture::Prefecture.find(name: name)
          name.should eq 'hokkaido'
        end
      end

      context 'zip の場合' do
        it '値が変更されないこと' do
          zip = '9999999'
          JpPrefecture::Prefecture.find(zip: zip)
          zip.should eq '9999999'
        end
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
