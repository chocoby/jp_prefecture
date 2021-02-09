# frozen_string_literal: true

require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build_by_code' do
    context '都道府県が見つかる' do
      let(:pref) { JpPrefecture::Prefecture.build_by_code(1) }
      it { expect(pref).to be_an_instance_of(JpPrefecture::Prefecture) }
      it { expect(pref.code).to eq(1) }
      it { expect(pref.name).to eq('北海道') }
      it { expect(pref.name_e).to eq('Hokkaido') }
      it { expect(pref.name_h).to eq('ほっかいどう') }
      it { expect(pref.name_k).to eq('ホッカイドウ') }
      it { expect(pref.zips).to eq(JpPrefecture::ZipMapping.data[pref.code]) }
      it { expect(pref.area).to eq('北海道') }
      it { expect(pref.type).to eq('道') }
    end

    context '都道府県が見つからない' do
      let(:pref) { JpPrefecture::Prefecture.build_by_code(99) }
      it { expect(pref).to be_nil }
    end
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
