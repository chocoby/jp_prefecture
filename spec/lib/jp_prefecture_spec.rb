# coding: utf-8
require 'spec_helper'

describe JpPrefecture do
  describe '.include' do
    subject do
      Class.new(ActiveRecord::Base) do
        include JpPrefecture
      end
    end

    it { should respond_to(:jp_prefecture) }
  end
end
