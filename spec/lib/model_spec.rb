# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Model do
  describe '#prefecture' do
    describe 'カラム名の指定について' do
      context 'prefecture_code' do
        before do
          class Place < ActiveRecord::Base
            include JpPrefecture
            jp_prefecture :prefecture_code
          end

          @model_class = Place.new(:prefecture_code => 1)
        end

        it { @model_class.prefecture.name.should eq '北海道' }
      end

      context 'prefecture_id' do
        before do
          class Place < ActiveRecord::Base
            include JpPrefecture
            jp_prefecture :prefecture_id
          end

          @model_class = Place.new(:prefecture_id => 1)
        end

        it { @model_class.prefecture.name.should eq '北海道' }
      end
    end

    describe '検索について' do
      before do
        class Place < ActiveRecord::Base
          include JpPrefecture
          jp_prefecture :prefecture_code
        end
      end

      context '都道府県が見つかった' do
        before do
          @model_class = Place.new(:prefecture_code => 1)
        end

        it { @model_class.should respond_to(:prefecture) }
        it { @model_class.prefecture.should be_an_instance_of(JpPrefecture::Prefecture) }
        it { @model_class.prefecture.name.should eq '北海道' }
      end

      context '都道府県が見つからなかった' do
        before do
          @model_class = Place.new(:prefecture_code => 999)
        end

        it { @model_class.should respond_to(:prefecture) }
        it { @model_class.prefecture.should be_nil }
      end
    end
  end
end
