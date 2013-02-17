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

  describe '.extended' do
    subject do
      Class.new(ActiveRecord::Base) do
        extend JpPrefecture
      end
    end

    it { should respond_to(:jp_prefecture) }
  end

  describe 'include されていない' do
    subject { Class.new(ActiveRecord::Base) }
    it { should_not respond_to(:jp_prefecture) }
  end
end
