# frozen_string_literal: true

require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build' do
    let(:pref) { JpPrefecture::Prefecture.build(1, '北海道', 'Hokkaido', 'ほっかいどう', 'ホッカイドウ', '北海道') }
    it { expect(pref.code).to eq 1 }
    it { expect(pref.name).to eq '北海道' }
    it { expect(pref.name_e).to eq 'Hokkaido' }
    it { expect(pref.name_h).to eq 'ほっかいどう' }
    it { expect(pref.name_k).to eq 'ホッカイドウ' }
    it { expect(pref.zips).to eq [10_000..70_895, 400_000..996_509] }
    it { expect(pref.area).to eq '北海道' }
    it { expect(pref.type).to eq '道' }

    let(:nil_type_pref) { JpPrefecture::Prefecture.build(13, '東京', 'Tokyo', 'とうきょう', 'トウキョウ', '関東') }
    it { expect(nil_type_pref.code).to eq 13 }
    it { expect(nil_type_pref.name).to eq '東京' }
    it { expect(nil_type_pref.name_e).to eq 'Tokyo' }
    it { expect(nil_type_pref.name_h).to eq 'とうきょう' }
    it { expect(nil_type_pref.name_k).to eq 'トウキョウ' }
    it { expect(nil_type_pref.zips).to eq [1_000_000..2_080_035] }
    it { expect(nil_type_pref.area).to eq '関東' }
    it { expect(nil_type_pref.type).to eq nil }
  end

  describe '.all' do
    let(:prefs) { JpPrefecture::Prefecture.all }
    it { expect(prefs.first).to be_an_instance_of(JpPrefecture::Prefecture) }
    it '都道府県の数が 47 であること' do
      expect(prefs.count).to eq 47
    end
  end

  describe '.find' do
    before do
      finder = spy('finder')
      allow(JpPrefecture::Prefecture::Finder).to receive(:new).and_return(finder)
    end

    context '引数に Integer を指定' do
      before { JpPrefecture::Prefecture.find(1) }
      it { expect(JpPrefecture::Prefecture::Finder.new).to have_received(:find).with(field: nil, value: 1) }
    end

    context '引数に Hash を指定' do
      before { JpPrefecture::Prefecture.find(code: 1) }
      it { expect(JpPrefecture::Prefecture::Finder.new).to have_received(:find).with(field: :code, value: 1) }
    end

    context '引数に nil を指定' do
      let(:result) { JpPrefecture::Prefecture.find(nil) }
      it { expect(result).to be_nil }
    end
  end
end
