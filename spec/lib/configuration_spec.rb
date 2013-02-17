# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Configuration do
  before do
    @model_class = Class.new(ActiveRecord::Base) do
      self.abstract_class = true
    end
  end

  describe '#initialize' do
    describe 'モデルクラスについて' do
      before { @config = JpPrefecture::Configuration.new(@model_class) }
      it { @config.model_class.should eq @model_class }
    end
  end
end
