# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build' do
    let(:pref) { JpPrefecture::Prefecture.build(1, '北海道', 'Hokkaido', 'ほっかいどう', 'ホッカイドウ', '北海道') }
    it { expect(pref.code).to eq 1 }
    it { expect(pref.name).to eq '北海道' }
    it { expect(pref.name_e).to eq 'Hokkaido' }
    it { expect(pref.name_h).to eq 'ほっかいどう' }
    it { expect(pref.name_k).to eq 'ホッカイドウ' }
    it { expect(pref.zips).to eq [10000..70895, 400000..996509] }
    it { expect(pref.area).to eq '北海道' }
    it { expect(pref.type).to eq '道' }

    let(:nil_type_pref) { JpPrefecture::Prefecture.build(13, '東京', 'Tokyo', 'とうきょう', 'トウキョウ', '関東') }
    it { expect(nil_type_pref.code).to eq 13 }
    it { expect(nil_type_pref.name).to eq '東京' }
    it { expect(nil_type_pref.name_e).to eq 'Tokyo' }
    it { expect(nil_type_pref.name_h).to eq 'とうきょう' }
    it { expect(nil_type_pref.name_k).to eq 'トウキョウ' }
    it { expect(nil_type_pref.zips).to eq [1000000..2080035] }
    it { expect(nil_type_pref.area).to eq '関東' }
    it { expect(nil_type_pref.type).to eq nil }
  end

  describe '.find' do
    describe '検索結果について' do
      shared_examples "都道府県が見つかる" do |arg|
        let(:pref) { JpPrefecture::Prefecture.find(arg) }
        it { expect(pref.code).to eq 1 }
        it { expect(pref.name).to eq '北海道' }
        it { expect(pref.name_e).to eq 'Hokkaido' }
        it { expect(pref.name_h).to eq 'ほっかいどう' }
        it { expect(pref.name_k).to eq 'ホッカイドウ' }
        it { expect(pref.zips).to eq [10000..70895, 400000..996509] }
        it { expect(pref.area).to eq '北海道' }
        it { expect(pref.type).to eq '道' }
      end

      shared_examples '都道府県が見つからない' do |arg|
        let(:pref) { JpPrefecture::Prefecture.find(arg) }
        it { expect(pref).to be_nil }
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

      describe '都道府県名(ひらがな表記)' do
        it_behaves_like "都道府県が見つかる", name: "ほっかいどう"
        it_behaves_like "都道府県が見つからない", name: "うどん"
      end

      describe '都道府県名(カタカナ表記)' do
        it_behaves_like "都道府県が見つかる", name: "ホッカイドウ"
        it_behaves_like "都道府県が見つからない", name: "ウドン"
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

        context 'マッチする都道府県が複数あった場合(ひらがな表記)' do
          let(:pref) { JpPrefecture::Prefecture.find(name: 'みや') }
          it { expect(pref.name_h).to eq 'みやぎけん' }
        end

        context 'マッチする都道府県が複数あった場合(カタカナ表記)' do
          let(:pref) { JpPrefecture::Prefecture.find(name: 'ミヤ') }
          it { expect(pref.name_k).to eq 'ミヤギケン' }
        end
      end
    end

    describe '渡した変数について' do
      context 'string の場合' do
        it '値が変更されないこと' do
          code = '1'
          JpPrefecture::Prefecture.find(code)
          expect(code).to eq '1'
        end
      end

      context 'code が string の場合' do
        it '値が変更されないこと' do
          code = '1'
          JpPrefecture::Prefecture.find(code: code)
          expect(code).to eq '1'
        end
      end

      context 'name の場合' do
        it '値が変更されないこと' do
          name = 'hokkaido'
          JpPrefecture::Prefecture.find(name: name)
          expect(name).to eq 'hokkaido'
        end

        context '空の文字列が与えられた場合' do
          it 'nilを返すこと' do
            actual = JpPrefecture::Prefecture.find(name: '')
            expect(actual).to be_nil
          end
        end

        context 'nilが与えられた場合' do
          it 'nilを返すこと' do
            actual = JpPrefecture::Prefecture.find(name: nil)
            expect(actual).to be_nil
          end
        end
      end

      context 'zip の場合' do
        it '値が変更されないこと' do
          zip = '9999999'
          JpPrefecture::Prefecture.find(zip: zip)
          expect(zip).to eq '9999999'
        end
      end
    end
  end

  describe '.all' do
    let(:prefs) { JpPrefecture::Prefecture.all }
    it { expect(prefs.first).to be_an_instance_of(JpPrefecture::Prefecture) }
    it '都道府県の数が 47 であること' do
      expect(prefs.count).to eq 47
    end
  end
end
