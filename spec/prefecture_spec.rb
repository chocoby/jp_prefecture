# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build' do
    before { @pref = JpPrefecture::Prefecture.build([1, '北海道']) }
    it { @pref.code.should eq 1 }
    it { @pref.name.should eq '北海道' }
  end

  describe '.find' do
    context '都道府県が見つかった' do
      before { @pref = JpPrefecture::Prefecture.find(1) }
      it { @pref.code.should eq 1 }
      it { @pref.name.should eq '北海道' }
    end

    context '都道府県が見つからなかった' do
      it { JpPrefecture::Prefecture.find(999).should be_nil }
    end
  end

  describe '.all' do
    before { @prefs = JpPrefecture::Prefecture.all }
    it { @prefs.count.should eq 47 }
    it { @prefs.first.should be_an_instance_of(JpPrefecture::Prefecture) }
  end
end
