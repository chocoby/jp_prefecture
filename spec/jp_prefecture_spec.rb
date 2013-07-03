# coding: utf-8
require 'spec_helper'

describe JpPrefecture do
  describe '.included' do
    subject do
      Class.new(ActiveRecord::Base) do
        include JpPrefecture
      end
    end

    it { should respond_to(:jp_prefecture) }
  end

  describe 'include されていない' do
    subject { Class.new(ActiveRecord::Base) }
    it { should_not respond_to(:jp_prefecture) }
  end

  describe '.setup' do
    before do
      filepath = File.join(File.dirname(__FILE__), 'fixtures/prefecture.yml')
      JpPrefecture.setup do |config|
        config.mapping_data = YAML.load_file filepath
      end
    end

    after do
      JpPrefecture.setup do |config|
        config.mapping_data = nil
      end
    end

    it { JpPrefecture::Mapping.data.count.should eq 48 }
  end
end
