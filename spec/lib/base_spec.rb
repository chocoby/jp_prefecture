# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Base do
  describe '#jp_prefecture' do
    before do
      @model_class = Class.new(ActiveRecord::Base) do
        self.abstract_class = true
        include JpPrefecture
        jp_prefecture 'aiueo'
      end
    end

    it { @model_class.jp_prefecture_config.column_name.should eq :aiueo }
  end
end
