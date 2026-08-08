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
      it { expect(pref.name_r).to eq('Hokkaidō') }
      it { expect(pref.name_h).to eq('ほっかいどう') }
      it { expect(pref.name_k).to eq('ホッカイドウ') }
      it { expect(pref.zips).to eq(JpPrefecture::ZipMapping.data[pref.code]) }
      it { expect(pref.area).to eq('北海道') }
      it { expect(pref.type).to eq('道') }
    end

    context 'カスタマイズしたマッピング情報に定義されていない項目が存在する' do
      before do
        JpPrefecture.setup do |config|
          config.mapping_data = YAML.load_file(File.join(File.dirname(__FILE__),
                                                         'fixtures/prefecture_without_values.yml'))
          config.zip_mapping_data = YAML.load_file(File.join(File.dirname(__FILE__), 'fixtures/zip_without_values.yml'))
        end
      end

      after do
        JpPrefecture.setup do |config|
          config.mapping_data = nil
          config.zip_mapping_data = nil
        end
      end

      let(:pref) { JpPrefecture::Prefecture.build_by_code(1) }
      it { expect(pref).to be_an_instance_of(JpPrefecture::Prefecture) }
      it { expect(pref.code).to eq(1) }
      it { expect(pref.name).to be_nil }
      it { expect(pref.name_e).to be_nil }
      it { expect(pref.name_r).to be_nil }
      it { expect(pref.name_h).to be_nil }
      it { expect(pref.name_k).to be_nil }
      it { expect(pref.zips).to be_nil }
      it { expect(pref.area).to be_nil }
      it { expect(pref.type).to be_nil }
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
    context '引数に Integer を指定' do
      before do
        finder = spy('finder')
        allow(JpPrefecture::Prefecture::Finder).to receive(:new).and_return(finder)
        JpPrefecture::Prefecture.find(1)
      end

      it { expect(JpPrefecture::Prefecture::Finder.new).to have_received(:find).with(field: nil, value: 1) }
    end

    context '引数に Hash を指定' do
      before do
        finder = spy('finder')
        allow(JpPrefecture::Prefecture::Finder).to receive(:new).and_return(finder)
        JpPrefecture::Prefecture.find(code: 1)
      end

      it { expect(JpPrefecture::Prefecture::Finder.new).to have_received(:find).with(field: :code, value: 1) }
    end

    context '引数に nil を指定' do
      let(:result) { JpPrefecture::Prefecture.find(nil) }
      it { expect(result).to be_nil }
    end
  end

  describe '.where' do
    context '名前系の項目を指定' do
      before do
        finder = spy('finder')
        allow(JpPrefecture::Prefecture::Finder).to receive(:new).and_return(finder)
        JpPrefecture::Prefecture.where(name: '山')
      end

      it { expect(JpPrefecture::Prefecture::Finder.new).to have_received(:where).with(field: :name, value: '山') }
    end

    context '複数の都道府県に一致' do
      let(:result) { JpPrefecture::Prefecture.where(name: '山') }
      it { expect(result.map(&:name)).to eq(%w[山形県 山梨県 山口県]) }
    end

    context '対応していない項目を指定' do
      it { expect { JpPrefecture::Prefecture.where(code: 1) }.to raise_error(ArgumentError) }
      it { expect { JpPrefecture::Prefecture.where(zip: 1_000_000) }.to raise_error(ArgumentError) }
      it { expect { JpPrefecture::Prefecture.where(all_fields: '東') }.to raise_error(ArgumentError) }
      it { expect { JpPrefecture::Prefecture.where(name_j: '山') }.to raise_error(ArgumentError) }
    end

    context '項目を複数指定' do
      it { expect { JpPrefecture::Prefecture.where(name: '山', name_e: 'y') }.to raise_error(ArgumentError) }
    end

    context '空の Hash を指定' do
      it { expect { JpPrefecture::Prefecture.where({}) }.to raise_error(ArgumentError) }
    end

    context 'Hash 以外を指定' do
      it { expect { JpPrefecture::Prefecture.where('山') }.to raise_error(ArgumentError) }
      it { expect { JpPrefecture::Prefecture.where(nil) }.to raise_error(ArgumentError) }
    end
  end
end
