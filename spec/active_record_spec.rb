# coding: utf-8
require 'spec_helper'

class Place < ActiveRecord::Base
  include JpPrefecture
  jp_prefecture
end

describe ActiveRecord do
  describe 'include されていない' do
    before { @klass = Class.new(ActiveRecord::Base) }
    it { @klass.should_not respond_to(:jp_prefecture) }
  end

  describe '普通のモデル' do
    context '都道府県が見つかった場合' do
      before do
        @model_class = Place.new(:prefecture_code => 1)
      end

      it { @model_class.should respond_to(:prefecture) }
      it { @model_class.prefecture.should be_an_instance_of(JpPrefecture::Prefecture) }
      it { @model_class.prefecture.name.should eq '北海道' }
    end

    context '都道府県が見つからなかった場合' do
      before do
        @model_class = Place.new(:prefecture_code => 999)
      end

      it { @model_class.should respond_to(:prefecture) }
      it { @model_class.prefecture.should be_nil }
    end
  end
end
