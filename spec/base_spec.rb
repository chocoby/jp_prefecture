# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Base do
  describe '#jp_prefecture' do
    describe 'カラム名の指定について' do
      context 'prefecture_code を指定した場合' do
        let(:model_class) do
          klass = Class.new(ActiveRecord::Base) do
            self.table_name = :places
            include JpPrefecture
            jp_prefecture :prefecture_code
          end

          klass.new(prefecture_code: 1)
        end

        it 'prefecture_code のコードが変換できること' do
          expect(model_class.prefecture.name).to eq '北海道'
        end
      end

      context 'prefecture_id を指定した場合' do
        let(:model_class) do
          klass = Class.new(ActiveRecord::Base) do
            self.table_name = :places
            include JpPrefecture
            jp_prefecture :prefecture_id
          end

          klass.new(prefecture_id: 1)
        end

        it 'prefecture_id のコードが変換できること' do
          expect(model_class.prefecture.name).to eq '北海道'
        end
      end
    end

    describe '生成するメソッド名の指定について' do
      context 'prefecture_method を指定した場合' do
        let(:model_class) do
          klass = Class.new(ActiveRecord::Base) do
            self.table_name = :places
            include JpPrefecture
            jp_prefecture :prefecture_code, method_name: :prefecture_method
          end

          klass.new(prefecture_code: 1)
        end

        it 'prefecture_method で結果が参照できること' do
          expect(model_class.prefecture_method.name).to eq '北海道'
        end
      end
    end

    describe '都道府県の検索について' do
      let(:klass) do
        Class.new(ActiveRecord::Base) do
          self.table_name = :places
          include JpPrefecture
          jp_prefecture :prefecture_code
        end
      end

      context '都道府県が見つかった場合' do
        let(:model_class) { klass.new(prefecture_code: 1) }
        it { expect(model_class).to respond_to(:prefecture) }
        it { expect(model_class.prefecture).to be_an_instance_of(JpPrefecture::Prefecture) }
        it { expect(model_class.prefecture.name).to eq '北海道' }
      end

      context '都道府県が見つからなかった場合' do
        let(:model_class) { klass.new(prefecture_code: 99) }
        it { expect(model_class).to respond_to(:prefecture) }
        it { expect(model_class.prefecture).to be_nil }
      end
    end
  end
end
